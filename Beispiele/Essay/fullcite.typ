#let bibliography-data = state("bibliography-data")
#let bibliography-footnotes = state("bibliography-footnotes")

#let footnotes-gen-footer() = {
    locate(loc => {
        if bibliography-footnotes.at(loc) == none or bibliography-footnotes.at(loc).len() == 0 {
            counter(page).display()
            h(1fr)
            return

        } else {
            line(length: 100%, stroke: 0.25mm)
            counter(page).display()
            h(1fr)
        }

        let footnotes = bibliography-footnotes.at(loc)

        for f in footnotes.footnotes {
            h(1.5em)
            text(size: 12pt, super(str(f.num)))
            text(size: 10pt, f.footnote)
        }
    })

    bibliography-footnotes.update(k => {
        if k != none and "footnotes" in k.keys() {
            k.footnotes = ()
            k
        }
    })
}

#let load-bibliography(file-path) = {
    bibliography-data.update(yaml(file-path))
}

#let fullcite(..args) = {
    let key = ""
    let postfix = none
    let prefix = none
    let args = args.pos()

    if args.len() == 0 {
      panic("Missing argument 'key' for fullcite!")
    } else if args.len() == 1 { // key
      key = args.at(0)

    } else if args.len() == 2 { // key, postfix
      key = args.at(0)
      postfix = args.at(1)

    } else if args.len() == 3 { // key, postfix, prefix
      key = args.at(0)
      postfix = args.at(1)
      prefix = args.at(2)

    } else {
      panic("Too many arguments for fullcite!")
    }

    if prefix != none and str(prefix).trim() != "" {
      prefix += " "
    } else {
      prefix = ""
    }

    if postfix != none and str(postfix).trim() != "" {
      postfix = ", "+postfix
    } else {
      postfix = ""
    }

    locate(loc => {
        let bib_data = bibliography-data.at(loc)

        if key not in bib_data.keys() {
            return strong(text(red, "KEY \""+key+"\" NOT FOUND!"))
        }

        prefix + bib_data.at(key) + postfix
    })
}

#let cite-footnote(f) = {
    bibliography-footnotes.update(k => {
      if k == none {
        (counter: 1, footnotes: ((num: 1, footnote: f),))
      } else {
        k.footnotes.push((num: k.counter+1, footnote: f))
        k.counter += 1
        k
      }
    })

    locate(loc => super(str(bibliography-footnotes.at(loc).counter)))
}