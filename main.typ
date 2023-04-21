#import "slides.typ": *
#import "th_bipartite.typ": *
#import "slide_footnotes.typ": *
#import "slide_sections.typ": *

#set heading(numbering: "1.1.1.")
#set text(lang: "de")
#show: slides.with(
    authors: "Tristan Pieper",
    email: text(size: 0.75em, "tristan.pieper@uni-rostock.de"),
    title: "Typst — Warum noch LaTeX lernen?",
    subtitle: "Eine kurze Einführung in Typst",
    short-title: "Shorter title for slide footer",
    date: "1. Juni 2023",
    theme: bipartite-theme(),
)

#set page(footer: text(fill: red, counter(page).display()))

#slide[
  #outline(depth: 1)
]

#new-section("Kurzes Kennenlernen")
- Wer hat schonmal LaTeX benutzt? → Ihr werdet euch glücklich schätzen
- Wer hatte das IP-Modul? → Macht es einfacher

#new-section("Probleme von LaTeX")
- Kurze Historie zu TeX
- Warum LaTeX entwickelt wurde
- pdflatex, lualatex, xelatex, miktex, ...????

#new-section("Die Lösung aller Probleme(?)")

#new-section("Die Web-App")
- Browser und Website öffnen
- Anmeldung per tmp-Acc. oder eigene Accounts erstellen

#new-section("Grundlegende Formatierung")
- Titel
- Fett, Kursiv
- Listen
- Bilder
- Schriftgröße und -farbe ändern
- Textausrichtung
- Mathematik (Dokumentation mit Symbolen)

#new-section("Was Typst noch so alles kann")
- Bibliographie
- Figuren und Referenzen
- Skripten
- Dokumentation zeigen!!!

#new-section("Was noch fehlt")
- Fußnoten
- Paketmanager
- StackOverflow

#new-section("Wer sollte Typst benutzen?")
- viele Programmierer-Ansätze
- sehr komplexe Sachen, bes. was Fußnoten und komplexes Layouting braucht ist (noch) NICHT für Typst geeignet

#new-section("Abschluss und Weiteres")
- Erwartete Neuerungen
- Roadmap
- Tutorial

#slide[
  A fancy dynamic slide without a title.
  #uncover("2-")[This appears later!#slide-footnote("Hey!")]
]

#slide()[
  Focus!
]

#slide(title: "Take home message")[
  Read the book!

  Try it out!

  Create themes!
]

#slide(theme-variant: "east", title: "On the right!")[
  #lorem(40)
]

#slide(theme-variant: "center split")[
  #lorem(40)
][
  #lorem(40)
]

#slide(title: "Weiteres")[
  Typst Dokumentation:
  - https://typst.app/docs/

  Offizielles Typst-Tutorial:
  - https://typst.app/docs/tutorial

  Code für diese Präsentation und weitere Beipsiele:
  - https://github.com/survari/typst-seminar
]
