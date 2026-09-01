#import "/lib.typ": lab-section

#lab-section("ANEXO")[
  = ANEXO — CATÁLOGO DE LA ESPECIFICACIÓN DE REQUISITOS DE SOFTWARE
  #show heading: set text(weight: "bold")
  #set par(justify: true)

  #let total = 28
  #for start in range(1, total + 1, step: 4) {
    let end = calc.min(start + 4, total + 1)
    let pages = range(start, end)
    block(breakable: false)[
      #grid(
        columns: (1fr, 1fr),
        gutter: 2pt,
        row-gutter: 2pt,
        ..pages.map(n => {
          let name = "../img/anexo/page-" + (if n < 10 { "0" + str(n) } else { str(n) }) + ".png"
          align(center)[
            #image(name, width: 73%)
            #v(-3pt)
            #text(size: 6.5pt, weight: "bold")[Página de catálogo #n]
          ]
        }),
      )
    ]
    v(0.5em)
  }
]
