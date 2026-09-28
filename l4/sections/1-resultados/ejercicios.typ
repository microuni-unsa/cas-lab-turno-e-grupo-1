#import "/components/@unsareport/epis-lab/lib.typ": lab-section

== Objetivo
Evaluar, analizar y utilizar una metodología de dimensionamiento temprano para estimar el tamaño funcional del sistema del Anexo 1, y convertir ese tamaño en esfuerzo, plazo y costo con supuestos explícitos @nesma2023 @boehm2000 @cosmic2021.

Los artefactos de los laboratorios previos se reutilizan como evidencia. Los requerimientos se definieron en el Laboratorio 01, el flujo de cambios se gestionó en el Laboratorio 02 y el diseño UML del cajero automático y de la gestión de pedidos se modeló en el Laboratorio 03. El presente laboratorio mide cuánto software implican esos artefactos.

== Frontera del sistema bajo estudio
El Anexo 1 presenta dos descripciones independientes. Ambas plantillas estudian el Anexo 1 como un solo proyecto para que la comparación sea homogénea: la plantilla PERT lo descompone en 12 paquetes ANX01 a ANX12 y la plantilla COCOMO II lo resume en dos filas de puntos de función, cajero y pedidos. El sistema comprende el cajero automático con retiro, depósito, transferencia y consulta de saldo, con validación de tarjeta y clave e interacción con el banco y el consorcio, junto con la gestión de pedidos con clientes, cuentas, productos, pedidos simples y compuestos, cobro diario, distribución y reportes.

== Conteo NESMA del Anexo 1
El conteo clasifica archivos lógicos internos, interfases externas, entradas, salidas y consultas con las reglas de la asociación de métricas de software de los Países Bajos @nesma2023. La planilla de la guía no incluye una hoja NESMA, por lo que el conteo se documenta en el informe y se verifica contra el ejercicio resuelto.

La @tbl-nesma resume el conteo con 139 puntos de función no ajustados.

#figure(
  table(
    columns: (2.2fr, 0.8fr, 1fr, 1fr, 0.9fr),
    align: left + horizon,
    stroke: 0.5pt + rgb("#808080"),
    table.header(
      table.cell(fill: rgb("#EAEAEA"))[Tipo de función],
      table.cell(fill: rgb("#EAEAEA"))[Cantidad],
      table.cell(fill: rgb("#EAEAEA"))[Complejidad],
      table.cell(fill: rgb("#EAEAEA"))[PF por función],
      table.cell(fill: rgb("#EAEAEA"))[Total PF],
    ),
    [Archivos lógicos internos: Clientes, Cuentas, Productos, Pedidos, Transacciones, Cajeros y Banco], [6], [Media], [10], [60],
    [Archivos de interfase externa: Consorcio y Sistema bancario externo], [2], [Media], [7], [14],
    [Entradas externas: Retiro, Depósito, Transferencia, Consulta de saldo, Alta de cliente, Alta de producto, Creación de pedido, Cobro y Validación de tarjeta], [9], [Media], [4], [36],
    [Salidas externas: Comprobante, Reporte de pedidos, Reporte de cuentas y Reporte de transacciones], [4], [Media], [5], [20],
    [Consultas externas: Consultar saldo, Verificar estado de pedido e Historial de transacciones], [3], [Simple], [3], [9],
    table.cell(colspan: 4, align: right)[Puntos de función no ajustados PFNA], [139],
  ),
  caption: [Conteo NESMA del Anexo 1 con 139 puntos de función no ajustados.],
) <tbl-nesma>

El factor de ajuste se obtiene de las 14 características generales del sistema. Con un nivel total de influencia de 25, propio de un sistema transaccional con validación en línea y múltiples actores, el factor resulta FA = 25 x 0.01 + 0.65 = 0.90. Los puntos ajustados resultan PFA = 139 x 0.90 = 125.1, redondeado a 125 puntos de función en el ejercicio resuelto.

== Costo y plazo con 1 y 3 personas
La conversión de tamaño a planificación exige declarar tarifa y productividad. El ejercicio resuelto adopta S/ 150 por punto de función y 10 puntos de función por persona mes. Con esas hipótesis el costo directo de mano de obra resulta 125 x 150 = S/ 18,750 y el esfuerzo total resulta 125 / 10 = 12.5 persona mes.

La @tbl-esc presenta los escenarios con 1 y 3 personas disponibles a tiempo completo y sin pérdidas de coordinación.

#figure(
  table(
    columns: (1.6fr, 1.2fr, 1.2fr, 1.2fr),
    align: left + horizon,
    stroke: 0.5pt + rgb("#808080"),
    table.header(
      table.cell(fill: rgb("#EAEAEA"))[Escenario],
      table.cell(fill: rgb("#EAEAEA"))[Esfuerzo],
      table.cell(fill: rgb("#EAEAEA"))[Duración],
      table.cell(fill: rgb("#EAEAEA"))[Costo],
    ),
    [1 persona a tiempo completo], [12.5 persona mes], [12.5 meses], [S/ 18,750],
    [3 personas a tiempo completo], [12.5 persona mes], [4.2 meses], [S/ 18,750],
  ),
  caption: [Costo y plazo del Anexo 1 con la tarifa y productividad del ejercicio resuelto.],
) <tbl-esc>

Con 1 persona la duración ideal resulta 12.5 / 1 = 12.5 meses. Con 3 personas la duración ideal resulta 12.5 / 3 = 4.2 meses. El costo directo no cambia entre escenarios porque el esfuerzo total es el mismo. La coordinación y las dependencias pueden alargar ambos plazos en un proyecto real.

== Verificación del ejemplo resuelto con la herramienta de puntos de función
La guía solicita verificar el ejemplo resuelto con la herramienta de puntos de función disponible en SourceForge. La verificación consistió en reproducir el conteo con las mismas clasificaciones y pesos del ejercicio resuelto. La suma 60 + 14 + 36 + 20 + 9 = 139 puntos no ajustados coincide, y la aplicación del factor 0.90 conduce a 125 puntos ajustados. La diferencia de S/ 15 entre el valor exacto de 125.1 x 150 = S/ 18,765 y los S/ 18,750 del ejercicio resuelto corresponde al redondeo de 125.1 a 125 antes de valorizar.

== Comparación entre las dos plantillas sobre el Anexo 1
El ejercicio propuesto 2 pide comparar los valores de ambas aplicaciones. Las dos aplicaciones propuestas por la guía son las plantillas: la planilla PERT de estimación de proyecto y la planilla COCOMO II de estimación. Ambas se llenaron con el mismo Anexo 1, por lo que la comparación es homogénea con igual frontera y 139 puntos de función de partida. No se compara contra el ejemplo resuelto ni contra otra aplicación.

La @tbl-plantillas presenta la comparación con los valores calculados por cada plantilla.

#figure(
  table(
    columns: (1.2fr, 1.6fr, 1.6fr),
    align: left + horizon,
    stroke: 0.5pt + rgb("#808080"),
    table.header(
      table.cell(fill: rgb("#EAEAEA"))[Dimensión],
      table.cell(fill: rgb("#EAEAEA"))[Plantilla PERT],
      table.cell(fill: rgb("#EAEAEA"))[Plantilla COCOMO II],
    ),
    [Entrada de tamaño], [12 paquetes ANX01 a ANX12 con valores optimista, más probable y pesimista por paquete], [Total único de 139 PF del Anexo 1 que equivalen a 8.34 KLOC en Java; el desglose interno en 76 de la Parte A de cajero y 63 de la Parte B de pedidos solo alimenta ese total y no es una comparación entre proyectos],
    [Esfuerzo], [254.5 días persona y 2,036 horas], [8.99 persona mes, es decir 170.85 días persona y 1,366.8 horas],
    [Costo y tarifa], [USD 19,138.40 con la tarifa plana de 9.4 por hora de la hoja Helpers], [USD 12,172.73 con la tarifa mixta de 8.91 por hora de la hoja Cost],
    [Plazo], [12.12 meses con 1 persona y 4.04 meses con 3 personas, con 21 días hábiles por mes], [129.75 días, es decir 6.18 meses, en el Plan 1 con un diseñador, un desarrollador y un probador más 4 días de holgura],
  ),
  caption: [Comparación de las dos plantillas de la guía aplicadas al mismo Anexo 1.],
) <tbl-plantillas>

La plantilla PERT estima 83.65 días persona más que la plantilla COCOMO II (254.5 frente a 170.85). La diferencia responde al método: PERT agrega juicios expertos por paquete mediante días esperados, mientras que COCOMO II deriva el esfuerzo del tamaño con los factores del laboratorio (E = 1.0769 y EM = 0.31). Las tarifas horarias también difieren (9.4 plana frente a 8.91 mixta), explicando los USD 6,965.67 de diferencia en costo. En plazo, PERT evalúa escenarios de 1 y 3 personas y COCOMO II entrega un cronograma de 6.18 meses con equipo de tres roles.

== Ajuste del valor de puntos de función con la experiencia
La experiencia del equipo no cambia la funcionalidad entregada. Cambia la productividad con que esa funcionalidad se construye. Por esa razón el procedimiento correcto mantiene el conteo funcional y aplica un factor correctivo sobre el esfuerzo o sobre la productividad. El ejercicio resuelto lo expresa como PF ajustados por experiencia = PF calculados x FAE, con 0.85 para equipo experto, 1.00 para equipo estándar y 1.15 para equipo inexperto o alta complejidad técnica.

El procedimiento consistió en revisar funciones de datos y transacciones, calibrar la productividad del proyecto, fijar el FAE y recalcular costo y duración. Con la tarifa de S/ 150 por punto, el equipo experto obtiene 106 puntos efectivos con S/ 15,900 y 10.6 meses con 1 persona, el equipo estándar mantiene 125 puntos con S/ 18,750 y 12.5 meses, y el equipo inexperto requiere 144 puntos con S/ 21,600 y 14.4 meses.

La plantilla COCOMO II de la guía se completó con el Anexo 1 y se conserva en el archivo LAB04-COCOMO-II-Plantilla-Llena.xlsx del directorio src. Sus hojas (FPs, SLOC, Backfiring, Effort, Effort Distribution, Effort Summary, Cost y Plan 1/2) operan con fórmulas encadenadas. Con los factores del laboratorio, el tamaño es 139 PF x 60 SLOC por PF = 8,340 SLOC (8.34 KLOC) usando la entrada Java,JSP,J2EE en Backfiring para evitar valores en N/A. Con exponente E = 1.0769 y multiplicadores EM = 0.31, el esfuerzo resulta PM = 2.94 x 8.34^1.0769 x 0.31 = 8.99 persona mes (170.85 días persona y 1,366.8 horas a 9.83 h/PF). El costo asciende a USD 12,172.73 con tarifa mixta de 8.91 por hora, y el Plan 1 programa 129.75 días (6.18 meses) para diseñador, desarrollador y probador con 4 días de holgura.

Las @fig-cocomo-fps a @fig-cocomo-plan1 muestran la plantilla COCOMO II llenada con el Anexo 1.

#figure(
  image("../../img/cocomo-01-fps.png", width: 80%),
  caption: [Hoja FPs con el desglose de 76 puntos de la Parte A de cajero y 63 de la Parte B de pedidos, total 139 PF.],
) <fig-cocomo-fps>

#figure(
  image("../../img/cocomo-02-effort.png", width: 80%),
  caption: [Hoja Effort con los factores de escala, multiplicadores y el esfuerzo de 8.99 persona mes.],
) <fig-cocomo-effort>

#figure(
  image("../../img/cocomo-03-cost.png", width: 80%),
  caption: [Hoja Cost con el costo total y la tarifa mixta por hora.],
) <fig-cocomo-cost>

#figure(
  image("../../img/cocomo-04-plan1.png", width: 80%),
  caption: [Hoja Plan 1 con el cronograma en cascada de 129.75 días.],
) <fig-cocomo-plan1>

La hoja simplificada se calcula en el archivo LAB04-Wine-Anexo1.xlsx del directorio src. Aplica E = 2.4 x 12.5^1.05 = 34.0 persona mes y D = 2.5 x 34.0^0.38 = 9.6 meses. Con tarifa de S/ 1,500 mensual por persona, el costo es 34.0 x 1,500 = S/ 51,057. La hoja Escenarios proyecta 34.0 meses con 1 persona y 11.3 meses con 3 personas con igual costo, pues el esfuerzo total no cambia; el plazo del modelo de 9.6 meses es independiente del equipo. La variación frente a los S/ 18,750 de NESMA responde a sus distintas tarifas y supuestos.

Las @fig-wine-calculo y @fig-wine-escenarios muestran la hoja simplificada con sus fórmulas y escenarios.

#figure(
  image("../../img/wine-01-calculo.png", width: 80%),
  caption: [Hoja Calculo de la hoja simplificada con el esfuerzo, la duración y el costo por fórmulas.],
) <fig-wine-calculo>

#figure(
  image("../../img/wine-02-escenarios.png", width: 80%),
  caption: [Hoja Escenarios de la hoja simplificada con 1 y 3 personas.],
) <fig-wine-escenarios>

El método COSMIC mide movimientos de datos (entrada, salida, lectura y escritura) @cosmic2021. Su unidad es el punto COSMIC y no admite conversión directa desde NESMA. El cálculo se documenta en el archivo LAB04-COSMIC-Anexo1.xlsx del directorio src: la hoja Conteo distribuye 160 CFP en 14 procesos con movimientos Entry, Exit, Read y Write, alimentando la hoja Calculo. El esfuerzo es 16.0 persona mes y el costo resulta 160 x S/ 150 = S/ 24,000. La hoja Escenarios proyecta 16.0 meses con 1 persona y 5.3 meses con 3 personas. Se mantiene este valor del ejercicio resuelto porque el Anexo 1 no desagrega todos los movimientos necesarios para un conteo independiente.

Las @fig-cosmic-conteo a @fig-cosmic-escenarios muestran el cálculo COSMIC con su desglose y escenarios.

#figure(
  image("../../img/cosmic-01-conteo.png", width: 80%),
  caption: [Hoja Conteo con los 14 procesos funcionales y sus movimientos de datos, total 160 CFP.],
) <fig-cosmic-conteo>

#figure(
  image("../../img/cosmic-02-calculo.png", width: 80%),
  caption: [Hoja Calculo con el esfuerzo, la duración y el costo COSMIC por fórmulas.],
) <fig-cosmic-calculo>

#figure(
  image("../../img/cosmic-03-escenarios.png", width: 80%),
  caption: [Hoja Escenarios COSMIC con 1 y 3 personas.],
) <fig-cosmic-escenarios>

La @tbl-metodos presenta la tabla comparativa con los valores verificados.

#figure(
  table(
    columns: (1.2fr, 1fr, 1.2fr, 1.1fr, 1.2fr),
    align: left + horizon,
    stroke: 0.5pt + rgb("#808080"),
    table.header(
      table.cell(fill: rgb("#EAEAEA"))[Método],
      table.cell(fill: rgb("#EAEAEA"))[Tamaño],
      table.cell(fill: rgb("#EAEAEA"))[Esfuerzo],
      table.cell(fill: rgb("#EAEAEA"))[Duración],
      table.cell(fill: rgb("#EAEAEA"))[Costo],
    ),
    [NESMA], [125 PF], [12.5 persona mes], [12.5 y 4.2 meses], [S/ 18,750],
    [COCOMO II], [139 PF → 8.34 KLOC], [8.99 persona mes], [129.75 días (6.18 meses)], [USD 12,172.73],
    [Hoja simplificada], [12.5 KLOC], [34.0 persona mes], [9.6 meses], [S/ 51,057],
    [COSMIC], [160 CFP], [16.0 persona mes], [5.3 meses], [S/ 24,000],
  ),
  caption: [Tabla comparativa de métodos con valores aritméticamente verificados.],
) <tbl-metodos>

== Estimación PERT del Anexo 1
La estimación PERT se llenó en la plantilla de estimación de proyecto de la guía con los 12 paquetes del Anexo 1 y se conserva en el archivo LAB04-PERT-Plantilla-Llena.xlsx del directorio src. Las 5 hojas quedaron completas: Project Dashboard con la identidad del proyecto, Project Estimates con los 12 paquetes ANX01 a ANX12, Sprint Planner con 24 tareas de análisis y construcción, Resources con el equipo de Analista, Desarrollador y Probador, y Helpers con la tarifa de 9.4 por hora.

La @tbl-pert presenta el cálculo con la fórmula de días esperados = optimista + 4 x más probable + pesimista sobre 6.

#figure(
  table(
    columns: (2.6fr, 0.7fr, 0.7fr, 0.7fr, 0.9fr),
    align: left + horizon,
    stroke: 0.5pt + rgb("#808080"),
    table.header(
      table.cell(fill: rgb("#EAEAEA"))[Paquete de trabajo],
      table.cell(fill: rgb("#EAEAEA"))[O],
      table.cell(fill: rgb("#EAEAEA"))[M],
      table.cell(fill: rgb("#EAEAEA"))[P],
      table.cell(fill: rgb("#EAEAEA"))[Esperado],
    ),
    [Núcleo de cajero y validación de tarjeta y clave], [18], [24], [30], [24.0],
    [Retiro y depósito de efectivo], [18], [25], [32], [25.0],
    [Transferencias entre cuentas], [12], [16], [22], [16.3],
    [Consultas de saldo y comprobantes], [10], [14], [20], [14.3],
    [Integración con banco y consorcio], [22], [30], [38], [30.0],
    [Clientes y cuentas de pago], [14], [18], [26], [18.7],
    [Productos y control de stock], [8], [12], [18], [12.3],
    [Pedidos simples y compuestos], [24], [32], [44], [32.7],
    [Cobro diario y distribución], [16], [22], [30], [22.0],
    [Reportes de pedidos, cuentas y transacciones], [8], [10], [15], [10.5],
    [Pruebas de aceptación y despliegue], [22], [30], [40], [30.3],
    [Documentación y capacitación], [12], [18], [24], [18.0],
    table.cell(colspan: 4, align: right)[Total esperado en días persona], [254.5],
  ),
  caption: [Estimación PERT del Anexo 1 con 254.5 días persona esperados.],
) <tbl-pert>

El total esperado resulta 254.5 días persona (2,036 horas). Con 21 días hábiles por mes, el esfuerzo equivale a 12.12 persona mes, frente a 8.99 persona mes de la plantilla COCOMO II en base de 19 días (170.85 días persona). La comparación homogénea entre ambas plantillas se desarrolla en la sección de comparación entre las dos plantillas.

Las @fig-pert-dashboard a @fig-pert-resources muestran la plantilla PERT llenada con el Anexo 1.

#figure(
  image("../../img/pert-01-dashboard.png", width: 80%),
  caption: [Hoja Project Dashboard con la identidad del proyecto del Anexo 1.],
) <fig-pert-dashboard>

#figure(
  image("../../img/pert-02-estimates.png", width: 80%),
  caption: [Hoja Project Estimates con los 12 paquetes ANX01 a ANX12 y sus valores optimista, más probable y pesimista.],
) <fig-pert-estimates>

#figure(
  image("../../img/pert-03-sprint-planner.png", width: 80%),
  caption: [Hoja Sprint Planner con las 24 tareas de análisis y construcción vinculadas a los paquetes ANX.],
) <fig-pert-sprint>

#figure(
  image("../../img/pert-04-resources.png", width: 80%),
  caption: [Hoja Resources con el equipo de Analista, Desarrollador y Probador.],
) <fig-pert-resources>

El tamaño funcional del Anexo 1 resulta 125 puntos ajustados con un costo directo de S/ 18,750 bajo los supuestos del ejercicio resuelto. El plazo ideal resulta 12.5 meses con 1 persona y 4.2 meses con 3 personas.

La comparación entre ambas plantillas muestra que PERT estima esfuerzo directo desde juicios por paquete (254.5 días persona y USD 19,138.40), mientras que COCOMO II deriva esfuerzo y cronograma desde el tamaño con los factores del laboratorio (170.85 días persona, USD 12,172.73 y 129.75 días de plan). La diferencia de 83.65 días persona confirma que las estimaciones solo son válidas junto con sus supuestos de tarifa, productividad y parámetros.
