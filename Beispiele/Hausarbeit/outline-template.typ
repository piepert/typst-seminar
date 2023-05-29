#let outline(title: "Inhaltsverzeichnis", depth: none, indent: true, fill: " . ") = {
  heading(title, numbering: none)

  locate(it => {
    let elements = query(selector(heading).after(it), it)

    for (i, e) in elements.enumerate() {
      if e.outlined == false or (depth != none and r.level > depth) { continue }

      let number = if e.numbering != none {
        numbering(e.numbering, ..counter(heading).at(e.location()))
        " "
      }

      let line = {
        if indent {
          h(1em * (e.level - 1 ))
        }

        if e.level == 1 {
          v(weak: true, 0.5em)
          set text(weight: "bold")
          number
          e.body

        } else {
          number
          e.body
        }

        // Filler dots
        box(width: 1fr, h(3pt) + box(width: 1fr, repeat(fill)) + h(3pt))

        // Page number
        let page_number = counter(page).at(e.location()).first()
        str(page_number)
        linebreak()
      }

      link(e.location(), line)
    }
  })
}
