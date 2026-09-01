#import "/lib.typ": lab-section

#lab-section("CONCLUSIONES")[
  = CONCLUSIONES
  #show heading: set text(weight: "bold")
  #set par(justify: true)

  1. La especificación de requisitos de software (ERS) del Sistema Integrado de Gestión Académica Escolar (SIGAE) centraliza el caso del colegio Nuevo Horizonte en un modelo trazable de 74 entidades y 31 requisitos verificables (23 FR y 8 UC). La verificación automática en la herramienta REM confirma la consistencia y completitud del modelo sin errores ni advertencias.

  2. El modelado de las reglas de negocio críticas como restricciones del sistema (unicidad de documento en CTR-02, límite de vacantes en CTR-03, cierre de año lectivo en CTR-04 y bitácora de auditoría en CTR-05) garantiza la aplicación transparente de las políticas institucionales en la base de datos y en las pruebas de aceptación.

  3. La operacionalización de los atributos de calidad como requisitos no funcionales (NFR-01 a NFR-11, incluyendo respuesta ≤ 2 s en percentil 95 p95, capacidad para 100 usuarios concurrentes, canal cifrado HTTPS NFR-06 y respaldos diarios NFR-10) proporciona la evidencia objetiva para auditar el sistema bajo los estándares IEEE 29148 e IEEE 830.

  4. La trazabilidad bidireccional entre los objetivos de negocio (OBJ-01 a OBJ-05) y los artefactos desarrollados, sumada a los criterios de aceptación medibles, permite estructurar un plan de trabajo iterativo de 18 semanas en el proceso unificado (RUP), facilitando entregas parciales y reduciendo los riesgos en la transición a producción.
]
