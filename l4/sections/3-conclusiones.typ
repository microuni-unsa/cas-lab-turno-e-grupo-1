#import "/components/@unsareport/epis-lab/lib.typ": lab-section

#lab-section("CONCLUSIONES")[
  = CONCLUSIONES
  #show heading: set text(weight: "bold")
  #set par(justify: true)

  1. El dimensionamiento temprano reduce la incertidumbre inicial y mejora la toma de decisiones en la gestión del proyecto. El Anexo 1 quedó medido en 125 puntos de función ajustados con S/ 18,750 de costo directo y plazos ideales de 12.5 meses con 1 persona y 4.2 meses con 3 personas, valores que solo resultan interpretables junto con la tarifa de S/ 150 por punto y la productividad de 10 puntos por persona mes declaradas en el cálculo.

  2. La metodología NESMA resulta adecuada para estimar en etapas tempranas sin depender del código fuente y para obtener métricas comparables entre desarrollos. El conteo de 139 puntos no ajustados con factor 0.90 alimenta ambas plantillas: la PERT lo descompone en 12 paquetes ANX01 a ANX12 y la COCOMO II lo convierte a 8.34 KLOC en Java. El ajuste por experiencia mostró que la madurez del equipo afecta la productividad y el esfuerzo sin cambiar por sí sola la funcionalidad entregada.

  3. El modelo COCOMO II resulta confiable cuando sus datos de entrada tienen calidad, aunque su precisión depende de la conversión de tamaño y de los parámetros adoptados. La comparación homogénea confirmó 254.5 días persona en la plantilla PERT frente a 170.85 días persona en la plantilla COCOMO II, con USD 19,138.40 frente a USD 12,172.73 por sus distintas tarifas, por lo que cada cifra de la tabla comparativa exige leer su método, su unidad y sus supuestos antes de usarla en una decisión de plazo o costo.
]
