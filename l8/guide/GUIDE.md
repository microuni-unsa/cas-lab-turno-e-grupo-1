## UNIVERSIDAD NACIONAL DE SAN AGUSTIN
## FACULTAD DE INGENIERÍA DE PRODUCCIÓN Y SERVICIOS
## ESCUELA PROFESIONAL DE INGENIERÍA DE SISTEMAS

## GUÍA DE LABORATORIO
## CALIDAD DE SOFTWARE

## SEMESTRE 8
## JESUS MARTIN SILVA FERNANDEZ
M en C CIENCIAS DE LA COMPUTACION

## COMPETENCIAS
Construye responsablemente soluciones siguiendo un proceso adecuado llevando
a cabo las pruebas ajustada a los recursos disponibles del cliente.. Cm

Curso: Sistemas Distribuidos                                                                               Página:

M en C JESUS MARTIN SILVA FERNANDEZ
## 1

## Laboratorio
## 8
## Pruebas de Perfomance

## I

## OBJETIVOS

Conocer, evaluar y utilizar efectivamente metodologías y herramientas para generar casos de prueba para determinar rendimiento y perfomance.

## II

## TEMAS A TRATAR

- Pruebas de Rendimiento
- JMeter

## III

## MARCO TEÓRICO

- Pruebas Rendimiento

Las pruebas de rendimiento consisten en simular carga en el sistema bajo pruebas para analizar el desempeño de la infraestructura durante la ejecución de la prueba, pudiendo encontrar cuellos de botella y oportunidades de mejora. Para la simulación se utilizan herramientas específicas, en las que se debe automatizar las acciones que generarán esa carga, esto es: las interacciones entre el usuario y el servidor. Para poder simular muchos usuarios con poca infraestructura de pruebas, se automatizan las interacciones a nivel de protocolo en guiones de prueba, lo cual hace que la automatización sea más compleja en cuanto al trabajo necesario para su preparación que la automatización de pruebas funcionales, que se realiza a nivel de interfaz gráfica. Generalmente la tarea de automatización consume entre el 30 por ciento y el 50 por ciento del esfuerzo de un proyecto de pruebas de rendimiento.

Curso: Sistemas Distribuidos                                                                               Página:

M en C JESUS MARTIN SILVA FERNANDEZ
## 2

- JMeter

Los desarrolladores que trabajan con Java realizan una toma de requerimientos con frameworks y desarrollan código. Sin embargo en muchas ocasiones se olvidan de algunos requerimientos no funcionales. Uno de los mas habituales es el rendimiento. La aplicación se comporta correctamente con 100 usuarios simultaneos y con mil. Muchas veces estas cosas se olvidan y generan tremendos problemas porque SOLO cuando la aplicación entra en un entorno de producción real se prueban. En entorno real y hay PROBLEMAS es muy difícil dar marcha atras y corregirlos. JMeter es la herramienta Java mas utilizada para realizar pruebas de carga.

## ACTIVIDADES
## 1. Procedimiento

- Ejecutar ejercicios resueltos y propuestos
- Escriba un reporte sobre las tareas realizadas y resultados.
- Escriba sus conclusiones

## 2. Agenda:

Instalación y pruebas   90 minutos
Generación de reporte  15 minutos

- Estructura de reporte

## I. Objetivo
II. Descripción del procedimiento realizado en la práctica
III. Resultados obtenidos
IV. Análisis de resultados
## V. Conclusiones

El envío al drive compartido del reporte, incluye código generado por alumno.

## V

## EJERCICIOS RESUELTOS

1. Instalar adecuadamente herramienta Apache JMeter

https://jmeter.apache.org/download_jmeter.cgi

Curso: Sistemas Distribuidos                                                                               Página:

M en C JESUS MARTIN SILVA FERNANDEZ
## 3

## VI

## EJERCICIOS PROPUESTOS

1. Implementar actividades de generación de casos de prueba utilizando ApacheJMeter_manual.pdf adjunto y las características del Anexo 1.
2. Probar funcionalidad y determinar los alcances mas importantes.
3. Determinar si la funcionalidad de jmeter es suficiente para probar rendimiento de software.

## VII

## CUESTIONARIO

a) Que variables se mide en las pruebas de perfomance?
b) Cual es el protocolo para revisar y evaluar resultados de jmeter?
c) Conoce otra herramienta de medición de perfomance, si es si, resuma funcionalidad

## VIII

## BIBLIOGRAFÍA

- http://scielo.sld.cu/pdf/rii/v37n3/rii060316.pdf
- https://biblioteca.sistedes.es/wp-content/uploads/2016/04/Generacion-de-Prueba-Rendimiento-a-Partir-de-Pruebas-Funcionales-para-Sistemas-Web.pdf
- http://sedici.unlp.edu.ar/bitstream/handle/10915/22298/Documento_completo.PDF?sequence=1&isAllowed=y

Curso: Sistemas Distribuidos                                                                               Página:

M en C JESUS MARTIN SILVA FERNANDEZ
## 4

## ANEXO 1

En todo proyecto de desarrollo software es muy importante la realización de planes de pruebas que garanticen que se cumplen los requisitos funcionales de la aplicación. Pero no todo el trabajo del personal de Aseguramiento de la Calidad, en adelante QA, son las pruebas funcionales. Además de éstas, existen otras que pueden marcar la calidad de una aplicación: de seguridad, de usabilidad, de rendimiento.

Las pruebas de rendimiento son, desde la perspectiva más evidente, las que se realizan para determinar lo rápido que un sistema realiza una tarea en unas determinadas condiciones de trabajo.

## PARA QUÉ SIRVEN LAS PRUEBAS DE RENDIMIENTO

Para alcanzar un buen nivel de rendimiento de un sistema es fundamental que las pruebas comiencen en el inicio del desarrollo del software. Al igual que en las pruebas funcionales, el coste de solucionar defectos se ve aumentado conforme más se tarde en detectarlos.

Además, si queremos que los resultados sean lo más fiables posible, nuestro entorno de pruebas debe ser lo más parecido posible al de producción, y no cruzarlo nunca con el de desarrollo ni el de otras pruebas.

La pruebas de rendimiento sirven, entre otras cosas, para:

- Demostrar que el sistema cumple los criterios de rendimiento.
- Validar y verificar atributos de la calidad del sistema: escalabilidad, fiabilidad, uso de los recursos.
- Comparar dos sistemas para saber cuál de ellos funciona mejor.
- Medir qué partes del sistema o de carga de trabajo provocan que el conjunto rinda mal.

## TIPOS DE PRUEBAS DE RENDIMIENTO

## PRUEBA DE CARGA

Éste es el tipo más sencillo de pruebas de rendimiento. Una prueba de carga se realiza generalmente para observar el comportamiento de una aplicación bajo una cantidad esperada de peticiones. Esta carga puede ser el número esperado de usuarios concurrentes, utilizando la aplicación que realizan un número específico de transacciones, durante el tiempo que dura la carga. Esta prueba puede mostrar los tiempos de respuesta de todas las transacciones importantes de la aplicación. Si también se monitorizan otros aspectos como la base de datos, el servidor de aplicaciones, etc., entonces esta prueba puede mostrar el cuello de botella en la aplicación.

Curso: Sistemas Distribuidos                                                                               Página:

M en C JESUS MARTIN SILVA FERNANDEZ
## 5

## PRUEBA DE ESTRÉS

Se utiliza normalmente para romper la aplicación. Se va doblando el número de usuarios que se agregan a la aplicación y se ejecuta una prueba de carga hasta que se rompe. Este tipo de prueba se realiza para determinar la solidez de la aplicación en los momentos de carga extrema. Esto ayuda a los administradores para determinar si la aplicación rendirá lo suficiente en caso de que la carga real supere a la carga esperada.

## PRUEBA DE ESTABILIDAD

Normalmente se hace para determinar si la aplicación puede aguantar una carga esperada continuada. Generalmente esta prueba se realiza para determinar si hay alguna fuga de memoria en la aplicación. También se conoce con el nombre en inglés Soak Testing.

## PRUEBA DE PICO

La prueba de picos, también conocida con el nombre en inglés Spike Testing, trata de observar el comportamiento del sistema variando el número de usuarios, tanto cuando bajan como cuando tiene cambios drásticos en su carga. Esta prueba se recomienda que sea realizada con un software automatizado que permita realizar cambios en el número de usuarios mientras que los administradores llevan un registro de los valores a ser monitorizados.

## METODOLOGÍA

Según Microsoft Developer Network, la metodología de las pruebas de rendimiento consiste en las siguientes actividades:

1. Identificar el entorno de pruebas. Identificar el entorno físico de pruebas y el entorno de producción, así como las herramientas y recursos de que dispone el equipo de prueba. El entorno físico incluye hardware, software y configuraciones de red. Tener desde el principio un profundo conocimiento de todo el entorno de prueba permite diseños de pruebas más eficientes. Facilita también la planificación y ayuda a identificar problemas en las pruebas en fases tempranas del proyecto. En algunas situaciones, este proceso debe ser revisado periódicamente durante todo el ciclo de vida del proyecto.
2. Identificar los criterios de aceptación de rendimiento. Determinar el tiempo de respuesta, el rendimiento, la utilización de los recursos y los objetivos y limitaciones. En general, el tiempo de respuesta concierne al usuario, el rendimiento al negocio, y la utilización de los recursos al sistema. Identificar cuáles serían criterios de éxito de rendimiento del proyecto para evaluar qué combinación de la configuración da lugar a un funcionamiento óptimo.
3. Planificar y diseñar las pruebas. Identificar los principales escenarios, determinar la variabilidad de los usuarios y la forma de simular esa variabilidad, definir los datos de las pruebas y establecer las métricas a recoger. Consolidar esta información en uno o más modelos de uso del sistema a implantar, ejecutarlo y analizarlo.

Curso: Sistemas Distribuidos                                                                               Página:

M en C JESUS MARTIN SILVA FERNANDEZ
## 6

4. Configurar el entorno de prueba. Preparar el entorno de prueba, las herramientas y recursos necesarios para ejecutar cada una de las estrategias, así como las características y componentes disponibles para la prueba. Asegurarse de que el entorno de prueba se ha preparado para la monitorización de los recursos según sea necesario.
5. Aplicar el diseño de la prueba. Desarrollar las pruebas de rendimiento de acuerdo con el diseño del plan.
6. Ejecutar la prueba. Ejecutar y monitorizar las pruebas. Validar las pruebas, los datos de las pruebas y recoger los resultados. Ejecutar pruebas válidas para analizar, mientras se monitoriza la prueba y su entorno.
7. Analizar los resultados, realizar un informe y repetirlo. Consolidar y compartir los resultados de la prueba. Analizar los datos, tanto individualmente como con un equipo multidisciplinario. Volver a priorizar el resto de las pruebas y a ejecutarlas en caso de ser necesario. Cuando todas las métricas estén dentro de los límites aceptados, ninguno de los umbrales establecidos hayan sido rebasados y toda la información deseada se ha reunido, las pruebas han acabado para el escenario definido por la configuración.

## JMETER

Existen numerosas herramientas, tanto de código abierto como privativas, para realizar las pruebas de rendimiento: NeoLoad, LoadRunner, LoadUI, WebLOAD, etc. Una de las más populares es JMeter, herramienta de código abierto, en la cual nos centraremos.

En JMeter, un plan de pruebas es una jerarquía de componentes en forma de árbol en el panel de control de la izquierda. Cada nodo del árbol es un componente. A su vez, un componente es una instancia de un tipo de componente en la que quizás se han configurado algunas de sus propiedades en el panel de control de la derecha.

Curso: Sistemas Distribuidos                                                                               Página:

M en C JESUS MARTIN SILVA FERNANDEZ
## 7

Los diferentes componentes de los que puede constar un plan de pruebas son:

- Test Plan. Es el tipo de componente que representa la raíz del árbol.
- Thread Group. Representa un grupo de usuarios. En JMeter cada hilo de ejecución es un usuario virtual.
- Controllers. Los muestreadores realizan peticiones contra la aplicación y los controladores lógicos establecen el orden en que se ejecutan éstos.
- Config Element. Establecen propiedades de configuración que se aplican a los muestreadores a los que afectan.
- Assertion. Comprueban condiciones que aplican a las peticiones que realizan contra la aplicación los muestreadores a los que afectan.
- Listeners. Recopilan datos de las peticiones que realizan los muestreadores a los que afectan.
- Timer. Añaden tiempo extra a la ejecución de las peticiones que realizan contra la aplicación los muestreadores a los que afectan.
- Pre-Processor element. Realizan acciones o establecen configuraciones previa a la ejecución de los muestreadores a los que afectan.
- Post-Processor element. Realizan acciones o establecen configuraciones posteriormente a la ejecución de los muestreadores a los que afectan.

## EJEMPLO BÁSICO CON JMETER

Para preparar el escenario de las pruebas en JMeter cargamos una plantilla. Vamos a la opción de menú Archivo y luego a la opción Plantilla. Se abre una pequeña ventana nueva para elegir qué plantilla deseamos cargar. Elegimos la primera, de nombre Recording. Ésta sirve para grabar la navegación de un sitio web.

Para nuestro ejemplo básico, podemos eliminar algunos componentes como Variables definidas por el usuario, Valores por defecto de petición del Protocolo de Transferencia de Hipertexto, en adelante HTTP, y Gestor de cookies HTTP. Para la recepción de los datos, con botón derecho sobre Grupo de Hilos añadimos un receptor con la opción Añadir, Receptor y Resultados en gráfico. Podemos añadir algunos receptores de datos más. Nosotros, finalmente trabajamos con este esquema.

Curso: Sistemas Distribuidos                                                                               Página:

M en C JESUS MARTIN SILVA FERNANDEZ
## 8

Para la configuración, vamos al Grabador de guiones de prueba HTTP y en el campo del puerto escribimos el que queramos usar. En nuestro caso, el puerto 8181.

Pulsamos, ahora, en Grupo de Hilos y en Número de Hilos escribimos el número de usuarios concurrentes que queremos que hagan las peticiones. En nuestro caso, 10. En Conteo de repeticiones pondremos 100. Ya tendríamos configurado correctamente JMeter.

Curso: Sistemas Distribuidos                                                                               Página:

M en C JESUS MARTIN SILVA FERNANDEZ
## 9

Antes de empezar a grabar, debemos configurar el proxy de nuestro navegador con el puerto que escribimos anteriormente y la dirección del Protocolo de Internet, en adelante IP, de nuestro equipo.

Ya tenemos todo listo para empezar a grabar las peticiones que hagamos desde nuestra aplicación. En JMeter, pulsamos sobre Grabador de guiones de prueba HTTP y hacemos click en Iniciar. Ya estamos escuchando.

Curso: Sistemas Distribuidos                                                                               Página:

M en C JESUS MARTIN SILVA FERNANDEZ
## 10

Ya solo nos queda navegar a través de la web que queramos probar. Para nuestro ejemplo, hemos navegado en una página de prueba de nombre BlazeDemo.

Las peticiones se van guardando en nuestro Plan de Pruebas. Cuando tengamos las peticiones, paramos la grabación pulsando en Detener. Finalmente, para ejecutar nuestro plan de pruebas simplemente hay que pulsar el botón de Ejecutar.

Curso: Sistemas Distribuidos                                                                               Página:

M en C JESUS MARTIN SILVA FERNANDEZ
## 11

Los resultados pueden observarse en los Receptores que añadimos anteriormente.

Curso: Sistemas Distribuidos                                                                               Página:

M en C JESUS MARTIN SILVA FERNANDEZ
## 12

## EJEMPLO BÁSICO CON JMETER Y MAVEN

Para usar JMeter dentro de un proyecto Maven, vamos a utilizar el complemento de JMeter para Maven. La configuración de éste en el archivo del Modelo de Objetos del Proyecto, en adelante POM, es la siguiente:

```xml
<plugins>
  <plugin>
    <groupId>com.lazerycode.jmeter</groupId>
    <artifactId>jmeter-maven-plugin</artifactId>
    <version>2.7.0</version>
    <executions>
      <execution>
        <id>jmeter-tests</id>
        <goals>
          <goal>jmeter</goal>
        </goals>
        <phase>verify</phase>
      </execution>
    </executions>
    <configuration>
      <generateReports>false</generateReports>
      <resultsFileFormat>xml</resultsFileFormat>
      <testResultsTimestamp>false</testResultsTimestamp>
    </configuration>
  </plugin>
</plugins>
```

Por defecto, JMeter crea un reporte a través de un archivo de valores separados por comas, en adelante CSV. Para que esto no ocurra tenemos que poner a falso la opción de generar reportes. El siguiente complemento que vamos a utilizar necesita leer los datos de un archivo del Lenguaje de Marcado Extensible, en adelante XML, de ahí la configuración del formato del archivo de resultados.

Curso: Sistemas Distribuidos                                                                               Página:

M en C JESUS MARTIN SILVA FERNANDEZ
## 13

El otro complemento que usamos es el complemento de gráficas para JMeter que nos mostrará los distintos resultados en forma de gráficas. En el archivo POM indicamos cuál será el archivo de entrada y los de salida que corresponderá a cada una de las gráficas que añadamos:

```xml
<plugin>
  <groupId>de.codecentric</groupId>
  <artifactId>jmeter-graph-maven-plugin</artifactId>
  <version>0.1.0</version>
  <executions>
    <execution>
      <id>create-graphs-collection</id>
      <goals>
        <goal>create-graph</goal>
      </goals>
      <phase>verify</phase>
      <configuration>
        <inputFile>${project.build.directory}/jmeter/results/EjemploBlaze.jtl</inputFile>
        <graphs>
          <graph>
            <pluginType>ThroughputVsThreads</pluginType>
            <width>1920</width>
            <height>1080</height>
            <outputFile>${project.build.directory}/jmeter/results/ThroughputVsThreads.png</outputFile>
          </graph>
          <graph>
            <pluginType>ResponseCodesPerSecond</pluginType>
            <width>1920</width>
            <height>1080</height>
            <outputFile>${project.build.directory}/jmeter/results/ResponseCodesPerSecond.png</outputFile>
          </graph>
        </graphs>
      </configuration>
    </execution>
  </executions>
</plugin>
```

Las distintas gráficas y su significado pueden verse en el sitio de complementos de JMeter.

Para ejecutar nuestro plan de pruebas de JMeter, debemos guardarlo dentro de la ruta de pruebas de JMeter del proyecto Maven. La ruta es la siguiente:

```
src/test/jmeter
```

Desde la terminal, accedemos a la raíz del proyecto Maven y ejecutamos:

```
mvn verify
```

Curso: Sistemas Distribuidos                                                                               Página:

M en C JESUS MARTIN SILVA FERNANDEZ
## 14

Una vez ejecutado, aparecerán los resultados de la ejecución.

Y las gráficas aparecerán donde indicamos en la configuración del complemento. Estos son algunos ejemplos:

- Rendimiento de bytes en el tiempo. Cantidad de bytes enviados y recibidos por JMeter durante la prueba de carga.

Curso: Sistemas Distribuidos                                                                               Página:

M en C JESUS MARTIN SILVA FERNANDEZ
## 15

- Accesos al servidor por segundo. Accesos enviados por el plan de prueba al servidor por segundo.

Curso: Sistemas Distribuidos                                                                               Página:

M en C JESUS MARTIN SILVA FERNANDEZ
## 16

- Códigos de respuesta por segundo. Código de respuesta por segundo devuelto durante la prueba. El código de este proyecto lo puedes encontrar en nuestro repositorio.

## EN RESUMEN

Está claro que las pruebas funcionales son las más importantes, ya que son las que garantizan que la aplicación realizará las funciones marcadas por el cliente. Pero asegurar la calidad de una aplicación es mucho más que eso.

Por esto, el personal de QA y los desarrolladores tienen que colaborar estrechamente no sólo para que la aplicación haga esta cosa o la otra, sino también para que lo haga en el mínimo de tiempo posible. Ahí puede estar la diferencia entre una buena aplicación y otra mejor, entre una buena y mejor satisfacción del cliente.

En definitiva, no sólo de pruebas funcionales vive el personal de QA.
