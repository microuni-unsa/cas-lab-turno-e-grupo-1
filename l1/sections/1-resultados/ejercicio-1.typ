#import "/lib.typ": lab-section

== ESPECIFICACIÓN DE REQUISITOS DE SOFTWARE Y MODELADO CON LA HERRAMIENTA REM

=== Objetivo
El presente laboratorio implementa la especificación de requisitos de software (ERS) del Sistema Integrado de Gestión Académica Escolar (SIGAE) para la institución educativa colegio Nuevo Horizonte. El objetivo principal reside en centralizar la información relativa a estudiantes, matrículas, pagos, usuarios y reportes en una fuente única y trazable, garantizando el control de acceso basado en roles (RBAC) y la auditoría de operaciones. Se aplica la estructura de la norma IEEE 29148 @ieee29148 junto a la plantilla de especificación de Durán @durán2002rem. La primera versión del sistema excluye los módulos de aula virtual, biblioteca, control biométrico, transporte, inventarios y planillas de personal, según lo definido en el alcance preliminar del proyecto.

=== Descripción del trabajo realizado
1. *Elicitación y análisis del enunciado.* Se identificaron y extrajeron 7 interesados, 6 actores principales, 5 objetivos del negocio (OBJ), 7 requisitos de información (IRQ), 23 requisitos funcionales (FR), 11 requisitos no funcionales (NFR) y 5 restricciones del sistema (CTR) a partir de los requerimientos y condiciones del problema. En este proceso se diferenció conceptualmente entre necesidades de los interesados, reglas de negocio, restricciones del entorno y atributos de calidad @sommerville2020 @pressman2021.

2. *Modelado de Requisitos con REM.* Se definieron 2 organizaciones (Colegio y Equipo de desarrollo), 7 interesados, 6 actores del sistema, 5 objetivos OBJ, 8 casos de uso UC, 7 IRQ, 5 CTR, 23 FR y 11 NFR. Cada elemento registrado cuenta con su fuente de origen, regla de negocio asociada y criterio de aceptación cuantificable. La verificación automática del modelo mediante la herramienta REM resultó libre de inconsistencias o advertencias.

3. *Especificación y validación.* La ERS se estructuró siguiendo los estándares IEEE 29148 @ieee29148 e IEEE 830 @ieee830, garantizando que cada enunciado sea claro, completo, consistente, verificable y trazable. La exportación del modelo generó la documentación técnica final adjunta en el catálogo.

4. *Diagramación técnica.* Se elaboró el cronograma de desarrollo del proyecto estructurado en 18 semanas bajo el proceso unificado de desarrollo de software (RUP), así como el organigrama organizativo de roles. El modelo de casos de uso integra las funciones de Secretaría, Caja, Docente, Apoderado, Administración y Dirección.

=== Resultados obtenidos
*Estadísticas del Modelo.* Se resumen a continuación los componentes modelados y consolidados dentro de la herramienta de requisitos:

#table(
  columns: (2fr, 1fr),
  align: left + horizon,
  stroke: 0.5pt + rgb("#808080"),
  table.header([Entidad / Artefacto], [Cantidad]),
  [Organización], [2],
  [Interesado], [7],
  [Actor del Sistema], [6],
  [Objetivo de Negocio (OBJ)], [5],
  [Caso de Uso (UC)], [8],
  [Requisito de Información (IRQ)], [7],
  [Requisito Funcional (FR)], [23],
  [Requisito No Funcional (NFR)], [11],
  [Restricción del Sistema (CTR)], [5],
  table.cell(colspan: 2, align: center)[*Total de entidades especificadas*: 74],
)

En la @fig-rem-1 y en la @fig-rem-2 se presentan las evidencias de uso de la herramienta REM durante el proceso de modelado, mostrando la captura estructurada de requerimientos y la verificación de consistencia del proyecto SIGAE.

#figure(
  image("../../img/rem-1.png", width: 68%),
  caption: [Captura de pantalla de la herramienta REM durante el modelado de requisitos.],
) <fig-rem-1>

#figure(
  image("../../img/rem-2.png", width: 68%),
  caption: [Panel de validación de consistencia y gestión de entidades en REM.],
) <fig-rem-2>

En la @fig-use-cases se ilustra el modelo de casos de uso principal del sistema SIGAE, detallando la interacción entre los actores institucionales y los módulos funcionales.

#figure(
  image("../../img/use_cases.png", width: 65%),
  caption: [Modelo de casos de uso del sistema SIGAE.],
) <fig-use-cases>

En la @fig-gantt se presenta la planificación temporal del proyecto mediante un cronograma basado en RUP (18 semanas), contemplando actividades en paralelo, hitos de control y las cuatro fases del proceso unificado.

#figure(
  image("../../img/sigae_gantt.png", width: 65%),
  caption: [Cronograma de desarrollo del proyecto basado en RUP.],
) <fig-gantt>

En la @fig-organigrama se expone la estructura organizativa del equipo del proyecto, coordinada por la jefatura de proyecto hacia las áreas de análisis, arquitectura, desarrollo, calidad y operaciones.

#figure(
  image("../../img/sigae_organigrama.png", width: 60%),
  caption: [Organigrama de roles del equipo de proyecto.],
) <fig-organigrama>

*Matriz de trazabilidad y resumen de requisitos.* La correspondencia entre los objetivos del negocio y los componentes del sistema se establece de la siguiente manera:

- *OBJ-01 Centralizar información trazable:* Se satisface mediante IRQ-01 a IRQ-07, FR-01 a FR-04, FR-20 (auditoría), CTR-05 y NFR-10/11.
- *OBJ-02 Gestión de matrícula con vacantes y vigencia:* Se relaciona con IRQ-01, IRQ-03, IRQ-06, FR-05 a FR-11, CTR-02 a CTR-04, y UC-03/04.
- *OBJ-03 Control y gestión financiera:* Se cumple mediante IRQ-04, FR-12 a FR-14, CTR-05 (auditoría) y UC-05.
- *OBJ-04 Seguridad y control de acceso RBAC:* Se implementa a través de IRQ-05, IRQ-07, FR-15 a FR-19, NFR-05 a NFR-07, CTR-05 y UC-06/07.
- *OBJ-05 Generación de reportes por rol:* Se satisface mediante FR-21 a FR-23, NFR-01 y UC-08.

Las reglas de negocio establecidas en el dominio fueron formalizadas como restricciones CTR y validadas mediante requisitos funcionales: unicidad de documento (CTR-02), 1 matrícula activa por estudiante por año (CTR-02), vacantes con autorización (CTR-03), borrado lógico de pagos (CTR-05), cierre de año bloquea matrículas (CTR-04), visibilidad por rol y auditoría inmutable (CTR-05).

*Artefactos verificables.* Cada requisito funcional FR y no funcional NFR incluye criterios de aceptación medibles. Por ejemplo, en FR-01 el documento duplicado deriva en un rechazo con mensaje "Documento ya registrado". En NFR-01 se exige un tiempo de respuesta en percentil 95 (p95) ≤ 2 s bajo 100 usuarios concurrentes (NFR-03). El hashing de contraseñas (NFR-05), el canal cifrado HTTPS (NFR-06) y la seguridad RBAC (NFR-07) son verificables por inspección y pruebas de seguridad.

=== Análisis de resultados
*Calidad de la especificación.* El modelo elaborado satisface los atributos de calidad definidos por los estándares IEEE 830 @ieee830 e IEEE 29148 @ieee29148: es claro (plantilla REM), completo (74 entidades), consistente (restricciones CTR sin contradicción), verificable (criterios medibles) y trazable bidireccionalmente (OBJ a IRQ, FR, UC y CTR) @ieee2024.

*Cadena de dependencias.* El registro de matrícula (FR-09) depende de configurar el año y vacantes (FR-05/07) y de registrar al estudiante (IRQ-01/06). El registro de pago (FR-12) exige matrícula activa (FR-09). Autenticación y bloqueo (FR-17/18) preceden al control de acceso. Esta secuencia justifica el orden del cronograma RUP.

*Rendimiento y capacidad operativas.* Las metas de rendimiento NFR-01 (≤ 2 s consultas) y NFR-02 (≤ 4 s matrícula) se verifican con pruebas de carga @ieee29148. NFR-03 (100 concurrentes) y NFR-04 (99% disponibilidad) requieren monitoreo de infraestructura. NFR-08 (capacitación ≤ 2 h) se valida con 5 usuarios novatos.

*Ventajas y limitaciones del modelado con REM.*

#table(
  columns: (1fr, 1fr),
  align: left + horizon,
  stroke: 0.5pt + rgb("#808080"),
  table.header([Ventajas del enfoque], [Limitaciones y riesgos identificados]),
  [Fuente única y trazabilidad OBJ a FR y UC. Detección temprana de duplicidades y vacantes.],
  [Curva de aprendizaje inicial de la plantilla REM; exige rigor en criterios de aceptación.],
  [La plantilla de Durán @durán2002rem reduce ambigüedad y documenta precondiciones y postcondiciones.],
  [Exportación a documentos requiere ajustes de presentación en tablas extensas.],
  [Verificación del modelo e IRQ-07/FR-20 (auditoría) brindan evidencia objetiva para decisiones.],
  [El alcance inicial acotado requiere refactorización para agregar biométrico o biblioteca.],
  [Roles y RBAC explícitos facilitan la matriz de permisos y pruebas de seguridad.],
  [Datos sensibles exigen NFR-10 (respaldo diario, RPO 24 h, RTO 4 h) y NFR-11 (privacidad) operativos en infraestructura.],
)
