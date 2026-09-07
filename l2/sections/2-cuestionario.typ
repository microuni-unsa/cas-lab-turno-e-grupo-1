#import "/lib.typ": lab-section

#lab-section("CUESTIONARIO")[
  = CUESTIONARIO Y PREGUNTAS ORIENTADORAS
  #show heading: set text(weight: "bold")
  #set par(justify: true)

  == Actividades frecuentes y esenciales en la gestión de requerimientos
  Las actividades frecuentes en la gestión de requerimientos comprenden la elicitación con interesados, la especificación documental, la priorización de necesidades, la trazabilidad con casos de prueba y el control formal de modificaciones mediante solicitudes de cambio @sommerville2020 @pressman2021.

  Se consideran esenciales tres actividades:
  1. Establecimiento de líneas base: Versionar los requerimientos aprobados define el marco de referencia formal para el proyecto @ieee828.
  2. Control de cambios con análisis de impacto: Evaluar el esfuerzo, costo y riesgos colaterales antes de modificar artefactos previene la corrupción del alcance @torres2002 @baufest2003.
  3. Criterios de aceptación verificables: Disponer de condiciones observables y medibles permite validar el cumplimiento funcional por parte del equipo de calidad (SQA).

  == Herramienta de mejor utilidad para la gestión de requerimientos
  La utilidad de una herramienta depende del contexto operativo del proyecto:

  Para el desarrollo de software institucional, GitHub Projects junto con GitHub Issues resulta de gran utilidad debido a su integración nativa con el repositorio de código fuente, el control de ramas y la trazabilidad directa de tareas @pressman2021.

  Para la administración de dependencias de servicios y activos de infraestructura, i-doit (CMDB) aporta una visualización relacional indispensable para evaluar el impacto de un cambio en la operación institucional.

  == Porcentaje de recursos del proyecto aceptable para gestión de cambios
  El porcentaje de recursos aceptable para la gestión de cambios se sitúa entre el 8% y el 12% del esfuerzo total, siendo el 10% el valor estándar recomendado en la industria @pressman2021 @sommerville2020.

  Esta asignación se fundamenta en la curva de Boehm, donde corregir un desvío en fases iniciales cuesta una fracción mínima en comparación con resolver un fallo en producción. Este esfuerzo se distribuye en:
  - 3% en análisis de impacto técnico.
  - 2% en gestión del Comité de Control de Cambios (CCB).
  - 4% en verificación de calidad (SQA) y pruebas de regresión.
  - 1% en auditoría de configuración y actualización de línea base.
]
