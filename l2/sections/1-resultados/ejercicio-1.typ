#import "/lib.typ": lab-section

== GESTIÓN DE REQUERIMIENTOS Y CONTROL DE CAMBIOS CON I-DOIT Y GITHUB PROJECTS

=== Objetivo
Implementar y evaluar el proceso de gestión de requerimientos y control de cambios para el sistema SIGAE del colegio Nuevo Horizonte mediante las herramientas i-doit y GitHub Projects. Se fundamenta el cambio como un proceso necesario en el ciclo de vida del software, impulsado por el aprendizaje de los interesados y la evolución técnica del proyecto @pressman2021 @sommerville2020. Se aplican los principios de definición clara y seguimiento de atributos de Torres @torres2002, el acuerdo continuo sobre requisitos cambiantes de Baufest @baufest2003 y la captura estructurada de decisiones del proceso RUP referenciado por Guerrero @guerrero2003. Se verifica la correspondencia entre el flujo de cambios del estándar IEEE Std 828 @ieee828 y la implementación práctica en un entorno de gestión de configuración y seguimiento de incidencias.

=== Descripción del trabajo realizado
La práctica se desarrolló en las siguientes etapas:

1. Configuración de herramientas de gestión:
Se configuró i-doit como base de datos de gestión de la configuración (CMDB) para catalogar los componentes del sistema SIGAE, modelando servicios, aplicaciones y dependencias lógicas bajo el marco (ITIL). Paralelamente, se configuró GitHub Projects para la administración ágil de requisitos e incidencias (ALM), definiendo campos personalizados para identificador de requisito, tipo, módulo, prioridad, urgencia y actor responsable.

2. Revisión del flujo de control de cambios:
Se analizó el proceso formal de control de cambios establecido en el estándar IEEE Std 828 @ieee828, que comprende la solicitud de cambio (RFC), el triaje inicial, el análisis de impacto técnico y económico, la deliberación del Comité de Control de Cambios (CCB), la emisión de la orden de cambio de ingeniería (ECO), la modificación de elementos de configuración, la verificación de calidad (SQA) y la consolidación de la nueva línea base.

3. Modelado y seguimiento de 8 requerimientos:
Se registraron y vincularon 8 requerimientos del Laboratorio 1 tanto en GitHub Projects como en i-doit. Cada requerimiento se documentó con su especificación formal, incluyendo reglas de negocio, criterios de aceptación verificables y dependencias del sistema.

4. Comparación técnica entre herramientas:
Se contrastaron los paradigmas de gestión de configuración de i-doit y el seguimiento de requerimientos de GitHub Projects, evaluando la unidad de gestión, el análisis de impacto, la trazabilidad y la pertinencia en el ciclo de desarrollo.

5. Seguimiento y análisis de dependencias:
Se generaron vistas tabulares, matrices de relaciones y árboles de dependencias para evaluar el impacto de las modificaciones sobre los servicios institucionales.

=== Resultados obtenidos
En la @fig-gh-table y en la @fig-gh-custom se presentan las evidencias de la gestión de los requerimientos en GitHub Projects, mostrando la vista tabular general y la configuración de campos personalizados para control de requisitos.

#figure(
  image("../../img/gh_projects_requirements_table.png", width: 65%),
  caption: [Vista tabular de requerimientos y línea base en GitHub Projects.],
) <fig-gh-table>

#figure(
  image("../../img/gh_projects_requirements_custom_fields_table.png", width: 65%),
  caption: [Configuración de campos personalizados de requerimientos en GitHub Projects.],
) <fig-gh-custom>

En la @fig-idoit-list y en la @fig-idoit-service se presenta el catálogo de requerimientos en i-doit (CMDB) y la estructura de componentes del servicio institucional SIGAE.

#figure(
  image("../../img/idoit_applications_requirements_list.png", width: 65%),
  caption: [Catálogo de requerimientos y elementos de software en i-doit CMDB.],
) <fig-idoit-list>

#figure(
  image("../../img/idoit_sigae_service_relationships.png", width: 65%),
  caption: [Estructura de componentes del servicio SIGAE en i-doit.],
) <fig-idoit-service>

A continuación se resumen los 8 requerimientos del Laboratorio 1 gestionados en el ciclo de cambios:

#table(
  columns: (0.9fr, 2.2fr, 1.3fr, 1.6fr, 1fr),
  align: left + horizon,
  stroke: 0.5pt + rgb("#808080"),
  table.header(
    table.cell(fill: rgb("#EAEAEA"))[Código],
    table.cell(fill: rgb("#EAEAEA"))[Nombre del Requisito],
    table.cell(fill: rgb("#EAEAEA"))[Módulo],
    table.cell(fill: rgb("#EAEAEA"))[Actor Principal],
    table.cell(fill: rgb("#EAEAEA"))[Prioridad],
  ),
  [FR-01], [Registrar estudiante], [Estudiantes], [Secretaría Académica], [Vital],
  [FR-07], [Configurar vacantes por sección], [Matrículas], [Dirección Académica], [Vital],
  [FR-09], [Registrar matrícula escolar], [Matrículas], [Secretaría Académica], [Vital],
  [FR-10], [Anular matrícula], [Matrículas], [Dirección Académica], [Vital],
  [FR-12], [Registrar pago de pensiones], [Finanzas], [Responsable de Caja], [Vital],
  [FR-16], [Gestionar roles y permisos], [Seguridad], [Administradora del Sistema], [Vital],
  [FR-18], [Bloqueo por 5 intentos fallidos], [Seguridad], [Administradora del Sistema], [Vital],
  [CTR-02], [Unicidad de documento y matrícula], [Estudiantes], [Dirección Académica], [Vital],
)

A continuación se presenta la tabla de figuras con las evidencias de los 8 requerimientos implementados, contrastando la incidencia en GitHub Issues con el elemento de configuración correspondiente en i-doit:

#table(
  columns: (1fr, 1fr),
  stroke: none,
  gutter: 6pt,
  row-gutter: 8pt,
  align: center + top,
  figure(
    image("../../img/github_issue_01_FR-01_registrar_estudiante.png", width: 100%),
    caption: [FR-01 Registrar estudiante en GitHub Issues],
  ),
  figure(
    image("../../img/idoit_FR-01_registrar_estudiante.png", width: 100%),
    caption: [FR-01 Registrar estudiante en i-doit],
  ),
  figure(
    image("../../img/github_issue_02_FR-07_configurar_vacantes.png", width: 100%),
    caption: [FR-07 Configurar vacantes en GitHub Issues],
  ),
  figure(
    image("../../img/idoit_FR-07_configurar_vacantes.png", width: 100%),
    caption: [FR-07 Configurar vacantes en i-doit],
  ),
  figure(
    image("../../img/github_issue_04_FR-09_registrar_matricula.png", width: 100%),
    caption: [FR-09 Registrar matrícula en GitHub Issues],
  ),
  figure(
    image("../../img/idoit_FR-09_registrar_matricula.png", width: 100%),
    caption: [FR-09 Registrar matrícula en i-doit],
  ),
  figure(
    image("../../img/github_issue_05_FR-10_anular_matricula.png", width: 100%),
    caption: [FR-10 Anular matrícula en GitHub Issues],
  ),
  figure(
    image("../../img/idoit_FR-10_anular_matricula.png", width: 100%),
    caption: [FR-10 Anular matrícula en i-doit],
  ),
  figure(
    image("../../img/github_issue_06_FR-12_registrar_pago.png", width: 100%),
    caption: [FR-12 Registrar pago en GitHub Issues],
  ),
  figure(
    image("../../img/idoit_FR-12_registrar_pago.png", width: 100%),
    caption: [FR-12 Registrar pago en i-doit],
  ),
  figure(
    image("../../img/github_issue_08_FR-16_roles_permisos.png", width: 100%),
    caption: [FR-16 Roles y permisos en GitHub Issues],
  ),
  figure(
    image("../../img/idoit_FR-16_roles_permisos.png", width: 100%),
    caption: [FR-16 Roles y permisos en i-doit],
  ),
  figure(
    image("../../img/github_issue_09_FR-18_bloqueo_intentos.png", width: 100%),
    caption: [FR-18 Bloqueo por intentos en GitHub Issues],
  ),
  figure(
    image("../../img/idoit_FR-18_bloqueo_intentos.png", width: 100%),
    caption: [FR-18 Bloqueo por intentos en i-doit],
  ),
  figure(
    image("../../img/github_issue_10_CTR-02_unicidad_documento.png", width: 100%),
    caption: [CTR-02 Unicidad de documento en GitHub Issues],
  ),
  figure(
    image("../../img/idoit_CTR-02_unicidad_documento.png", width: 100%),
    caption: [CTR-02 Unicidad de documento en i-doit],
  ),
)

La siguiente matriz presenta la comparación técnica entre las herramientas utilizadas:

#table(
  columns: (1.4fr, 1.8fr, 1.8fr),
  align: left + horizon,
  stroke: 0.5pt + rgb("#808080"),
  table.header(
    table.cell(fill: rgb("#EAEAEA"))[Criterio],
    table.cell(fill: rgb("#EAEAEA"))[i-doit (CMDB)],
    table.cell(fill: rgb("#EAEAEA"))[GitHub Projects (ALM)],
  ),
  [Paradigma principal], [Gestión de configuración de infraestructura y servicios (ITIL).], [Gestión ágil del ciclo de vida de aplicaciones y tareas.],
  [Unidad de gestión], [Elemento de configuración (CI).], [Incidencia, tarjeta de proyecto y solicitud de extracción.],
  [Análisis de impacto], [Grafo relacional explícito entre servicios, software y hardware.], [Vinculación manual o por referencias entre incidencias y ramas.],
  [Trazabilidad de requisitos], [Modelado como aplicaciones o servicios dentro de la configuración.], [Trazabilidad directa con ramas, confirmaciones y pruebas.],
  [Control de cambios], [Registro histórico de modificaciones sobre atributos de cada activo.], [Flujo de estados mediante tableros, etiquetas y revisiones.],
  [Gobernanza del (CCB)], [Autorización orientada a la liberación y continuidad de servicios.], [Aprobaciones mediante reglas de fusión y comités en incidencias.],
  [Entorno operativo], [Aplicación web con base de datos relacional.], [Plataforma web distribuida integrada con el repositorio Git.],
)

El seguimiento de los cambios reflejó que los 8 requerimientos se encuentran integrados en la línea base de desarrollo. El análisis en i-doit identificó que el requisito FR-09 concentra el mayor número de dependencias del sistema, requiriendo validaciones de estudiante, vacantes, reglas de unicidad y servicios de base de datos.

=== Análisis de resultados
El análisis de los resultados evidencia que el cambio en los requerimientos representa un factor natural del desarrollo de software @pressman2021. La incorporación de especificaciones mediante GitHub Projects permitió mantener una comunicación directa con el equipo técnico, asociando cada requisito con criterios de aceptación cuantificables.

La utilización de i-doit evidenció las dependencias estructurales que no son visibles en un tablero de tareas convencional. Al modelar el requisito FR-09, se identificó que cualquier modificación sobre la estructura de datos del estudiante o el cálculo de vacantes genera un impacto directo sobre la matrícula y la recaudación de pagos. Esta visibilidad permite que el Comité de Control de Cambios (CCB) tome decisiones informadas antes de autorizar modificaciones, mitigando la corrupción del alcance y preservando la estabilidad del sistema @torres2002 @baufest2003.

Ambas herramientas resultan complementarias: GitHub Projects administra el flujo de trabajo operativo de los desarrolladores, mientras que i-doit salvaguarda la integridad de la configuración global y el catálogo de servicios institucionales @ieee828.
