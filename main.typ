#import "slides.typ": *
#import "th_bipartite.typ": *
#import "slide_footnotes.typ": *
#import "slide_sections.typ": *
#import "latex_symbol.typ": latex-symbol

#show "La!!TeX": [La]+[!TeX]
#show "La!TeX": [#h(-0.2em)#latex-symbol#h(-0.3em)]

#set heading(numbering: "1.1.1.")
#set text(lang: "de")
#show link: set text(blue)

#let task(description, solution) = [
  #slide[
    #counter("main_task_counter").step()
    #text(size: 1.25em, strong([Aufgabe ]+locate(loc => counter("main_task_counter").at(loc).first())))

    #par(justify: true, description)
  ]

  #slide[
    #text(size: 1.25em, strong([Lösung ]+locate(loc => counter("main_task_counter").at(loc).first())))

    #solution]
]

#show: slides.with(
    authors: "Tristan Pieper",
    email: text(size: 0.75em, "tristan.pieper@uni-rostock.de"),
    title: "Typst — Hat La!TeX ausgedient?",
    subtitle: "Eine kurze Einführung in Typst",
    short-title: "Shorter title for slide footer",
    date: "2. Juni 2023",
    theme: bipartite-theme(),
    typography: (math-font: "New Computer Modern Math")
)

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
$a+b
```
    #colbreak()
    #set text(size: 16pt)
```
  error: expected dollar sign
  ┌─ test.typ:1:5
  │
1 │ $a+b
  │     ^
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
    $a+b
\end{document}
```

#colbreak()
#set text(size: 8pt)

#raw(read("latex_error.log"))
  ])
]

#slide(title: "Mehr Beispiel-Fehlermeldung")[
  #set text(size: 18pt)
  #table(columns: (auto, auto),
    inset: 0.5em,
    [Typst], [La!TeX],
    ```typ
#set par(leading: [Hello])
                  ^^^^^^^
expected integer, found content
  ```,

    ```latex
\baselineskip=Hello
Missing number, treated as zero.
Illegal unit of measure (pt inserted).
  ```,
    ```typ
#heading()
        ^^
missing argument: body
  ```,
    ```latex
\section
Missing \endcsname inserted.
Missing \endcsname inserted.
...
  ```,
  )

  #set text(size: 12pt)
  (aus: Mädje, Laurenz: #emph["Typst -- A Programmable Markup Language for Typesetting."] Masterarbeit an der TU Berlin, 2022.)
]

#new-section("Die Lösung aller Probleme(?)")
#slide(title: "Typst")[
  #align(center, block(width: 60%)[
    #set text(size: 0.65em)

    #grid(columns: (auto, auto),
      gutter: 1em,
      [ #image(height: 40%, width: auto, "img/martin_haug.png")
        Martin Haug\
        (Webentwicklung)
      ],
      [ #image(height: 40%, width: auto, "img/laurenz_maedje.png")
        Laurenz Mädje\
        (Compilerentwicklung)
      ])

    #set text(size: 0.75em)
    #link("https://typst.app/about/"), (letzter Zugriff: 26.05.2023, 10:16)
  ])

  #align(horizon)[#block(align(top)[
    - 2019 Projektstart an TU Berlin
    - entstanden aus Frustration über LaTeX
  ])]
]

#slide(title: "Das Ziel")[
  _"Während bestehende Lösungen langsam, schwer zu bedienen oder einschränkend sind, ist Typst sorgfältig entworfen, um leicht erlernbar, flexibel und schnell zu sein. Dafür haben wir eine komplett eigene Markupsprache und Textsatzengine von Grund auf entwickelt. Dadurch sind wir in allen Bereichen des Schreib- und Textsatzprozesses innovationsfähig."_

  #set text(size: 0.5em)
  #link("https://www.tu.berlin/entrepreneurship/startup-support/unsere-startups/container-profile/startups-2023-typst"), (letzter Zugriff: 03.05.2023, 10:13)
]

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
  #set text(size: 20pt)
  Vorteile:
  - alle Dateien online
  - verschiedene Projekte erstellbar
  - guter online Editor
  - als Team gleichzeitig an Dateien arbeiten
  - eingebaute Dokumentation

  #link("https://typst.app/")

  Temporäre Accounts (mit $1 <= #[`N`] <= 15$):
  - E-Mail: `typstseminarN@byom.de`
  - Passwort: `typstseminarN`

  Link zur Präsentation: #link("https://github.com/survari/typst-seminar")

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
          #text(size: 36pt, [1. Überschrift 1!])

          #text(size: 30pt, [1.1. Überschrift 2!])

          #text(size: 24pt, [1.1.1. Überschrift 3!])
        ]

        Text

        Neuer Absatz!
      ])
}]

#slide(title: "Absätze")[#{
    let code = ```
= Mein cooler Titel
In Typst beginnt ein neuer Absatz, sobald im Code eine freie Zeile steht.

Leider sind standardmäßig Absätze linksbündig und nicht Blocksatz. Wie man das ändert, lernen wir gleich!
    ```

    // Absatz-Abstand mal ein bisschen anpassen, damit man es
    // sieht, damit es aber nicht wie eine leere Zeile wirkt
    set block(spacing: 0.75em)

    table(stroke: none,
      columns: (50%, 50%),
      align(top, text(size: 20pt, raw(lang: "typst", code.text))),
      align(top)[
          #strong(text(size: 28pt, [\1. Mein cooler Titel]))
          #set text(size: 20pt)

          In Typst beginnt ein neuer Absatz, sobald im Code eine freie Zeile steht.

          Leider sind standardmäßig Absätze linksbündig und nicht Blocksatz. Wie man das ändert, lernen wir gleich!
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

#slide(title: "Content, Strings, Scripts")[
  #set text(size: 20pt)
  - zwei Arten von Inhalten in Typst:
    - Content in `[...]`
    - Scripts in `{...}`
    - von Content zu Script mit `#`

  - jedes Dokument ist grundlegend Content
  #v(1em)

  #table(columns: (50%, 50%),
    stroke: none,
    ```typ
#strong([Hier ist Content in Script.])

#{
  strong([Fett!])
  [Auch hier ist Content in Script!]
}

#{ 3/4 }
    ```, align(top)[
#strong([Hier ist Content.])

#{
  strong([Fett!])
  [Auch hier ist Content in Script!]
}

#{ 3/4 }
    ])
]

#slide(title: "Text" + slide-footnote(link("https://typst.app/docs/reference/syntax/")))[#{
    let code = ```
*Hallo!* #strong([Hallo!])

_Hallo!_ #emph([Hallo!])

Hallo!#super([Hallo!])

Hallo!#sub([Hallo!])

#text(fill: red, [Hallo rot!])

#text(fill: rgb("#ff00ff"), [Hallo pink!])

#text(fill: rgb("#ff00ff"), strong([Hallo pink!]))
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
#align(right, strong([Hallo!]))
    ```

    table(stroke: none,
      columns: (60%, 1fr),
      align(top, text(size: 20pt, raw(lang: "typst", code.text))),
      align(top, text(size: 20pt, eval("["+code.text+"]"))))
}]

#task[Wie realisiert man das Folgende in Typst?

#block(stroke: black,
  inset: 1em, [
  #align(center, emph[Ein Brief an Lorem])
  #lorem(20)
])
][
  ```typ
#align(center, emph[Ein Brief an Lorem])
#lorem(20)
  ```
]

#slide(title: "Abstände #1")[#{
    let code = ```
#align(right, [Vertikaler])
#v(2cm)
Horizontaler #h(2cm) Abstand
    ```

    table(stroke: none,
      columns: (1fr, auto),
      align(top, text(size: 18pt, raw(lang: "typst", code.text))),
      align(top, text(size: 18pt, eval("["+code.text+"]"))))
}]

#slide(title: "Abstände (Vertikal)")[#{
    let code = ```
Listen-Beispiel von Folie 21 mit vertikalen Abständen.

+ Eine numerierte Liste
+ Kann sehr schön sein!
#v(2em)
1. So geht sie auch!
2. Jawohl!
#v(2em)
- Und hier nicht-nummeriert!
- Ganz ohne Nummern!
    ```

    table(stroke: none,
      columns: (50%, 50%),
      align(top, text(size: 18pt, raw(lang: "typst", code.text))),
      align(top, text(size: 18pt, eval("["+code.text+"]"))))
}]

#slide(title: "Abstände (Horizontal)")[#{
    let code = ```
+ Gott kommen aufgrund seines vollkommenen Wesens alle vollkommenen Eigenschaften zu.
+ Zu existieren ist vollkommener als nicht zu existieren.
+ Also ist Existenz eine vollkommene Eigenschaft.
+ Also existiert Gott. #h(1fr) QED
    ```

    table(stroke: none,
      columns: (auto),
      align(top, text(size: 18pt, raw(lang: "typst", code.text))),
      v(1em),
      align(top, text(size: 18pt, eval("["+code.text+"]"))))
}]

#slide(title: "Bilder")[#{
    let code = ```
#image(height: 50%, "leslie_lamport.png")
    ```

    table(stroke: none,
      columns: (auto),
      align(top, text(size: 20pt, raw(lang: "typst", code.text))),
      align(top + center, v(1em) + image(width: 50%, "img/leslie_lamport.png")))
}]

#slide(title: [`#block()` und `#box()`])[#{
    let code = ```
Das lässt sich mit `#block` machen: #block(stroke: black, inset: 0.5em, [ `#block()` erzeugt einen Zeilenumbruch und lässt sich über Seiten brechen. Es hat viele optionale Argumente.])
So sieht's aus.
    ```

    table(stroke: none,
      columns: (auto, auto),
      align(top, text(size: 18pt, raw(lang: "typst", code.text))),
      align(top, text(size: 18pt, eval("["+code.text+"]"))))
}]

#slide(title: [`#block()` und `#box()`])[#{
    let code = ```
Hingegen: #box(stroke: black, inset: 2pt, [`#box()`]) erzeugt #box(stroke: (bottom: black), inset: 2pt, [keinen]) Zeilenumbruch und lässt sich #box(stroke: (bottom: black), inset: 2pt, [nicht]) über Seiten brechen. Man kann damit aber Dinge zum Beispiel umrahmen. Zum Unterstreichen sollte man aber eher #underline[`#underline`] benutzen.
    ```

    table(stroke: none,
      columns: (auto, auto),
      align(top, text(size: 18pt, raw(lang: "typst", code.text))),
      align(top, text(size: 18pt, eval("["+code.text+"]"))))
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

#task[Wie realisiert man das Folgende in Typst?

#table(columns: (auto, auto),
  strong[Formel], strong[Zugeschrieben],
  $a^2 + b^2 = c^2$, [Pythagoras],
  $c <= a + b$, [Unbekannt])
][
```typ
#table(columns: (auto, auto),
  strong[Formel], strong[Zugeschrieben],
  $a^2 + b^2 = c^2$, [Pythagoras],
  $c <= a + b$, [Unbekannt])
```
]

#slide(title: "Set-Regeln" + slide-footnote(link("https://typst.app/docs/reference/styling/")))[#{
    let code = ```
Hier ist noch die Standard-Schriftart! Q

#set text(font: "New Computer Modern", fill: blue)

Q Ab jetzt ist alles vollkommen in der anderen Schriftart und sogar blau!

#set par(first-line-indent: 1.5em, justify: true)

Ab jetzt wird jede erste Zeile eines Absatzes eingerückt und Blocksatz!

Wirklich, versprochen! #lorem(20)
    ```

    table(stroke: none,
      columns: (1fr, 1fr),
      align(top, text(size: 18pt, raw(lang: "typst", code.text))),
      align(top, text(size: 18pt, eval("["+code.text+"]"))))
}]

#slide(title: "Show-Regeln" + slide-footnote(link("https://typst.app/docs/reference/styling/")))[#{
    let code = ```
#show heading: set text(red)

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

#task[Wie realisiert man das Folgende in Typst? Hinweis: Die `show`-Regel ist nicht auf `#lorem()` anwendbar.

#block(inset: 1em, stroke: black, [
  #set par(justify: true)
  #show "Typst": strong

  In Typst sind show- und set-Regeln sehr mächtig. Kann man Sie, kann man auch Typst. Typst soll immer fett gedruckt werden. Der Absatz ist Blocksatz. _Kleine Wiederholung: Wie macht man in Typst nochmal etwas kursiv?_
])
][
```typ
#set par(justify: true)
#show "Typst": strong

In Typst sind show- und set-Regeln sehr mächtig. Kann man Sie, kann man auch Typst. Typst soll immer fett gedruckt werden. Der Absatz ist Blocksatz. _Kleine Wiederholung: Wie macht man in Typst nochmal etwas kursiv?_
```
]

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
    #image(width: 90%, "Beispiele/MatheDeltaEpsilon/edk_latex.svg")
    #image(width: 90%, "Beispiele/MatheDeltaEpsilon/edk_typst.svg")
  ])
]

#new-section("Die Typst-Dokumentation...")

#slide[
  - #link("https://typst.app/docs") als Nachschlagwerk
  - Dokumentation ist wichtig!
]

#slide(title: [Doku-Beispiel: `image`-Funktion])[#{
    [`image` kann noch ein bisschen was!]

    let code = ```
    #image("leslie_lamport.png")
    ```

    table(stroke: none,
      columns: (auto),
      align(top, text(size: 20pt, raw(lang: "typst", code.text))),
      align(top + center, v(1em) + [
        #image("img/leslie_lamport.png")
      ]))
}]

#slide(title: [Doku-Beispiel: `image`-Funktion])[#{
    [`image` kann noch ein bisschen was!]

    let code = ```
    #image(height: 50%, "leslie_lamport.png")
    ```

    table(stroke: none,
      columns: (auto),
      align(top, text(size: 20pt, raw(lang: "typst", code.text))),
      align(top + center, v(1em) + [
        #image(height: 50%, "img/leslie_lamport.png")
      ]))
}]

#slide(title: [Doku-Beispiel: `image`-Funktion])[#{
    // Wie komme ich jetzt an die ganzen Informationen, was
    // image alles kann? -> Dokumentation!
    [`image` kann noch ein bisschen was!]

    let code = ```
    #image(fit: "stretch", width: 100%, height: 100%, "leslie_lamport.png")
    ```

    table(stroke: none,
      columns: (auto),
      align(top, text(size: 20pt, raw(lang: "typst", code.text))),
      align(top + center, v(1em) + block(height: 50%, width: 100%, [
        #image(fit: "stretch", width: 100%, height: 100%, "img/leslie_lamport.png")
    ])))
}]

#slide[#image("img/doku_image_1.png", fit: "contain")]
#slide[#image("img/doku_image_2.png", fit: "contain")]
#slide[#image("img/doku_image_3.png", fit: "contain")]
#slide[#image("img/doku_image_4.png", fit: "contain")]
#slide[#image("img/doku_image_5.png", fit: "contain")]
#slide[
  Beispiel bei `#enum()`:
  #image("img/doku_image_6.png", fit: "contain")
]
#slide[
  Beispiel bei `#enum()`:
  #image("img/doku_image_7.png", height: 80%)
]

#task[Welcher Parameter kann durch eine `set`-Regel wie verändert werden, damit man eine nummerierte Listen (`#enum()`) wie folgt formatieren kann? Die Dokumentation hilft!

#block(inset: 1em, width: 100%, stroke: black, [
  #set enum(numbering: "I.")
  + Element 1
  + Element 2
  + Element 3
])
][
```typ
#set enum(numbering: "I.")
+ Element 1
+ Element 2
+ Element 3
```
]

#task[Welcher Parameter kann durch eine `set`-Regel wie verändert werden, damit man eine nicht-nummerierte Listen wie folgt formatieren kann? Die Dokumentation hilft!

#block(inset: 1em, width: 100%, stroke: black, [
  #set list(marker: ">")
  - Element 1
  - Element 2
  - Element 3
])
][
```typ
#set list(marker: ">")
- Element 1
- Element 2
- Element 3
```
]

#new-section("Eigene Templates und Skripts")
/*
- Seite bearbeiten, Seitengröße, Header, Footer, ...
- Skripten (aufpassen: pure functions!)
*/
// Irrelevant, kann man nachschlagen:
// ----------------------------------
// #slide(title: "Mehrere Typst-Dateien verwenden")[
//   #set text(size: 20pt)
//   #table(stroke: none,
//     columns: (50%, 50%),
//     image("img/file_list2.png", width: 90%), [
//       `chapter1.typ`:
//       #pad(left: 1em)[```typst
// == Kapitel 1
// #lorem(10)
//       ```]

//       `chapter2.typ`:
//       #pad(left: 1em)[```typst
// == Kapitel 2
// #lorem(10)
//       ```]
//     ])

//   `main.typ`:
//   #pad(left: 1em)[```typst
// = Mein tolles  Buch
// Hier, Kapitel!

// #include "chapter1.typ"
// #include "chapter2.typ"
//   ```]
// ]

#slide(title: "Eigene Funktionen und Variablen #1")[#{
    let code = ```
#let var = 3.14159
#let double(e) = {
  return 2*e
}

$pi$ ist etwa #var! \
$tau$ ist etwa #double(var)!

$pi approx var$ \
$tau approx double(var)$
    ```

    table(stroke: none,
      columns: (60%, auto),
      align(top, text(size: 20pt, raw(lang: "typst", code.text))),
      align(top, text(size: 20pt, eval("["+code.text+"]"))))
}]

#slide(title: "Eigene Funktionen und Variablen #2")[
  Eine Einschränkung: wir arbeiten mit #emph[Pure Functions].

  #{
    let code = ```
#let var = 2
#let change_var(new_v) = {
  var = new_v
  return var
}

#change_var(100)
    ```

    table(stroke: none,
      columns: (50%, auto),

      align(top, text(size: 18pt, [Folgendes geht nicht:] + par(raw(lang: "typst", code.text)))),

      align(top, text(size: 18pt, [
        Fehler:
```typc
#let change_var(new_v) = {
  var = new_v
  ``` ```
  ^^^
variables from outside the function are read-only and cannot be modified
```])))
}]

#slide(title: "Eigene Funktionen und Variablen #3")[#{
  set text(size: 22pt)
  let code = ```
#let names = ("Peter", "Petra", "Josef", "Josefa")
#let greet(names) = {
  [Hallo ]
  names.join(last: " und ", ", ")
  [! #names.len() wundervolle Namen!]
}

#greet(names)
    ```

  raw(lang: "typst", code.text)

  v(1em)
  eval("["+code.text+"]")
}]

// Kann man auch nachschlagen:
// ---------------------------
// #slide(title: "Funktionen auslagern")[
//   #set text(size: 20pt)
//   #table(stroke: none,
//     columns: (50%, 50%),
//     image("img/file_list.png", width: 90%), [
//       `greet_me.typ` definiert:
//       - `greet(names)`
//       - `double(n)`
//   ])


//   ```typst
// #import "greet_me.typ": *
// #import "greet_me.typ": greet
//   ```
// ]

#task[Es soll eine Funktion erstellt werden, die zwei Zahlen addiert und das Ergebnis #text(red, [rot]) und #strong[fett] formatiert. Etwa so:

#let add(a, b) = strong(text(red, [#(a+b)]))
```typ
#add(20, 40)
```

#add(20, 40)
][
  #set text(18pt)
  #grid(columns: (auto, auto),
    gutter: 1em,
    [Viele Möglichkeiten:

```typ
#let add(a, b) = strong(text(red, [#(a+b)]))
#add(20, 40)
```

oder mit `#str()` Zahlen zu Strings machen:

```typ
#let add(a, b) = strong(text(red, str(a+b)))
#add(20, 40)
```], align(top)[oder mit Klammern:

```typ
#let add(a, b) = {
  let result = a+b
  strong(text(red, str(result)))
}

#add(20, 40)
```
  ])
]

#new-section("Typst kann noch mehr!")
/*
- Bibliographie
- Figuren und Referenzen
- Dokumentation zeigen!!!
- Raytracing (https://github.com/elteammate)
*/

#slide(title: "Figuren und Referenzen" + slide-footnote(link("https://typst.app/docs/reference/meta/figure/")))[
  #align(center, table(stroke: none,
    columns: (auto),

    align(left, text(size: 18pt, raw(lang: "typst",
```
@glacier shows a glacier. Glaciers
are complex systems.

#figure(
  image("glacier.jpg", height: 80%),
  caption: [A curious figure.],
) <glacier>
```.text) + v(1em))),

    image(height: 50%, "img/figures_and_references.png")))
]

#slide(title: "Bibliographie" + slide-footnote(link("https://typst.app/docs/reference/meta/bibliography/")))[
  #align(center, table(stroke: none,
    columns: (auto, auto),
    align(left)[#text(size: 14pt)[`works.bib`: ```bib
@article{netwok,
  title={At-scale impact of the {Net Wok}: A culinarically holistic investigation of distributed dumplings},
  author={Astley, Rick and Morris, Linda},
  journal={Armenian Journal of Proceedings},
  volume={61},
  pages={192--219},
  year={2020},
  publisher={Automattic Inc.}
}

@article{arrgh,
  title={The Pirate Organization},
  author={Leeson, Peter T.},
}
```]],

    align(left, text(size: 18pt, raw(lang: "typst",
```
This was already noted by
pirates long ago. @arrgh

Multiple sources say ...
#cite("arrgh", "netwok").

#bibliography("works.bib")
```.text) + v(1em))) +

    image(height: 50%, "img/bibliography.png")))
]

#slide(title: "Raytracing")[
  #image("img/raytracer.png")

  Voll funktionsfähiger Raytracer für 3D-Rendering.#slide-footnote([Autor: ] + link("https://github.com/elteammate"))
]

#new-section("Abschluss und Weiteres")

#slide(title: [Was noch fehlt#slide-footnote(link("https://github.com/typst/typst/issues/712"))])[
  - #strike[Fußnoten] (am 20.05.2023 mit v0.4.0 hinzugefügt)
  - Paketmanager #text(size: 20pt, fill: rgb("#8a8a8a"))[(kurzfristige Alternative: GitHub)]
  - StackOverflow #text(size: 20pt, fill: rgb("#8a8a8a"))[(kurzfristige Alternative: Discord)]
]

#slide(title: [Erwartete Neuerungen#slide-footnote(link("https://github.com/typst/typst/issues/712"))])[
  #block[#align(top)[
    - die komplette Überarbeitung der Layout-Engine
    - Paketmanager
    - Verbesserung des Mathe-Layouts
    - HTML Output
    - https://typst.app/docs/roadmap
  ]]
]

#slide(title: "Wer sollte Typst (nicht) benutzen?")[#box[#align(top)[
  // Todo: ausbauen und kritische Auseinandersetzung mit Typst, Fragen erläutern:
  /*
    Warum sollte ich Typst benutzen, wenn doch eh überall LaTeX läuft?
      - Henne-Ei-Problem
      - Können wir uns nicht auch für neue Technologien begeistern, einfach weil wir sie cool finden? Wie soll sich irgendetwas jemals durchsetzen, wenn wir immer nur denken "Ja aber früher haben wir das anders gemacht."?

    LaTeX hat viel mehr Pakete. Typst hat nichtmal TikZ.
      - Alternativen: mit TikZ SVG generieren und in Typst einbingen, oder GraphViz benutzen
      - https://github.com/johannes-wolf/typst-canvas als Grundbibliothek

    Allgemein: Henne-Ei-Problem. Kann man nicht auch mal Dinge aus interesse machen? Können wir uns nichtmal auch einfach für neue technologien interessieren? Brauche ich die ganzen "Möglichkeiten", das LaTeX-Monster, wirklich?
  */

  #set text(size: 20pt)
  #set list(marker: text(fill: green, emoji.checkmark))
  #underline[*Pros:*]
  - #strong[steile] Lernkurve
  - viele Programmierer-Ansätze, extrem einfach erweiterbar
  - aktive Community
  - schnelle Kompilierzeit
  - online IDE
  - verständliche Fehlermeldungen

  #set list(marker: text(fill: red, [✗]))
  #underline[*Cons:*]
  - viele Programmierer-Ansätze
  - komplexes Layouting (keine Floating Figures)
  - Pure Functions können schwer sein (States, Counter, ...)
  - bisher keine Unterstützung durch große Journals
  - kein zentrales Paketmanagement

  #emph[(Stand: 25.05.2023)]
]]]

#slide(title: "Weiteres")[
  #set text(size: 18pt)
  *Übrigens:* Diese gesamte Präsentation wurde alleine in Typst erstellt.

  - Typst Dokumentation: https://typst.app/docs/

  - Offizielles Typst-Tutorial: https://typst.app/docs/tutorial

  - Offizieller Typst-Discord: https://discord.gg/2uDybryKPe

  - Code für diese Präsentation und weitere Beipsiele: https://github.com/survari/typst-seminar

  - Masterarbeit von Laurenz Mädje über Typst: https://www.user.tu-berlin.de/laurmaedje/programmable-markup-language-for-typesetting.pdf

  - Lambdas, States und Counter: https://typst.app/project/rpnqiqoQNfxXjHQmpJ81nF

  - Liste mit Typst-Projekten: https://github.com/qjcg/awesome-typst
]
