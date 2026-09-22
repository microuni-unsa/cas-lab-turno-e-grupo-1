#import "/components/@unsareport/epis-lab/lib.typ": lab-section

#lab-section("CUESTIONARIO")[
  = CUESTIONARIO
  #show heading: set text(weight: "bold")
  #set par(justify: true)

  == Actualmente que actividades utiliza con frecuencia en la gestión de requerimientos y cuales considera que son esenciales?
  Las actividades utilizadas con frecuencia comprenden la elicitación con interesados, la especificación de requerimientos, el modelado visual con casos de uso y actividades, la priorización y el registro de Solicitudes de Cambio (RFC) @pressman2021 @sommerville2020.

  Se consideran tres actividades esenciales:
  1. Establecimiento de líneas base: Versionar formalmente los requerimientos aprobados para fijar el alcance de referencia.
  2. Análisis de impacto: Evaluar las consecuencias técnicas y operativas antes de autorizar cualquier modificación en el Comité de Control de Cambios (CCB).
  3. Criterios de aceptación verificables: Definir condiciones cuantificables que permitan certificar el cumplimiento funcional por parte de Garantía de Calidad de Software (SQA).

  == Que herramienta considera de mejor utilidad para la gestión de requerimientos?
  La utilidad de la herramienta depende de la naturaleza del proyecto:

  Para desarrollo ágil y proyectos de software con integración continua, las herramientas de Gestión del Ciclo de Vida de Aplicaciones (ALM) como GitHub Projects o Jira ofrecen alta utilidad al vincular requerimientos, tareas, código y pruebas en un flujo unificado @pressman2021.

  Para arquitecturas empresariales y sistemas de alta criticidad, herramientas de modelado de arquitectura combinadas con una Base de Datos de Gestión de Configuración (CMDB) resultan de mayor utilidad para controlar dependencias estructurales y verificar cumplimiento de estándares.

  == Que % de recursos del proyecto considera aceptable para gestión de cambios?
  Se considera aceptable asignar entre el 8% y el 12% de los recursos totales del proyecto a la gestión de cambios, situándose el 10% como valor estándar en la industria @pressman2021 @sommerville2020.

  Esta asignación se fundamenta en prevenir el sobrecosto de fallos tardíos y se distribuye en:
  - 3% en análisis de impacto técnico.
  - 2% en deliberación y acuerdos del CCB.
  - 4% en verificación de calidad por SQA y pruebas de regresión.
  - 1% en actualización de líneas base y documentación.
]
