#!/usr/bin/env bash
#
# Ejecucion de los diez ejercicios Selenium del laboratorio 9.
#
#   ./run.sh
#
# Sincroniza el entorno con uv, corre cada guion en Chromium sin cabeza,
# salvo el ejercicio 27 que usa Firefox, y guarda la salida de consola en
# l9/src/results-summary.txt con las capturas en l9/img. Requiere el
# entorno nix del repositorio, que aporta Chromium, Firefox y sus
# controladores.
#
set -uo pipefail
cd "$(dirname "$0")"

SUMMARY="results-summary.txt"
EJERCICIOS=(
  ej1_funcionamiento.py
  ej3_buscar_unittest.py
  ej4_xpath.py
  ej5_toggle.py
  ej6_select.py
  ej7_ventanas.py
  ej8_navegacion.py
  ej9_explicit_wait.py
  ej10_implicit_wait.py
  ej27_otro_navegador.py
)

uv sync --frozen --quiet
: > "$SUMMARY"
FALLOS=0

for ejercicio in "${EJERCICIOS[@]}"; do
  {
    echo "===== $ejercicio ====="
    if uv run --frozen --no-sync python "$ejercicio"; then
      echo "Resultado: OK"
    else
      echo "Resultado: FALLO"
      FALLOS=$((FALLOS + 1))
    fi
    echo
  } 2>&1 | tee -a "$SUMMARY"
done

echo "Ejercicios con fallo: $FALLOS" | tee -a "$SUMMARY"
exit "$FALLOS"
