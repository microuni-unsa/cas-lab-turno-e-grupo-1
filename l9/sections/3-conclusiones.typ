#import "/components/@unsareport/epis-lab/lib.typ": lab-section

#lab-section("CONCLUSIONES")[
  = CONCLUSIONES
  #show heading: set text(weight: "bold")
  #set par(justify: true)

  1. Selenium 4.52.0 con sus navegadores emparejados deja instalada la herramienta que pide la guía. La factoría común resuelve cada navegador y cada controlador sin rutas manuales @selenium2025.

  2. Los diez ejercicios pasan de Selenium 3 a la interfaz vigente con localizadores robustos y esperas explícitas. Esa combinación absorbe los cambios que sufrieron las páginas desde la publicación del repositorio @githubselenium.

  3. Tiempos, estados, textos y capturas fijan lo que se probó: apertura, escritura, pulsación, selección, ventanas, navegación y equivalencia entre Chromium y Firefox, todo en verde @guia9.

  4. El envío de consultas a Google queda documentado como límite de red, no como fallo de Selenium. Vale para los escenarios corridos con sus límites observados, sin afirmar más de lo registrado @selenium2025.
]
