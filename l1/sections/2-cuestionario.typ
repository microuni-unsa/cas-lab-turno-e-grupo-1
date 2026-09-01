#import "/lib.typ": lab-section

#lab-section("CUESTIONARIO")[
  = CUESTIONARIO Y PREGUNTAS ORIENTADORAS
  #show heading: set text(weight: "bold")
  #set par(justify: true)

  == Fuentes de elicitación de uso más frecuente
  Las técnicas de elicitación más frecuentes en ingeniería de requisitos son las entrevistas, la observación directa, el análisis documental, las encuestas y cuestionarios, los talleres de trabajo, el prototipado y la inspección de sistemas heredados @sommerville2020 @pressman2021 @ieee2024. Para el sistema SIGAE (colegio Nuevo Horizonte), las fuentes primarias fueron entrevistas a interesados clave, revisión de impresos manuales de matrícula y normas institucionales. Las entrevistas y la revisión documental son óptimas al migrar procesos manuales, mientras que los talleres participativos permiten resolver discrepancias entre áreas (p. ej., Caja y Dirección Docente).

  == Aplicación de entrevistas a usuarios finales
  No se entrevista a la totalidad de los usuarios finales por restricciones de costo y viabilidad logística. La literatura distingue entre interesados y usuarios finales, recomendando entrevistar solo a muestras representativas y roles clave @ieee2024 @sommerville2020. En SIGAE, las entrevistas se centraron en la Directora, Secretaría Académica, Caja, Dirección Académica y Administración, omitiendo entrevistas individuales a los 1 200 apoderados. Para grupos masivos se utilizan cuestionarios estructurados y validación con prototipos navegables.

  == Cuestionario frente a encuesta
  Aunque en español suelen usarse como sinónimos, técnicamente el cuestionario es el instrumento de recolección y la encuesta es la metodología global de investigación @pressman2021. El cuestionario permite cuantificar necesidades y prioridades en poblaciones amplias (como los 1 200 apoderados), mientras que la entrevista descubre excepciones operativas y reglas complejas @durán2002rem. En SIGAE, combinar entrevistas a responsables con cuestionarios a docentes y apoderados optimiza tanto la cobertura como la precisión de los requisitos @ieee29148.

  == Preguntas orientadoras del caso
  Del análisis del escenario del colegio Nuevo Horizonte se desprenden los siguientes puntos fundamentales:

  - *Diferenciación entre necesidad y regla de negocio:* La solicitud "quiero consultar pagos realizados" es una necesidad funcional, mientras que la prohibición de matricular sin vacantes es una regla de negocio formalizada como restricción (CTR-03).
  - *Identificación de ambigüedades:* Se aclararon puntos indeterminados como el plazo máximo para regularizar el código provisional de estudiante y el rol con autoridad para otorgar vacantes extraordinarias.
  - *Relaciones de dependencia entre requisitos:* La matrícula (FR-09) requiere configurar el año/vacantes (FR-05/07) y registrar al estudiante (IRQ-01/06). Asimismo, emitir comprobantes (FR-12) exige una matrícula activa.
  - *Cuantificación de la calidad:* Definida con métricas observables: NFR-01 (consultas ≤ 2 s p95), NFR-03 (100 usuarios concurrentes), NFR-05 (hashing de contraseñas) y NFR-10 (respaldo diario con RPO 24 h).
  - *Manejo de excepciones en criterios de aceptación:* Se especificaron respuestas ante eventos no nominales: rechazo por DNI duplicado (FR-01), denegación sin vacantes (CTR-03), bloqueo por año cerrado (CTR-04), bloqueo por 5 intentos fallidos (FR-18) y anulación justificada (FR-10/13).
  - *Priorización de entregas v1:* En v1 se priorizan gestión de estudiantes, matrícula y vacantes (FR-01 a FR-11), administración y seguridad (FR-15 a FR-19), y reportes básicos (FR-21 a FR-23); la automatización de pagos (FR-12 a FR-14) pasa a la segunda fase.
]
