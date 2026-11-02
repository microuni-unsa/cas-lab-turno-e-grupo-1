#import "/components/@unsareport/epis-lab/lib.typ": lab-section

#lab-section("CONCLUSIONES")[
  = CONCLUSIONES
  #show heading: set text(weight: "bold")
  #set par(justify: true)

  1. Instalar JMeter y armar el plan con grupo de hilos, muestreadores, aserciones y receptores cumple el objetivo de conocer y usar herramientas de casos de rendimiento. El árbol del plan deja trazable cada petición y cada punto de recolección @anexo1.

  2. Correr los ejercicios resueltos y propuestos del Anexo 1 evalúa la metodología de siete actividades, de identificar el entorno a analizar resultados. Los escenarios, la variabilidad de usuarios y las métricas definidas permiten comparar lo esperado con lo medido @anexo1.

  3. Revisar receptores agregados y gráficas de peticiones, bytes y códigos por segundo fija los alcances principales de lo probado. Los cuellos de botella se ubican por transacción y capa observada, sin afirmar más de lo registrado @anexo1.

  4. Integrar el plan al ciclo de construcción mediante el complemento de Maven confirma que JMeter basta para las pruebas de carga y estrés del laboratorio. Vale para los escenarios corridos y los umbrales definidos, con repetición priorizada si alguna métrica sale de los límites @anexo1.
]
