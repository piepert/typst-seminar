#import "outline-template.typ": *

#let SUMMER_MONTHS = ("April", "Mai", "Juni", "Juli", "August", "September")

#let project(title: "",
  authors: (),
  university: "<UNIVERSITY>",
  faculty: "<FACULTY>",
  institute: "<INSTITUTE>",
  docent: "<DOCENT>",
  course: "<COURSE>",
  matnr: "<MATNR>",
  date: "<DATE>",
  address: "<ADDRESS>",
  mail: "<MAIL>",
  body) = {

  // date: Day. Month Year
  // Set the document's basic properties.
  set document(author: authors, title: title)
  set page(numbering: "1", number-align: center, paper: "a4")
  set text(font: "Times New Roman", lang: "de", size: 12pt)
  set heading(numbering: "1.1.")

  set page(footer: [])
  // Title row.
  align(center)[
    #pad(top: 4em, [
      #set text(size: 14pt)
      #university
      #v(3em, weak: true)

      #pad(left: 2em,
        right: 2em,
        table(stroke: white, columns: (40%, 60%),
        ..("Fakultät:", faculty,
        "Institut:", institute,
        "Dozent:", docent,
        "Veranstaltung:", course).map(e =>
          if type(e) == "string" and e.trim().ends-with(":") {
            strong(align(right)[#e])
          } else {
            align(left)[#e]
          }
        )
      ))

      // Title
      #pad(right: 4em,
        left: 4em, [

        #v(1.5em, weak: true)
        #line(length: 100%)
        #v(1.5em, weak: true)
        #block(text(weight: 700, 1.75em, title))
        #v(1.6em, weak: true)
        #line(length: 100%)
        #v(1.5em, weak: true)
      ])

      #pad(left: 2em,
        right: 2em,
        table(stroke: white, columns: (40%, 60%),
        // Author information.
        ..(
          //if authors.len() > 1 { "Autoren:"} else { "Autor:" }, authors.join(", "),
          "Verfasser:", authors.join([, \ ], last: [\ und ]),
          "Matrikel-Nr.:", matnr,
          "Adresse:", address,
          "E-Mail:", raw(mail),
        ).map(e =>
          if type(e) == "string" and e.trim().ends-with(":") {
            strong(align(right)[#e])
          } else {
            align(left)[#e]
          }
        )
      ))

      #{
        v(3em, weak: true)

        if date.split(" ").len() < 2 {
          "<SEMESTER>"

        } else {
          let year = date.split(" ").at(2).slice(2)

          if date.split(" ").at(1) in SUMMER_MONTHS {
            "Sommersemester 20" + year
          } else {
            "Wintersemester 20" + year + "/" + str(int(year) + 1)
          }
        }

        [\ #date]
      }
    ])
  ]

  // Main body.
  set par(justify: true)

  pagebreak()
  // outline(indent: true, fill: repeat([.#hide(".")]))
  outline()

  pagebreak()
  set par(leading: 1.25em)
  show heading: e => {
    v(e.level * 0.5em)
    e
    v(e.level * 0.5em)
  }

  set page(footer: align(center, counter(page).display()))
  set page(margin: (right: 4cm))
  counter(page).update(1)
  body

  pagebreak()
  set page(footer: [], header: [], margin: (right: 3cm, top: 2cm))
  counter(page).update(e => e - 1)

  heading(outlined: false, numbering: none, [Selbstständigkeitserklärung])
  [Hiermit versichere ich, dass ich die vorliegende schriftliche Hausarbeit (Seminararbeit, Belegarbeit) selbstständig verfasst und keine anderen als die von mir angegebenen Quellen und Hilfsmittel benutzt habe. Die Stellen der Arbeit, die anderen Werken wörtlich oder sinngemäß entnommen sind, wurden in jedem Fall unter Angabe der Quellen (einschließlich des World Wide Web und anderer elektronischer Text- und Datensammlungen) kenntlich gemacht. Dies gilt auch für beigegebene Zeichnungen, bildliche Darstellungen, Skizzen und dergleichen. Ich versichere weiter, dass die Arbeit in gleicher oder ähnlicher Fassung noch nicht Bestandteil einer Prüfungsleistung oder einer schriftlichen Hausarbeit (Seminararbeit, Belegarbeit) war. Mir ist bewusst, dass jedes Zuwiderhandeln als Täuschungsversuch zu gelten hat, aufgrund dessen das Seminar oder die Übung als nicht bestanden bewertet und die Anerkennung der Hausarbeit als Leistungsnachweis/Modulprüfung (Scheinvergabe) ausgeschlossen wird. Ich bin mir weiter darüber im Klaren, dass das zuständige Lehrerprüfungsamt/Studienbüro über den Betrugsversuch informiert werden kann und Plagiate rechtlich als Straftatbestand gewertet werden.]

  v(1cm)

  table(columns: (auto, auto, auto, auto),
    stroke: white,
    inset: 0cm,

    strong([Ort, Datum:]) + h(0.5cm),
    repeat("."+hide("'")),
    h(0.5cm) + strong([Unterschrift:]) + h(0.5cm),
    repeat("."+hide("'")))
}
