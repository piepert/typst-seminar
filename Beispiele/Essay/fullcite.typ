// Habe hier ein eigenes Bibliographie-Plugin geschrieben, weil
// in den Essays des Instituts für Philosophie kein Literaturverzeichnis
// nötig ist, sondern nur Fußnoten bevorzugt werden. Und Fußnoten
// kann Typst ja nicht, also musste ich improvisieren.

// enthält die Bibliographie-Daten der YAML-Datei
#let bibliography-data = state("bibliography-data")
// enthält die Fußnoten für eine bestimmte Seite und einen counter, der
// für die Fußnoten mitzählt
#let bibliography-footnotes = state("bibliography-footnotes")

// Funktion, die in template.typ in jedem Seiten-Footer aufgerufen
// wird und somit die Fußnoten darstellen muss.
#let footnotes-gen-footer() = {
    // Zuerst wird der Footer generiert.
    locate(loc => {
        // den State an der aktuellen Stelle bekommen
        let footnotes = bibliography-footnotes.at(loc)

        // Wenn es irgendwie Probleme mit dem State gibt (er z.B. nicht richtig
        // initialisiert wurde oder die Fußnoten leer sind), wird erstmal nur die
        // Seitennummer angegeben und die Funktion wird verlassen
        if footnotes == none or footnotes.len() == 0 {
            counter(page).display()
            h(1fr)
            return

        // sonst wird eine nette Linie gezeichnet, die Seitenzahl und weiter gehts.
        } else {
            line(length: 100%, stroke: 0.25mm)
            counter(page).display()
            h(1fr)
        }

        // jetzt wird jede Fußnote generiert
        for f in footnotes.footnotes {
            h(1.5em) // Abstand aus ästhetischen Gründen zwischen jeder Fußnote

            // damit die Fußnotenzahl etwas besser lesbar wird, ist die Schriftgröße
            // für sie größer
            text(size: 12pt, super(str(f.num)))

            // und damit der Text der Fußnote nicht zu groß wird, wird die
            // Schriftgröße für sie etwas kleiner
            text(size: 10pt, f.footnote)
        }
    })

    // Danach werden die Fußnoten geleert, damit sie nicht auf
    // der nächsten Seite nochmal auftauchen.
    bibliography-footnotes.update(k => {
        if k != none and "footnotes" in k.keys() {
            k.footnotes = ()
        }

        k
    })
}

#let load-bibliography(file-path) = {
    // YAML-Datei der Bibliographie wird geladen und direkt in ein
    // Dictionary-Objekt umgewandelt
    bibliography-data.update(yaml(file-path))
}

#let fullcite(..args) = {
    let key = ""
    let postfix = none
    let prefix = none
    let args = args.pos()

    // Die Funktion kann mit beliebig vielen Argumenten aufgerufen
    // werden, das wird hier abgecheckt.
    if args.len() == 0 {
      panic("Missing at least one argument 'key' for fullcite!")

    } else if args.len() == 1 { // fullcite(key)
      key = args.at(0)

    } else if args.len() == 2 { // fullcite(key, postfix)
      key = args.at(0)
      postfix = args.at(1)

    } else if args.len() == 3 { // fullcite(key, postfix, prefix)
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

  // Zitat nach dem Schema "<Prefix> <Quelle>, <Postfix>" erstellen
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
        // Wenn die Fußnoten vorher leer waren,
        // sind sie jetzt mit 1 Element gefüllt, nämlich f
        (counter: 1, footnotes: ((num: 1, footnote: f),))

      } else {
        // Sonst wird f einfach rangehangen und es wird weitergezählt
        k.counter += 1
        k.footnotes.push((num: k.counter, footnote: f))
        k
      }
    })

    // Die Funktion soll zwar zählen, aber es soll nur die Nummer hochgestellt
    // zurückgegeben werden! Der Rest wird dann in den Fußnoten angezeigt
    locate(loc => super(str(bibliography-footnotes.at(loc).counter)))
}