#import "/components/@unsareport/gdocs-code-block/lib.typ": code-block
== Objetivo
Esta práctica conoce, evalúa y utiliza metodologías y herramientas para generar casos que midan el rendimiento de una aplicación web, con Apache JMeter como herramienta principal. Usa el sitio BlazeDemo con un plan grabado desde el navegador y ejecutado con carga concurrente, y reporta tareas y resultados según la estructura de la guía.

== Instalacion de Apache JMeter
Apache JMeter sale del sitio oficial de descargas, como muestra la @fig-jmeter-descarga. No tiene instalador: basta descomprimir el archivo y lanzar el ejecutable en una máquina con Java. Esta práctica usa Apache JMeter 5.6.3 con Java 8 o superior. La guía marca esta descarga como primer ejercicio resuelto y remite al manual adjunto para la configuración. Al iniciar, JMeter muestra el plan como árbol de componentes a la izquierda y las propiedades del seleccionado a la derecha, base de todo el ejercicio.

#figure(
  image("../../img/evidencia-jmeter-descarga.png", width: 80%),
  caption: [Página oficial de descarga de Apache JMeter con los binarios de la versión 5.6.3.],
) <fig-jmeter-descarga>

== Plan de pruebas y casos
El plan es una jerarquía donde cada nodo aporta una pieza del escenario de carga. En la raíz va el grupo de hilos, es decir los usuarios virtuales, con un usuario simulado por hilo. Piden contra la aplicación los muestreadores y ordenan la ejecución los controladores lógicos; la configuración fija propiedades, las aserciones revisan respuestas, los temporizadores meten esperas, los preprocesadores y posprocesadores actúan antes y después de cada muestreador, y los receptores juntan los datos para observar la ejecución. Grabar parte de la plantilla con el registrador del protocolo de transferencia del sitio.

El Anexo 1 ordena el trabajo en siete actividades. Primero se identifican entornos de prueba y producción con su equipamiento, programas y red, y se fijan criterios de aceptación en tiempo de respuesta, caudal y uso de recursos. Luego se planifican escenarios con variabilidad de usuarios, datos y métricas, se configura el entorno con herramientas y monitorización, se desarrollan las pruebas, y se ejecutan y monitorizan con datos validados. Al final se consolidan resultados, se analizan en equipo y se repiten las priorizadas hasta que las métricas entren en los límites.

El flujo grabado cubre la reserva de vuelos de BlazeDemo, de la página de inicio a la de resultados. La página de inicio trae el formulario de origen y destino con Paris y Buenos Aires, como muestra la @fig-blazedemo-inicio. Al enviarlo llegan los vuelos disponibles entre ambas ciudades, como muestra la @fig-blazedemo-reserva. Esta secuencia queda guardada como muestreadores sobre el sitio.

#figure(
  image("../../img/evidencia-blazedemo-inicio.png", width: 80%),
  caption: [Página de inicio de BlazeDemo con origen Paris y destino Buenos Aires.],
) <fig-blazedemo-inicio>

#figure(
  image("../../img/evidencia-blazedemo-reserva.png", width: 80%),
  caption: [Página de resultados de BlazeDemo con los vuelos entre Paris y Buenos Aires.],
) <fig-blazedemo-reserva>

EjemploBlaze usa 10 hilos con 100 iteraciones cada uno y rampa de 10 segundos, más un gestor de cookies y dos muestreadores: lectura del inicio y envío de la búsqueda. La @fig-hilos muestra el panel del grupo con 10 hilos y 100 iteraciones.

#figure(
  image("../../img/evidencia-jmeter-hilos.png", width: 80%),
  caption: [Grupo de hilos con 10 hilos y 100 iteraciones.],
) <fig-hilos>

El plan guarda así sus parámetros de carga.

#code-block(lang: "xml")[
```xml
<ThreadGroup testname="Grupo de usuarios BlazeDemo - 10 hilos por 100 repeticiones">
  <intProp name="ThreadGroup.num_threads">10</intProp>
  <intProp name="ThreadGroup.ramp_time">10</intProp>
  <stringProp name="LoopController.loops">100</stringProp>
</ThreadGroup>
```
]

El muestreador manda la búsqueda a reserve.php con origen Paris y destino Buenos Aires, como muestra la @fig-muestreador. Para observar corren los receptores de gráfico y de reporte resumido.

#figure(
  image("../../img/evidencia-jmeter-muestreador.png", width: 80%),
  caption: [Muestreador de búsqueda hacia reserve.php con origen Paris y destino Buenos Aires.],
) <fig-muestreador>

La petición lleva este destino y estos parámetros.

#code-block(lang: "xml")[
```xml
<HTTPSamplerProxy testname="02 Busqueda de vuelos de Paris a Buenos Aires">
  <stringProp name="HTTPSampler.domain">blazedemo.com</stringProp>
  <stringProp name="HTTPSampler.path">/reserve.php</stringProp>
  <stringProp name="HTTPSampler.method">POST</stringProp>
  <stringProp name="Argument.name">fromPort</stringProp>
  <stringProp name="Argument.value">Paris</stringProp>
  <stringProp name="Argument.name">toPort</stringProp>
  <stringProp name="Argument.value">Buenos Aires</stringProp>
</HTTPSamplerProxy>
```
]
== Ejecucion y alcances
En modo gráfico se abre EjemploBlaze, se revisa el grupo de hilos, se pulsa ejecutar y se leen los receptores de gráfico y de reporte resumido.

```
jmeter -t EjemploBlaze.jmx
```

Sin interfaz, con dos hilos y dos iteraciones, salen ocho muestras en tres segundos: caudal 2.8 por segundo, media 482 milisegundos, mínimo 329, máximo 976 y cero errores. La búsqueda aporta cuatro muestras con media de 351 milisegundos, mínimo de 329 y máximo de 367. El inicio aporta las otras cuatro con media de 613 milisegundos, mínimo de 343 y máximo de 976.

```
jmeter -n -t EjemploBlaze.jmx -l resultados.jtl
```

La pasada completa, diez hilos por cien iteraciones, deja 2000 muestras con media de 467 milisegundos, mediana de 422, desviación de 174 y caudal de 1179 por minuto, como muestra la @fig-grafico.

#figure(
  image("../../img/evidencia-jmeter-grafico.png", width: 80%),
  caption: [Resultados en gráfico de la ejecución con 2000 muestras y media de 467 milisegundos.],
) <fig-grafico>

La comprobación en modo gráfico, también de dos por dos, reúne ocho muestras con 0.00 por ciento de errores y filas por petición para inicio y búsqueda, como muestra la @fig-resumen.

#figure(
  image("../../img/evidencia-jmeter-resumen.png", width: 80%),
  caption: [Reporte resumido de la muestra con ocho peticiones y cero errores.],
) <fig-resumen>

En función, el ejercicio genera carga a nivel de protocolo sobre el flujo grabado con diez usuarios concurrentes y cien iteraciones por usuario. Para medir cubre tiempos de respuesta, caudal de peticiones y bytes, códigos de respuesta y detección de cuellos de botella en aplicación, base de datos y servidor cuando hay monitorización. Eso responde a lo que pide la guía: probar el plan generado y fijar sus alcances principales.

Con Maven el plan entra al proyecto por el complemento de JMeter en la fase de verificación, sin reportes y con resultados en Extensible Markup Language para procesarlos después. El complemento de gráficos toma ese archivo y deja las imágenes de caudal y códigos en la carpeta de resultados. Todo corre desde la raíz con la orden de verificación y los gráficos salen en la ruta configurada.

Así se declara el complemento y su formato.

#code-block(lang: "xml")[
```xml
<plugin>
  <groupId>com.lazerycode.jmeter</groupId>
  <artifactId>jmeter-maven-plugin</artifactId>
  <version>2.7.0</version>
  <generateReports>false</generateReports>
  <resultsFileFormat>xml</resultsFileFormat>
</plugin>
```
]

Ubicación, orden y formato:

```
Ubicacion del plan: src/test/jmeter
Orden de ejecucion: mvn verify
Formato de resultados: xml
```

== Suficiencia de JMeter para pruebas de rendimiento
JMeter basta para lo que pide la guía: simula carga concurrente, graba guiones a nivel de protocolo, repite con el grupo de hilos y recoge resultados con receptores y gráficos. Es código abierto y la más usada en Java para carga, con los cuatro tipos del Anexo 1: carga con la concurrencia esperada, esfuerzo subiendo usuarios hasta romper, estabilidad con carga sostenida para fugas de memoria, y picos con cambios bruscos. Los complementos suman gráficos de caudal, peticiones y códigos, y Maven repite la prueba en el ciclo de construcción.

Analizar sigue la metodología del Anexo 1 con los receptores del plan. Primero van los códigos de respuesta por segundo: confirman respuestas satisfactorias y delatan errores bajo carga. Después, los tiempos de las transacciones principales contra los criterios de aceptación del diseño. Luego el caudal de peticiones y bytes en el tiempo para ver la capacidad sostenida. Al final se cruza con uso de recursos de servidor y base de datos cuando hay monitorización, para localizar el cuello de botella. Lo medido es tiempo de respuesta, caudal, uso de recursos, escalabilidad, fiabilidad y comportamiento ante carga extrema y sostenida.
