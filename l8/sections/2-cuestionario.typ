#import "/components/@unsareport/epis-lab/lib.typ": lab-section

#lab-section("CUESTIONARIO")[
  = CUESTIONARIO
  #show heading: set text(weight: "bold")
  #set par(justify: true)

  == Que variables se mide en las pruebas de perfomance?
  Lo principal es tiempo de respuesta por transacción, rendimiento en transacciones o peticiones por segundo, uso de recursos de servidor y red, y códigos de respuesta. El tiempo mira al usuario, el rendimiento al negocio y los recursos al sistema, así que los criterios de aceptación mezclan las tres vistas. En JMeter se ven como bytes por tiempo, peticiones por segundo, reparto de códigos por segundo y errores por muestreador @anexo1 @scielo2016.

  == Cual es el protocolo para revisar y evaluar resultados de jmeter?
  Primero se validan prueba, datos y entorno antes de aceptar ningún resultado. Después se revisan los receptores por muestreador, que juntan tiempos, rendimiento y errores por transacción. Esas mediciones se comparan con los criterios de aceptación de la planificación, atentos a cuellos de botella en base de datos y servidor de aplicaciones. El análisis se hace en equipo multidisciplinario y cierra con el informe y la repetición priorizada de lo que no llegó a los umbrales, hasta completar el escenario @anexo1 @jmeter2025.

  == Conoce otra herramienta de medición de perfomance, si es si, resuma funcionalidad
  La alternativa es Gatling, código abierto para carga sobre protocolo de transferencia de hipertexto. Define escenarios de usuarios virtuales con un lenguaje específico de dominio sobre Scala, inyecta carga distribuida con rampas y picos configurables, y genera informes con percentiles de respuesta, tasa de peticiones y reparto de errores. Entra a los proyectos por su complemento oficial de Maven y cubre el mismo flujo automatizado del laboratorio @gatling2025.
]
