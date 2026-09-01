#import "/lib.typ": lab-section

#lab-section("CUESTIONARIO")[
  = CUESTIONARIO Y PREGUNTAS ORIENTADORAS
  #show heading: set text(weight: "bold")
  #set par(justify: true)

  == 1. ¿Qué fuentes de elicitación son las de uso más frecuente?
  Entrevista, observación, análisis documental, cuestionario/encuesta, taller/workshop, prototipado y revisión de sistemas existentes @sommerville2020 @pressman2021 @ieee2024. En el caso Nuevo Horizonte las más frecuentes fueron declaraciones de interesados (§4), formularios/fichas actuales (§6.1) y reglas §8. La entrevista y el análisis de documentos dominan en dominios con proceso manual previo; el taller es frecuente cuando hay conflicto entre áreas (caja vs. docencia).

  == 2. ¿La entrevista se realiza en todos los casos a los usuarios finales?
  No. SWEBOK y Sommerville distinguen interesados (stakeholders) de usuarios finales @ieee2024 @sommerville2020. Se entrevista a muestra representativa + decisores + personal de soporte. En SIGAE se entrevista a Directora, Secretaría, Caja, Dirección Académica y Administradora, no a los 1 200 apoderados. La técnica se selecciona por riesgo y costo: para apoderados es más eficiente cuestionario + validación de prototipo que entrevistar a todos.

  == 3. ¿Cuál considera más efectiva: el cuestionario o la encuesta? (matiz)
  En la literatura hispana ambos términos se usan indistintos; en inglés `questionnaire` es el instrumento y `survey` el método @pressman2021. Efectividad depende del objetivo: cuestionario estructurado es efectivo para cuantificar necesidades y priorizar (útil para apoderados, 1 200 casos); entrevista es más efectiva para descubrir reglas y excepciones (ej. "código provisional autorizado" §6.1) @durán2002rem. Para SIGAE la combinación entrevista (directivos) + cuestionario (apoderados/docentes) maximiza cobertura y verificabilidad @ieee29148.

  == 4. Preguntas orientadoras del caso (síntesis)
  - *Necesidad vs. regla:* "consultar pagos" = necesidad; "una matrícula activa/año" = regla (CTR-02).
  - *Ambigüedad que exige consulta:* plazo de regularización del código provisional y quién autoriza exceso de vacantes (CTR-03).
  - *Dependencias:* FR-09 depende de FR-05/07 e IRQ-01/06; FR-12 depende de matrícula activa.
  - *Calidad medible:* NFR-01 (≤2s p95), NFR-03 (100 concurrentes), NFR-05 (hash), NFR-10 (RPO 24h).
  - *Excepciones en CA:* duplicado documento (FR-01), sin vacante, año cerrado (CTR-04), 5 fallos bloqueo (FR-18), anulación con motivo (FR-10/13).
  - *Prioridad v1:* estudiante/matrícula/vacantes, usuarios/seguridad, reportes básicos; pagos iter-2 según Gantt.

]
