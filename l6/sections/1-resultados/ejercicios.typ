#import "/components/@unsareport/epis-lab/lib.typ": lab-section

== Objetivo
El objetivo de la práctica es instalar, probar, evaluar, analizar y utilizar Pirani como herramienta de gestión de riesgos sobre un sistema de información, con la metodología MAGERIT como marco de referencia @ccncert2012 @pilar2016 @iso2018. El trabajo se ejecuta sobre el sistema académico ficticio con matrícula, notas y consulta como alcance y un horizonte de 12 meses, registrado en la hoja de cálculo de la guía y replicado en el módulo de gestión operativa de riesgos de Pirani.

== Componentes del archivo de riesgo
El archivo de la guía organiza el análisis en siete hojas. La hoja de instrucciones define el propósito y las reglas de uso. El ejemplo de análisis muestra un caso resuelto con seis escenarios que sirve de referencia para la lectura de las fórmulas. La hoja de tablas AR contiene los criterios de evaluación de probabilidad e impacto de 1 a 5 con el umbral docente de aceptación de 4. El catálogo de amenazas reúne las diez amenazas locales T1 a T10 con su vulnerabilidad posible y su medida posible. La hoja de activos contiene el inventario con propietario, dependencias y valoración de confidencialidad, integridad, disponibilidad y autenticidad. La hoja de cruces registra los escenarios con vulnerabilidad concreta, dimensión, controles actuales, probabilidad, impacto y justificación. La hoja de análisis presenta los resultados iniciales con el riesgo actual y el bloque de tratamiento con la acción concreta, el responsable, el plazo, el estado del control, la evidencia, el riesgo residual y la decisión. La @fig-proceso resume el flujo ejecutado.

#figure(
  image("../../img/diagrama-proceso.png", width: 45%),
  caption: [Proceso de gestión de riesgos ejecutado sobre el caso académico.],
) <fig-proceso>

== Instalación y acceso a Pirani
Pirani se utiliza como servicio web, por lo que no requiere instalación local. El acceso se realiza desde el navegador en la dirección del panel operativo de riesgos con una cuenta de la organización registrada. La @fig-orm-vacio muestra el panel con el sistema de gestión operativa vacío antes del registro, con el contador en 0 de 200 registros de la versión utilizada.

#figure(
  image("../../img/evidencia-pirani-orm-vacio.png", width: 62%),
  caption: [Panel operativo de riesgos de Pirani vacío antes del registro de escenarios.],
) <fig-orm-vacio>

El formulario de creación solicita el nombre del riesgo, el impacto, la probabilidad y la descripción, y ubica el riesgo inherente en la matriz de calor. La @fig-crear muestra el formulario con el riesgo R1 con impacto catastrófico y probabilidad posible.

#figure(
  image("../../img/evidencia-pirani-crear-riesgo.png", width: 62%),
  caption: [Formulario de creación de riesgo en Pirani con el escenario R1.],
) <fig-crear>

== Inventario de activos
El caso conserva el sistema académico ficticio de la plantilla. El alcance cubre matrícula, notas y consulta con un horizonte de 12 meses. El inventario registra seis activos con propietario, dependencias y valoración de 1 a 5 por dimensión según la estructura descrita en la práctica resuelta @ccncert2012 @pilar2016. La @fig-activos muestra la hoja con el inventario lleno y la @fig-dependencias muestra las dependencias declaradas entre activos. La @tbl-activos resume el inventario registrado.

#figure(
  image("../../img/evidencia-excel-activos.png", width: 62%),
  caption: [Inventario de activos con propietario, dependencias y valoración por dimensión.],
) <fig-activos>

#figure(
  image("../../img/diagrama-activos.png", width: 45%),
  caption: [Dependencias declaradas entre los seis activos del caso.],
) <fig-dependencias>

#figure(
  table(
    columns: (0.6fr, 1.6fr, 1fr, 1.5fr, 1fr, 2.6fr),
    align: left + horizon,
    stroke: 0.5pt + rgb("#808080"),
    table.header(
      table.cell(fill: rgb("#EAEAEA"))[ID],
      table.cell(fill: rgb("#EAEAEA"))[Activo],
      table.cell(fill: rgb("#EAEAEA"))[Tipo],
      table.cell(fill: rgb("#EAEAEA"))[Propietario],
      table.cell(fill: rgb("#EAEAEA"))[C I D A],
      table.cell(fill: rgb("#EAEAEA"))[Justificación],
    ),
    [A1], [Servicio académico], [Servicio], [Dirección Académica], [3 4 5 3], [Matrícula y consulta sostienen el objetivo operativo; disponibilidad 5 por interrupción del servicio; integridad 4 por notas],
    [A2], [Datos académicos], [Datos], [Secretaría Académica], [5 5 4 4], [Estudiantes, matrículas, notas y pagos; confidencialidad 5 e integridad 5 por datos personales y notas oficiales],
    [A3], [Aplicación web], [Software], [Administración del Sistema], [4 4 4 5], [Control de acceso por roles y bloqueo; autenticidad 5 por operaciones atribuibles a cuentas suplantadas],
    [A4], [Servidor y red], [Infraestructura], [Infraestructura TI], [2 3 5 2], [Base de los servicios y respaldos; disponibilidad 5 por corte total],
    [A5], [Respaldos], [Recuperación], [Administrador TI], [5 5 3 2], [Copia íntegra de datos académicos con objetivo de punto de recuperación de 24 h y objetivo de tiempo de recuperación de 4 h],
    [A6], [Personal y cuentas], [Personas], [Administración del Sistema], [4 3 2 5], [Cuentas y credenciales; autenticidad 5 por operaciones atribuidas a usuarios],
  ),
  caption: [Inventario de activos registrado en la hoja de cálculo.],
) <tbl-activos>

== Escenarios de riesgo
Cada fila de la hoja de cruces corresponde a un escenario con un activo y una amenaza del catálogo T1 a T10. Se registraron diez escenarios R1 a R10 con vulnerabilidad concreta, dimensión afectada, controles actuales, probabilidad, impacto y justificación según los criterios de las tablas AR. Todos los controles actuales se declararon como Ninguno porque el caso parte sin salvaguardas acreditadas. La @fig-cruces muestra la hoja con los diez escenarios en estado Listo. La @tbl-cruces resume los escenarios con el riesgo actual calculado como probabilidad por impacto.

#figure(
  image("../../img/evidencia-excel-cruces.png", width: 62%),
  caption: [Escenarios R1 a R10 con vulnerabilidad, dimensión, probabilidad, impacto y justificación.],
) <fig-cruces>

#figure(
  table(
    columns: (0.5fr, 1.2fr, 1.3fr, 0.9fr, 0.5fr, 0.5fr, 0.7fr, 0.9fr),
    align: left + horizon,
    stroke: 0.5pt + rgb("#808080"),
    table.header(
      table.cell(fill: rgb("#EAEAEA"))[ID],
      table.cell(fill: rgb("#EAEAEA"))[Activo],
      table.cell(fill: rgb("#EAEAEA"))[Amenaza],
      table.cell(fill: rgb("#EAEAEA"))[Vulnerabilidad],
      table.cell(fill: rgb("#EAEAEA"))[P],
      table.cell(fill: rgb("#EAEAEA"))[I],
      table.cell(fill: rgb("#EAEAEA"))[R actual],
      table.cell(fill: rgb("#EAEAEA"))[Nivel],
    ),
    [R1], [Respaldos], [Ransomware], [Copias accesibles desde producción], [3], [5], [15], [Alto],
    [R2], [Personal y cuentas], [Phishing], [Cuentas sin segundo factor], [4], [4], [16], [Alto],
    [R3], [Datos académicos], [Alteración de notas], [Permisos excesivos sin aprobación], [3], [5], [15], [Alto],
    [R4], [Servidor y red], [Falla eléctrica], [Sin respaldo eléctrico], [3], [3], [9], [Moderado],
    [R5], [Datos académicos], [Borrado accidental], [Restauración nunca ensayada], [3], [4], [12], [Alto],
    [R6], [Datos académicos], [Divulgación de datos], [Enlaces compartidos sin restricción], [3], [5], [15], [Alto],
    [R7], [Servidor y red], [Falla del servidor], [Servidor único sin redundancia], [2], [4], [8], [Moderado],
    [R8], [Servicio académico], [Pérdida de conectividad], [Un solo enlace sin procedimiento manual], [2], [3], [6], [Moderado],
    [R9], [Datos académicos], [Robo de equipo], [Portátil sin cifrado], [2], [5], [10], [Alto],
    [R10], [Aplicación web], [Error de actualización], [Cambios sin prueba ni reversión], [3], [3], [9], [Moderado],
  ),
  caption: [Escenarios registrados con riesgo actual y nivel según la escala docente.],
) <tbl-cruces>

== Plan de tratamiento
El bloque de tratamiento aplica la estrategia de mitigar en los diez escenarios con una acción concreta, un responsable y un plazo en días. La probabilidad residual y el impacto residual se asignan según la eficacia justificada de cada medida. El riesgo residual es previsto mientras las medidas no se implementen ni se prueben. La @fig-analisis muestra el bloque de resultados con los niveles actuales. La @tbl-tratamiento resume el plan con el riesgo residual y la decisión de cada escenario.

#figure(
  image("../../img/evidencia-excel-analisis.png", width: 62%),
  caption: [Resultados iniciales con riesgo actual, nivel y atención requerida.],
) <fig-analisis>

#figure(
  table(
    columns: (0.5fr, 2.2fr, 1.5fr, 0.6fr, 0.6fr, 0.6fr, 0.8fr, 1.1fr),
    align: left + horizon,
    stroke: 0.5pt + rgb("#808080"),
    table.header(
      table.cell(fill: rgb("#EAEAEA"))[ID],
      table.cell(fill: rgb("#EAEAEA"))[Acción concreta],
      table.cell(fill: rgb("#EAEAEA"))[Responsable],
      table.cell(fill: rgb("#EAEAEA"))[Plazo],
      table.cell(fill: rgb("#EAEAEA"))[P res],
      table.cell(fill: rgb("#EAEAEA"))[I res],
      table.cell(fill: rgb("#EAEAEA"))[R res],
      table.cell(fill: rgb("#EAEAEA"))[Decisión],
    ),
    [R1], [Copias aisladas 3-2-1 y ensayo trimestral de restauración], [Administrador TI], [30], [1], [3], [3 Bajo], [Solicitar aceptación],
    [R2], [Segundo factor y entrenamiento anti-phishing], [Administración del Sistema], [30], [2], [2], [4 Bajo], [Solicitar aceptación],
    [R3], [Permisos por rol, aprobación de cambios y bitácora], [Administración del Sistema], [20], [1], [4], [4 Bajo], [Solicitar aceptación],
    [R4], [UPS y procedimiento de apagado controlado], [Infraestructura TI], [30], [2], [2], [4 Bajo], [Solicitar aceptación],
    [R5], [Versionado de base de datos y prueba semestral de restauración], [Administrador TI], [15], [2], [2], [4 Bajo], [Solicitar aceptación],
    [R6], [Acceso mínimo, bloqueo de enlaces públicos y revisión mensual], [Secretaría Académica], [15], [1], [5], [5 Moderado], [Nuevo tratamiento],
    [R7], [Mantenimiento preventivo y plan de recuperación del servidor], [Infraestructura TI], [45], [1], [3], [3 Bajo], [Solicitar aceptación],
    [R8], [Enlace alternativo y procedimiento manual de matrícula], [Infraestructura TI], [60], [2], [2], [4 Bajo], [Solicitar aceptación],
    [R9], [Cifrado de disco en portátiles y control físico de equipos], [Administración del Sistema], [30], [1], [3], [3 Bajo], [Solicitar aceptación],
    [R10], [Ventana de pruebas previas y plan de reversión documentado], [Administración del Sistema], [15], [2], [2], [4 Bajo], [Solicitar aceptación],
  ),
  caption: [Plan de tratamiento con acción, responsable, plazo, riesgo residual y decisión.],
) <tbl-tratamiento>

El escenario R6 mantiene el impacto en 5 porque una filtración de datos conserva su gravedad aunque sea menos probable, por lo que la primera fase deja un residual de 5 Moderado que requiere una segunda fase con una medida adicional de prevención de fuga de datos. El resto de escenarios alcanza un residual igual o menor a 4, de modo que corresponde solicitar la aceptación del responsable con las evidencias de implementación una vez ejecutadas las medidas.

== Registro en Pirani
Los diez escenarios se registraron en el módulo de gestión operativa de riesgos de Pirani con el mismo nombre, impacto y probabilidad de la hoja de cálculo. La @fig-riesgos muestra la tabla final con los diez registros y el contador en 10 de 200. La @tbl-pirani contrasta cada código de Pirani con su escenario de la hoja y el riesgo inherente mostrado por la herramienta.

#figure(
  image("../../img/evidencia-pirani-riesgos.png", width: 62%),
  caption: [Tabla final en Pirani con los diez riesgos registrados.],
) <fig-riesgos>

#figure(
  table(
    columns: (0.8fr, 2fr, 1fr, 1fr, 1.2fr),
    align: left + horizon,
    stroke: 0.5pt + rgb("#808080"),
    table.header(
      table.cell(fill: rgb("#EAEAEA"))[Código],
      table.cell(fill: rgb("#EAEAEA"))[Riesgo],
      table.cell(fill: rgb("#EAEAEA"))[Impacto],
      table.cell(fill: rgb("#EAEAEA"))[Probabilidad],
      table.cell(fill: rgb("#EAEAEA"))[Riesgo inherente],
    ),
    [ORM-1], [R1 Ransomware sobre respaldos], [Catastrófico], [Posible], [Crítico],
    [ORM-2], [R2 Phishing sin segundo factor], [Grave], [Probable], [Alto],
    [ORM-3], [R3 Alteración de notas], [Catastrófico], [Posible], [Crítico],
    [ORM-4], [R4 Falla eléctrica], [Medio], [Posible], [Medio],
    [ORM-5], [R5 Borrado sin ensayo], [Grave], [Posible], [Alto],
    [ORM-6], [R6 Divulgación por enlaces], [Catastrófico], [Posible], [Crítico],
    [ORM-7], [R7 Falla del servidor], [Grave], [Poco probable], [Medio],
    [ORM-8], [R8 Pérdida de conectividad], [Medio], [Poco probable], [Medio],
    [ORM-9], [R9 Robo de portátil], [Catastrófico], [Poco probable], [Alto],
    [ORM-10], [R10 Error de actualización], [Medio], [Posible], [Medio],
  ),
  caption: [Correspondencia entre los escenarios de la hoja y los registros en Pirani.],
) <tbl-pirani>

Los nombres de niveles de Pirani difieren de la escala docente de la guía porque la matriz propia de la herramienta agrupa los mismos productos de 5 por 5 con sus etiquetas. Los valores de probabilidad e impacto registrados son idénticos en ambos soportes, por lo que la diferencia es solo de etiqueta y no de estimación.

== Análisis de resultados
El resumen actual muestra cero riesgos bajos, cuatro moderados, cinco altos y un crítico con diez registros en estado Listo. Seis escenarios comprometen datos académicos y concentran la atención prioritaria. Los cuatro escenarios moderados corresponden a fallas técnicas con impacto acotado a interrupciones de 4 a 8 horas. El tratamiento reduce nueve escenarios a residual bajo y deja un residual moderado en R6 por la gravedad persistente de la divulgación masiva. La reducción del índice por escenario se calcula como el riesgo actual menos el riesgo residual dividido entre el riesgo actual @pilar2016. El archivo entregado con el plan lleno se encuentra en el directorio src del laboratorio.
