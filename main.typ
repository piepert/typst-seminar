#import "slides.typ": *
#import "th_bipartite.typ": *
#import "slide_footnotes.typ": *
#import "slide_sections.typ": *
#import "latex_symbol.typ": latex-symbol

#show "LaTeX": latex-symbol

#set heading(numbering: "1.1.1.")
#set text(lang: "de")
#show: slides.with(
    authors: "Tristan Pieper",
    email: text(size: 0.75em, "tristan.pieper@uni-rostock.de"),
    title: "Typst — Hat LaTeX abgedankt?",
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
/*
- Wer hat schonmal LaTeX benutzt? → Ihr werdet euch glücklich schätzen
- Wer hatte das IP-Modul? → Macht es einfacher
*/

#new-section("Probleme von LaTeX")

#slide(title: "Alles begann mit...")[
  #align(center)[
    #image("img/donald_e_knuth.png", height: 75%)

    Donald E. Knuth #text(size: 0.75em, "(geb. 10. Januar 1938)")
  ]

  /*
  - Autor von TeX und METAFONT, entwickelt ab 1977
  - bekanntestes Werk neben TeX: The Art of Computer Programming
  - TeX extra für sein Buch entwickelt, weil er besondere ästhetische Ansprüche hatte, die die Verleger nicht erfüllen konnten
  */
]

#slide(title: "Dann kam...")[
  #align(center)[
    #image("img/leslie_lamport.png", height: 75%)

    Leslie Lamport #text(size: 0.75em, "(geb. 7. Februar 1941)")
  ]

  /*
  - Autor von LaTeX, entwickelt ab Anfang 1980
  - LaTeX als Sammlung von Makros zur Erweiterung und Vereinfachung von TeX
  */
]

#slide(title: "Die Probleme")[
  + Riesige Programmgröße
  + Auswahl an Compilern
  + Unverständliche Fehler
]

#slide(title: "Größe des Programms")[
  #align(center)[
    #image("img/installation_size_latex.png", width: 60%)

    Verglichen mit `21MB` des Typst-Compilers...

    #image("img/installation_size_typst.png", width: 60%)
  ]

  /*
  - Installationsgrößen können stark variieren, 300MB..7GB
  - unglaublich viele Pakete
  */
]

#slide(title: "Die Vielfalt")[
  "LaTeX" ist kein Programm, sondern:
  - pdfLaTeX
  - LuaTeX
  - XeTeX
  - MikTeX
  - KaTeX
  - ...
]

#slide(title: "Beispiel-Fehlermeldung (Typst)")[
  #columns(2, [
    Typst:
```typst
$
+ Dies
+ Ist
+ Eine
+ Liste!
```
    #colbreak()
    #set text(size: 16pt)
```
  error: expected dollar sign
  ┌─ test.typ:5:8
  │
5 │ + Liste!
  │         ^
```
  ])
]

#slide(title: "Beispiel-Fehlermeldung (LaTeX)")[
  #columns(2, [
    #v(2em)
    LaTeX:

    #set text(size: 22pt)
```tex
\documentclass{article}

\begin{document}
    $

    \begin{enumerate}
        \item Dies
        \item Ist
        \item Eine
        \item Liste!
    \end{enumerate}
\end{document}
```

#colbreak()
#set text(size: 8pt)

#raw(read("latex_error.log"))
  ])
]

#new-section("Die Lösung aller Probleme(?)")
#slide(title: "Ein kleiner Vergleich")[
  #set text(size: 20pt)

  #align(horizon, table(columns: (auto, auto, auto),
    inset: 1em,
    stroke: none,
    [LaTeX], [Typst], [Ergebnis],

    align(top, ```latex
\documentclass{article}

\begin{document}
    \begin{enumerate}
        \item Dies
        \item Ist
        \item Eine
        \item Liste!
    \end{enumerate}
\end{document}
```),

    align(top, ```typst
+ Dies
+ Ist
+ Eine
+ Liste!
```), align(top)[
    + Dies
    + Ist
    + Eine
    + Liste!
  ]))
]

#new-section("Die Web-App")
#slide(title: "Ab ans Werk!")[
  Vorteile:
  - alle Dateien online
  - verschiedene Projekte erstellbar
  - guter online Editor
  - eingebaute Dokumentation

  #link("https://typst.app/")

  /*
  - Browser und Website öffnen
  - Anmeldung per tmp-Acc. oder eigene Accounts erstellen
  */
]

#new-section("Grundlegende Formatierung")
/*
- Titel
- Fett, Kursiv
- Listen
- Bilder
- Schriftgröße und -farbe ändern
- Textausrichtung
- Mathematik (Dokumentation mit Symbolen)
*/

#slide(theme-variant: "center split white")[
  #set text(size: 12pt)
  #align(left, raw(lang: "latex", read("Beispiele/MatheDeltaEpsilon/edk_latex.tex")))
][
  #set text(size: 12pt)
  #align(left, raw(lang: "typst", read("Beispiele/MatheDeltaEpsilon/edk_typst.typ")))
]

#slide[
  #align(center, [
    #image(width: 80%, "img/edk_latex.png")
    #image(width: 80%, "img/edk_typst.png")
  ])
]

#new-section("Eigene Templates und Skripts")
/*
- Seite bearbeiten, Seitengröße, Header, Footer, ...
- Skripten (aufpassen: pure functions!)
*/

#new-section("Was Typst noch so alles kann")
/*
- Bibliographie
- Figuren und Referenzen
- Dokumentation zeigen!!!
- Raytracing (https://github.com/elteammate)
*/

#slide(title: "Raytracing")[
  #image("img/raytracer.png")

  Voll funktionsfähiger Raytracer für 3D-Rendering.#slide-footnote(link("Autor: https://github.com/elteammate"))
]

#new-section("Was noch fehlt")
/*
- Fußnoten
- Paketmanager
- StackOverflow
*/

#new-section("Abschluss und Weiteres")

#slide(title: "Wer sollte Typst benutzen?")[
  /*
  - viele Programmierer-Ansätze
  - sehr komplexe Sachen, bes. was Fußnoten und komplexes Layouting braucht ist (noch) NICHT für Typst geeignet
  */
]

#slide(title: [Erwartete Neuerungen#slide-footnote(link("https://github.com/typst/typst/issues/712"))])[
  #block[#align(top)[
    - Fußnoten (und die komplette Überarbeitung der Layout-Engine)
    - Paketmanager
    - Verbesserung des Mathe-Layouts
    - ...
  ]]
]

#slide(title: "Weiteres")[
  Typst Dokumentation:
  - https://typst.app/docs/

  Offizielles Typst-Tutorial:
  - https://typst.app/docs/tutorial

  Code für diese Präsentation und weitere Beipsiele:
  - https://github.com/survari/typst-seminar
]
