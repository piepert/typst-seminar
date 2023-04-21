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

```
Rc files read:
  /path/.config/latexmk/latexmkrc
Latexmk: This is Latexmk, John Collins, 17 Mar. 2022. Version 4.77, version: 4.77.
Latexmk: applying rule 'pdflatex'...
Rule 'pdflatex': File changes, etc:
   Changed files, or newly in use since previous run(s):
  /path/Desktop/Projekte/Typst/typst-seminar/.lt/test.tex
  test.tex
Rule 'pdflatex': The following rules & subrules became out-of-date:
  pdflatex
------------
Run number 1 of rule 'pdflatex'
------------
------------
Running 'pdflatex  -synctex=1 -interaction=nonstopmode -file-line-error -recorder  "/path/Desktop/Projekte/Typst/typst-seminar/.lt/test.tex"'
------------
This is pdfTeX, Version 3.141592653-2.6-1.40.24 (TeX Live 2022/Arch Linux) (preloaded format=pdflatex)
 restricted \write18 enabled.
entering extended mode
(/path/Desktop/Projekte/Typst/typst-seminar/.lt/test.tex
LaTeX2e <2021-11-15> patch level 1
L3 programming layer <2022-04-10> (/usr/share/texmf-dist/tex/latex/base/article.cls
Document Class: article 2021/10/04 v1.4n Standard LaTeX document class
(/usr/share/texmf-dist/tex/latex/base/size10.clo)) (/usr/share/texmf-dist/tex/latex/l3backend/l3backend-pdftex.def) (./test.aux)
/path/Desktop/Projekte/Typst/typst-seminar/.lt/test.tex:5: Missing $ inserted.
<inserted text>
                $
l.5

[1{/var/lib/texmf/fonts/map/pdftex/updmap/pdftex.map}] (./test.aux) )
(see the transcript file for additional information)</usr/share/texmf-dist/fonts/type1/public/amsfonts/cm/cmr10.pfb>
Output written on test.pdf (1 page, 13646 bytes).
SyncTeX written on test.synctex.gz.
Transcript written on test.log.
Latexmk: If appropriate, the -f option can be used to get latexmk
  to try to force complete processing.
Latexmk: Getting log file 'test.log'
Latexmk: Examining 'test.fls'
Latexmk: Examining 'test.log'
Latexmk: Log file says output to 'test.pdf'
Latexmk: Errors, so I did not complete making targets
Collected error summary (may duplicate other messages):
  pdflatex: Command for 'pdflatex' gave return code 1
      Refer to 'test.log' for details
```
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

#new-section("Was Typst noch so alles kann")
/*
- Bibliographie
- Figuren und Referenzen
- Skripten
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

#new-section("Wer sollte Typst benutzen?")
/*
- viele Programmierer-Ansätze
- sehr komplexe Sachen, bes. was Fußnoten und komplexes Layouting braucht ist (noch) NICHT für Typst geeignet
*/

#new-section("Abschluss und Weiteres")
/*
- Erwartete Neuerungen
- Roadmap
- Tutorial
*/

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
