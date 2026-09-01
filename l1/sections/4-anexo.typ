#import "/lib.typ": lab-section

#lab-section("ANEXO")[
  = ANEXO — CATÁLOGO ERS (4 páginas por hoja)
  #show heading: set text(weight: "bold")
  #set par(justify: true)

  Catálogo completo de la ERS generado desde el modelo. Cada hoja física contiene 4 páginas lógicas del catálogo (28 páginas → 7 hojas).

  #set image(width: 100%)
  #let total = 28
  #for start in range(1, total + 1, step: 4) {
    let end = calc.min(start + 4, total + 1)
    let pages = range(start, end)
    grid(
      columns: 2,
      gutter: 6pt,
      row-gutter: 6pt,
      ..pages.map(n => {
        let name = "../img/anexo/page-" + (if n < 10 { "0" + str(n) } else { str(n) }) + ".png"
        figure(
          image(name),
          caption: [Catálogo p. #n],
          supplement: none,
          numbering: none,
        )
      }),
    )
    v(1em)
  }
]
