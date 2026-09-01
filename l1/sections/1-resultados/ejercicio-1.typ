#import "/lib.typ": lab-section

== 1. ESPECIFICACIÓN DE REQUISITOS DE SOFTWARE (ERS) Y MODELADO REMUS

=== 1.1 Objetivo
El laboratorio implementa la ERS del Sistema Integrado de Gestión Académica Escolar (SIGAE) para el colegio Nuevo Horizonte. Objetivo: centralizar estudiantes, matrículas, pagos, usuarios y reportes en fuente única trazable, con control por roles y auditoría. Se aplica la estructura IEEE 29148 @ieee29148 y la plantilla de Durán @durán2002rem. La primera versión excluye aula virtual, biblioteca, biométrico, transporte, inventarios y planillas (alcance preliminar §5).

=== 1.2 Descripción del trabajo realizado
1. *Elicitación y análisis del enunciado.* Se extrajeron 7 interesados, 6 actores, 5 objetivos, 7 requisitos de información (IRQ), 23 funcionales (FR), 11 no funcionales (NFR) y 5 restricciones (CTR) a partir de §4-§9. Se distinguió necesidad vs. regla de negocio vs. restricción vs. dato @sommerville2020 @pressman2021.

2. *Modelado.* Se definieron 2 organizaciones (Colegio y Equipo de desarrollo), 7 interesados, 6 actores, 5 objetivos, 8 casos de uso, 7 IRQ, 5 CTR, 23 FR y 11 NFR. Cada requisito registra fuente (§), regla asociada y criterio de aceptación medible. La validación del modelo resulta sin errores ni advertencias.

3. *Especificación y validación.* La ERS se estructura según IEEE 29148 @ieee29148 con atributos de calidad de IEEE 830 @ieee830: clara, completa, consistente, verificable y trazable. La exportación a catálogo genera la Especificación de Requisitos de Software completa (Anexo).

4. *Diagramas.* Cronograma RUP de 18 semanas y organigrama de roles. El modelo de casos de uso integra Secretaría, Caja, Docente, Apoderado, Administración y Dirección.

=== 1.3 Resultados obtenidos
*Proyecto REM.* Estadísticas de validación:

#table(
  columns: (2fr, 1fr),
  align: left + horizon,
  stroke: 0.5pt + rgb("#808080"),
  table.header([Entidad], [Cantidad]),
  [Organización], [2],
  [Interesado], [7],
  [Actor], [6],
  [Objetivo (OBJ)], [5],
  [Caso de uso (UC)], [8],
  [Requisito de información (IRQ)], [7],
  [Requisito funcional (FR)], [23],
  [Requisito no funcional (NFR)], [11],
  [Restricción (CTR)], [5],
  table.cell(colspan: 2, align: center)[*Total entidades*: 74],
)

#figure(
  image("../../img/use_cases.png", width: 92%),
  caption: [Modelo de casos de uso SIGAE. Actores: Secretaría, Caja, Docente, Apoderado, Administración y Dirección.],
) <fig-use-cases>

#figure(
  image("../../img/sigae_gantt.png", width: 95%),
  caption: [Cronograma RUP 18 semanas. Incepción (ERS) 21 d, Elaboración 21 d, Construcción iter-1 (matrícula/usuarios) 28 d + iter-2 (pagos/reportes) 28 d, Transición 21 d.],
) <fig-gantt>

#figure(
  image("../../img/sigae_organigrama.png", width: 85%),
  caption: [Organigrama de roles. Jefatura de proyecto coordina análisis, arquitectura, UI/UX, desarrollo, calidad y administración de datos.],
) <fig-organigrama>

*Catálogo resumido.* Trazabilidad OBJ→FR/NFR/IRQ/CTR:

- OBJ-01 Centralizar información trazable → IRQ-01..07, FR-01..04, FR-20, CTR-05, NFR-10/11.
- OBJ-02 Matrícula con vacantes y vigencia → IRQ-01/03/06, FR-05..11, CTR-02..04, UC-03/04.
- OBJ-03 Gestión financiera → IRQ-04, FR-12..14, CTR-05, UC-05.
- OBJ-04 Seguridad RBAC → IRQ-05/07, FR-15..19, NFR-05..07, CTR-05, UC-06/07.
- OBJ-05 Reportes por rol → FR-21..23, NFR-01, UC-08.

Reglas §8 formalizadas como CTR y validadas en FR: unicidad de documento, 1 matrícula activa/año, vacantes con autorización, borrado lógico, cierre de año bloquea matrículas, visibilidad por rol y auditoría.

*Artefactos verificables.* Cada FR/NFR incluye criterio de aceptación (CA) medible: FR-01 CA = documento duplicado → rechazo con mensaje "Documento ya registrado"; NFR-01 CA = p95 ≤2 s en 100 concurrentes (NFR-03). Contraseñas con hash salado (NFR-05), canal cifrado (NFR-06) y control de acceso por rol (NFR-07) son verificables por inspección y pruebas.

=== 1.4 Análisis de resultados
*Calidad de la ERS.* Cumple atributos de IEEE 830 @ieee830 y 29148 @ieee29148: clara (plantilla REM), completa (74 entidades cubren §6.1-6.5 y §8), consistente (reglas CTR sin contradicción), verificable (CA cuantificados), trazable (OBJ→IRQ/FR/UC) @ieee2024.

*Dependencias.* FR-09 (registrar matrícula) depende de FR-05/07 (configurar año/vacantes) y de IRQ-01/06; FR-12 (registrar pago) depende de matrícula activa (FR-09); FR-17/18 (autenticar/bloqueo) precede a todo el control de acceso. Esta cadena justifica el orden del cronograma.

*Rendimiento y capacidad.* NFR-01 (≤2 s consultas) y NFR-02 (≤4 s matrícula) se prueban con carga @ieee29148; NFR-03 (100 concurrentes) y NFR-04 (99% mensual) requieren monitoreo y escalado. NFR-08 (usabilidad tras 2 h capacitación) se valida con 5 usuarios novatos; NFR-09 (compatibilidad Windows + móvil apoderado) vía pruebas de compatibilidad.

*Ventajas y limitaciones del modelado con REM.*

#table(
  columns: (1fr, 1fr),
  align: left + horizon,
  stroke: 0.5pt + rgb("#808080"),
  table.header([Ventajas], [Limitaciones / Riesgos]),
  [Fuente única y trazabilidad OBJ→FR→UC exigida en §3 y §8. Detección temprana de duplicidad y vacantes.],
  [Curva de aprendizaje de la plantilla; requiere disciplina en criterios de aceptación.],
  [Plantilla de Durán @durán2002rem reduce ambigüedad; campos de precondición/postcondición documentan excepciones (§8).],
  [Exportación a documentos requiere validación adicional de formato.],
  [Validación del modelo y auditoría (IRQ-07/FR-20) generan evidencia para toma de decisiones.],
  [Primera versión recorta alcance (CTR-01); incorporar biométrico/biblioteca exige refactorización.],
  [Roles y RBAC explícitos (§6.4, §8) facilitan matriz de permisos y pruebas.],
  [Datos sensibles requieren NFR-10 (respaldo diario, RPO 24 h, RTO 4 h) y NFR-11 (privacidad) operativos, no solo de especificación.],
)

*Preguntas orientadoras (§12).*
- Necesidad vs. regla: "quiero consultar pagos" es necesidad; "una sección no supera vacantes salvo autorización" es regla (CTR-03).
- Ambigüedades: "código provisional autorizado, luego debe actualizarse" (¿plazo? ¿quién autoriza?) requiere consulta; "comunicación protegida" se precisa como canal cifrado (NFR-06).
- Dependencias: ver párrafo anterior.
- Calidad medible: NFR-01/02/03/04/05/06/10 son cuantificables; "capacitación breve" se operacionaliza como ≤2 h y 5 usuarios (NFR-08).
- Excepciones: documento duplicado (FR-01), vacante excedida sin autorización (CTR-03), cierre de año (CTR-04), 5 intentos fallidos (FR-18), anulación con motivo/autorización (FR-10/13).
- Prioridad v1: FR-01..11 (estudiante/matrícula/vacantes), FR-15..19 (usuarios/seguridad), FR-21..23 (reportes básicos); pagos (FR-12..14) en segunda iteración.

=== 1.5 Conclusiones
1. La ERS centraliza el caso Nuevo Horizonte en 74 entidades trazables y 31 requisitos verificables (23 FR + 8 UC) que cubren registro, matrícula con vacantes, pagos con borrado lógico y reportes por rol. La validación sin errores confirma consistencia; la completitud se apoya en §6 y §8.

2. El control de reglas críticas (unicidad documento CTR-02, vacantes con autorización CTR-03, cierre de año CTR-04, auditoría CTR-05) se implementa como restricciones validables en base de datos y pruebas de aceptación, reduciendo duplicidad y retrabajo señalados en §2.

3. Las NFR operacionalizadas (2 s/4 s, 100 concurrentes, 99%, hash, canal cifrado, respaldo diario) hacen la calidad comprobable; sin ellas la ERS sería no verificable @ieee29148 @ieee2024. La arquitectura iterativa entrega valor temprano (matrícula) y mitiga riesgo de seguridad.

4. El modelado trazable y los criterios de aceptación medibles permiten planificar construcción y transición en 18 semanas, con evidencia objetiva para validación y auditoría.
