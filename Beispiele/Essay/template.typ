#import "fullcite.typ": footnotes-gen-footer

#let project(title: "", authors: (), date: none, body) = {
  // Set the document's basic properties.
  set document(author: authors.map(a => a.name), title: title)
  set page(
    margin: (left: 25mm, right: 40mm, top: 30mm, bottom: 30mm),
    number-align: center,
    footer: footnotes-gen-footer()
  )

  let fontsize = 12pt
  let linespreadfactor = 1.25
  set text(size: fontsize, font: "Linux Libertine", lang: "de")

  // Author information.
  pad(
    bottom: 0.25em,
    x: 0em,
    y: -2em,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(left)[
        #text(size: 10pt, table(
          columns: (auto, auto),
          inset: 2pt,
          stroke: none,
          strong[Universität:], author.affiliation,
          strong[Institut:], author.institute,
          strong[Dozent:], author.docent,
          strong[Veranstaltung:], author.course,
          strong[Semester:], author.semester,
          strong[Autor:], author.name,
          strong[Datum:], date
        ))
      ]),
    ),
  )

  set par(justify: true)

  // Title row
  line(length: 100%, stroke: 0.25mm)
  block(text(weight: 700, 1.45em, title))
  v(1.5em, weak: true)

  set par(leading: fontsize*linespreadfactor,
    first-line-indent: 1.5em,
    justify: true,
    linebreaks: "optimized")

  show par: set block(spacing: fontsize*linespreadfactor)

  // Main body
  body
}