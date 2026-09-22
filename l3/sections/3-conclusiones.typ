#import "/components/@unsareport/epis-lab/lib.typ": lab-section

#lab-section("CONCLUSIONES")[
  = CONCLUSIONES
  #show heading: set text(weight: "bold")
  #set par(justify: true)

  1. El modelado visual con UML constituye un pilar esencial en la ingeniería de software para transformar requerimientos ambiguos en especificaciones arquitectónicas formales y deterministas @omg2015uml @larman2004. La articulación de vistas estructurales y dinámicas permite verificar la coherencia entre las entidades del dominio y los procesos de negocio antes de la fase de implementación.

  2. La aplicación de patrones de diseño clásicos como Composite y Singleton permite resolver requerimientos arquitectónicos sofisticados con elegancia técnica y bajo acoplamiento @gamma1994. En el dominio de pedidos, Composite asegura el tratamiento polimórfico y transparente de estructuras simples y anidadas preservando las restricciones de integridad sobre cuentas del mismo cliente, mientras que Singleton centraliza con precisión la responsabilidad del ciclo diario de cobro y distribución.

  3. La evaluación formal de los modelos respecto al estándar IEEE Std. 1016-2009 garantiza una cobertura multidimensional del diseño de software mediante puntos de vista estandarizados @ieee1016. La adopción de técnicas de inspección estructuradas como CBR permite auditar sistemáticamente la completitud, dependencias y consistencia semántica de los artefactos, facilitando la labor de SQA y asegurando la trazabilidad de los requerimientos a lo largo del ciclo de vida del sistema.
]
