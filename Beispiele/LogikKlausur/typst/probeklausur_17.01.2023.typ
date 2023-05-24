#import "template.typ": *

#let date = "25. Januar 2023"
#let title = "Logik Beispielklausur"

#show: project.with(date: date, title: title)

#task([Schreiben Sie hinter die folgenden Schemata die Buchstaben der Begriffe, ob das Schema (A) #emph[allgemeingültig], (E) #emph[erfüllbar] und/oder (W) #emph[widersprüchlich] ist:

#set enum(indent: 1em, spacing: 1.5em)
1. $(p -> p)$

2. $(p or not p)$

3. $((p -> q) and p) -> q$

4. $(p arrow.b q)$

], 4)[
    #lorem(20) Hallo #point() Welt! #point() #lorem(20) #point()

    #lorem(14)
    #point() #point() #point()
]

#lorem(200)
#lorem(20) Hallo #point() Welt! #point() #lorem(20) #point()

#lorem(14)
#point() #point() #point()
#lorem(200) #point()

#locate(loc => state("line_points").final(loc))