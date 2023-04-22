#import "slides.typ": *
#import "th_bipartite.typ": *
#import "slide_footnotes.typ": *
#import "slide_sections.typ": *
#import "latex_symbol.typ": latex-symbol

#show "La!!TeX": [La]+[!TeX]
#show "La!TeX": [#h(-0.2em)#latex-symbol#h(-0.3em)]

#set heading(numbering: "1.1.1.")
#set text(lang: "de")
#show: slides.with(
    authors: "Tristan Pieper",
    email: text(size: 0.75em, "tristan.pieper@uni-rostock.de"),
    title: "Typst — Hat La!TeX abgedankt?",
    subtitle: "Eine kurze Einführung in Typst",
    short-title: "Shorter title for slide footer",
    date: "1. Juni 2023",
    theme: bipartite-theme(),
    typography: (math-font: "New Computer Modern Math")
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

#new-section("Probleme von La!TeX")

#slide(title: "Alles begann mit...")[
  #align(center)[
    #image("img/donald_e_knuth.png", height: 75%)

    Donald E. Knuth#slide-footnote("Foto: Brian Flaherty / The New York Times") #text(size: 0.75em, "(geb. 10. Januar 1938)")
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

    Leslie Lamport#slide-footnote("Foto: Talia Herman / Quanta Magazine") #text(size: 0.75em, "(geb. 7. Februar 1941)")
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
  „La!TeX“ ist kein Programm, sondern:
  - pdfLa​TeX // Unicode-Charakter mit 0-Breite zwischen "La" und "TeX"
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

#slide(title: "Beispiel-Fehlermeldung (La!TeX)")[
  #columns(2, [
    #v(2em)
    La!TeX:

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
    [La!TeX], [Typst], [Ergebnis],

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
- Set und Show-Regeln
- Schriftgröße und -farbe ändern
- Textausrichtung
- Mathematik (Dokumentation mit Symbolen)
*/

#slide(title: "Überschriften")[#{
    let code = ```
// Hier ein Kommentar,
// er wird ignoriert!

= Überschrift 1!
== Überschrift 2!
=== Überschrift 3!
Text

Neuer Abstatz!
    ```

    table(stroke: none,
      columns: (1fr, auto),
      align(top, text(size: 20pt, raw(lang: "typst", code.text))), align(top)[
        #strong[
          #text(size: 36pt, [6. Überschrift 1!])

          #text(size: 30pt, [6.1. Überschrift 2!])

          #text(size: 24pt, [6.1.1. Überschrift 3!])
        ]

        Text

        Neuer Absatz!
      ])
}]

#slide(title: "Listen")[#{
    let code = ```
+ Eine numerierte Liste
+ Kann sehr schön sein!

1. So geht sie auch!
2. Jawohl!

- Und hier nicht-nummeriert!
- Ganz ohne Nummern!
    ```

    table(stroke: none,
      columns: (1fr, auto),
      align(top, text(size: 20pt, raw(lang: "typst", code.text))),
      align(top, text(size: 20pt, eval("["+code.text+"]"))))
}]
#slide(title: "Schriftart")[#{
    let code = ```
#text(font: "Arial", [Hallo Welt!])

#text(font: "Courier New", [Hallo Welt!])

#text(font: "New Computer Modern", [Hallo Welt!])
    ```

    table(stroke: none,
      columns: (1fr, auto),
      align(top, text(size: 20pt, raw(lang: "typst", code.text))),
      align(top, text(size: 20pt, eval("["+code.text+"]"))))
}]

#slide(title: "Text" + slide-footnote(link("https://typst.app/docs/reference/syntax/")))[#{
    let code = ```
*Hallo!* #strong[Hallo!]

_Hallo!_ #emph[Hallo!]

Hallo!#super([Hallo!])

Hallo!#sub([Hallo!])

#text(fill: red, [Hallo rot!])

#text(fill: rgb("#ff00ff"), [Hallo pink!])
    ```

    table(stroke: none,
      columns: (1fr, auto),
      align(top, text(size: 20pt, raw(lang: "typst", code.text))),
      align(top, text(size: 20pt, eval("["+code.text+"]"))))
}]

#slide(title: "Ausrichtung")[#{
    let code = ```
#align(left, [Hallo!])
#align(center, [Hallo!])
#align(right, [Hallo!])
    ```

    table(stroke: none,
      columns: (1fr, 1fr),
      align(top, text(size: 20pt, raw(lang: "typst", code.text))),
      align(top, text(size: 20pt, eval("["+code.text+"]"))))
}]

#slide(title: "Abstände")[#{
    let code = ```
Vertikaler
#v(2cm)
Abstand #h(2cm) Horizontaler
    ```

    table(stroke: none,
      columns: (1fr, auto),
      align(top, text(size: 20pt, raw(lang: "typst", code.text))),
      align(top, text(size: 20pt, eval("["+code.text+"]"))))
}]

#slide(title: "Bilder")[#{
    let code = ```
#image(height: 50%, "img/leslie_lamport.png")
    ```

    table(stroke: none,
      columns: (auto),
      align(top, text(size: 20pt, raw(lang: "typst", code.text))),
      align(top + center, v(1em) + text(size: 20pt, image(width: 50%, "img/leslie_lamport.png"))))
}]

#slide(title: "Tabellen")[#{
    let code = ```
#table(
  columns: (auto, 3cm, auto),
  [Hallo1!],
  [2a],
  [Hallo3!],
  [Welt1!],
  [2b],
  [Welt3!]
)
    ```

    table(stroke: none,
      columns: (1fr, auto),
      align(top, text(size: 18pt, raw(lang: "typst", code.text))),
      align(top, text(size: 18pt, eval("["+code.text+"]"))))
}]

#slide(title: "Mathematik")[#{
    let code = ```

$ sum_(k=0)^n k = 1 + ... + n $

$ A = pi r^2 $

$ "area" = pi dot.op "radius"^2 $

$ cal(A) :=
    { x in RR | x "is natural" } $

$ frac(a^2, 2) $
    ```

    table(stroke: none,
      columns: (60%, 40%),
      align(top, text(size: 18pt, raw(lang: "typst", code.text))),
      align(top, text(size: 18pt, [
        #set text(font: "New Computer Modern Math")
        #eval("["+code.text+"]")
      ])))
}]

#slide(title: "Set-Regeln")[#{
    let code = ```
Hier ist noch die Standard-Schriftart!

#set text(font: "New Computer Modern", fill: blue)

Ab jetzt ist alles vollkommen in der anderen Schriftart und sogar blau!

#set par(first-line-indent: 1.5em)

Ab jetzt wird jede erste Zeile eines Absatzes eingerückt!

Wirklich, versprochen!
    ```

    table(stroke: none,
      columns: (1fr, 1fr),
      align(top, text(size: 18pt, raw(lang: "typst", code.text))),
      align(top, text(size: 18pt, eval("["+code.text+"]"))))
}]

#slide(title: "Show-Regeln")[#{
    let code = ```
#show heading: set text(navy)

=== Hallo!

==== Welt!

// aus dem offiziellem
// Typst-Tutorial
#show "Project": smallcaps
#show "badly": "great"

We started Project in 2019
and are still working on it.
Project is progressing badly.
    ```

    table(stroke: none,
      columns: (60%, auto),
      align(top, text(size: 20pt, raw(lang: "typst", code.text))),
      align(top, text(size: 20pt, eval("["+code.text+"]"))))
}]

#slide[
  #table(columns: (50%, 50%),
    stroke: none,
    inset: 1em, [
    #set text(size: 12pt)
    #align(left, raw(lang: "latex", read("Beispiele/MatheDeltaEpsilon/edk_latex.tex")))
  ], align(top)[
    #set text(size: 12pt)
    #align(left, raw(lang: "typst", read("Beispiele/MatheDeltaEpsilon/edk_typst.typ")))
  ])
]

#slide[
  #align(center, [
    #image(width: 80%, "img/edk_latex.png")
    #image(width: 80%, "img/edk_typst.png")
  ])
]

#new-section("Die Typst-Dokumentation...")

#slide[
  - #link("https://typst.apps/docs") als Nachslagwerk
  - Dokumentation ist wichtig!
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
  *Übrigens:* Diese gesamte Präsentation wurde alleine in Typst erstellt.

  #set text(size: 20pt)
  Typst Dokumentation:
  - https://typst.app/docs/

  Offizielles Typst-Tutorial:
  - https://typst.app/docs/tutorial

  Offizieller Typst-Discord:
  - https://discord.gg/2uDybryKPe

  Code für diese Präsentation und weitere Beipsiele:
  - https://github.com/survari/typst-seminar
]
