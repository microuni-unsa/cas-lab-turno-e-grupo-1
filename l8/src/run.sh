#!/usr/bin/env bash
#
# Ejecucion del plan de pruebas de rendimiento BlazeDemo del laboratorio 8.
#
# Muestra de verificacion, ejecucion breve contra el sitio real:
#   THREADS=2 LOOPS=2 ./run.sh
# generada a partir de l8/src/EjemploBlaze.jmx con 2 hilos y 2 repeticiones
# por hilo, equivalente a 8 peticiones en total. La salida de consola y el
# resumen por peticion se guardan en l8/src/results-summary.txt.
#
# Carrera completa, reservada para la presentacion del informe:
#   THREADS=10 LOOPS=100 RAMPUP=10 ./run.sh
# reproduce la configuracion del grupo de hilos del archivo EjemploBlaze.jmx,
# con 10 hilos y 100 repeticiones por hilo, equivalente a 2000 peticiones.
# Esta carrera completa tarda varios minutos y genera carga real sobre el
# sitio de demostracion, por lo cual solo se ejecuta una vez con
# autorizacion del docente.
#
# El plan EjemploBlaze.jmx tambien se abre en la interfaz grafica de JMeter
# con el comando jmeter -t EjemploBlaze.jmx para inspeccionar el grupo de
# hilos y observar los receptores Graph Results y Summary Report.
#
set -euo pipefail
cd "$(dirname "$0")"

PLAN="EjemploBlaze.jmx"
THREADS="${THREADS:-2}"
LOOPS="${LOOPS:-2}"
RAMPUP="${RAMPUP:-2}"
OUT_DIR="resultados-verificacion"
SUMMARY="results-summary.txt"

if command -v jmeter >/dev/null 2>&1; then
  JMETER=(jmeter)
else
  JMETER=(nix shell nixpkgs#jmeter --command jmeter)
fi

SAMPLE="$(mktemp /tmp/EjemploBlaze-sample-XXXX.jmx)"
trap 'rm -f "$SAMPLE"' EXIT
sed -e "s|<intProp name=\"ThreadGroup.num_threads\">10</intProp>|<intProp name=\"ThreadGroup.num_threads\">${THREADS}</intProp>|" \
    -e "s|<stringProp name=\"LoopController.loops\">100</stringProp>|<stringProp name=\"LoopController.loops\">${LOOPS}</stringProp>|" \
    -e "s|<intProp name=\"ThreadGroup.ramp_time\">10</intProp>|<intProp name=\"ThreadGroup.ramp_time\">${RAMPUP}</intProp>|" \
  "$PLAN" > "$SAMPLE"

rm -rf "$OUT_DIR"
mkdir -p "$OUT_DIR"

{
  echo "Plan: $PLAN"
  echo "Hilos: $THREADS, repeticiones por hilo: $LOOPS, aceleracion en segundos: $RAMPUP"
  echo
  "${JMETER[@]}" -n -t "$SAMPLE" -l "$OUT_DIR/resultados.jtl" -j "$OUT_DIR/jmeter.log"
  echo
  echo "Resumen por peticion a partir de $OUT_DIR/resultados.jtl:"
  awk -F, 'NR > 1 { n[$3]++; t[$3] += $2; if (!(($3) in mn)) { mn[$3] = $2; mx[$3] = $2 } else { if ($2 < mn[$3]) mn[$3] = $2; if ($2 > mx[$3]) mx[$3] = $2 } if ($8 == "false") e[$3]++ } END { for (k in n) printf "%s: muestras=%d errores=%d promedio=%.0f ms minimo=%d ms maximo=%d ms\n", k, n[k], e[k]+0, t[k]/n[k], mn[k], mx[k] }' "$OUT_DIR/resultados.jtl"
} 2>&1 | tee "$SUMMARY"
