#import "template.typ": *

#let date = "25. Januar 2023"
#let title = "Logik Beispielklausur"

#show: project.with(date: date, title: title)
#set enum(indent: 1.5em, spacing: 1em)
#set list(indent: 1.5em, spacing: 1em)

#task[Schreiben Sie hinter die folgenden Schemata die Buchstaben der Begriffe, ob das Schema (A) #emph[allgemeingültig], (E) #emph[erfüllbar] und/oder (W) #emph[widersprüchlich] ist:

1. $(p -> p)$

2. $(p or not p)$

3. $((p -> q) and p) -> q$

4. $(p arrow.b q)$
][][
1. (A), (E) #point()

2. (W)  #point()

3. (A), (E) #point()

4. (E)  #point()
]


#task[Formalisieren Sie: #emph["Wenn ich die Beispielklausur bestehe, schaffe ich Logik locker."] Sei $p$ die hinreichende und $q$ die notwendige Bedingung in Ihrer Übersetzung. Kreuzen Sie an, welche der folgenden Schemata äquivalent zu Ihrer Formalisierung sind.

#set list(marker: $circle$)
- $not q -> not p$

- $not p -> not q$

- $not (p and not p)$
][][
Mögliche Formalisierung:

p := "Ich bestehe die Beispielklausur." \ #point()
q := "Ich schaffe Logik locker." \
$p -> q$ #point()

Je nach Formalisierung entweder nichts oder ...
#set list(marker: $times.circle$)
- $not q -> not p$ #point()

#set list(marker: $circle$)
- $not p -> not q$ #point()

#set list(marker: $times.circle$)
- $not (p and not p)$ #point()
]


#task[Beweisen Sie, dass #emph["Unter allen Umständen ist es der Fall, dass ..."] ein logisches Partikel, aber keine Wahrheitsfunktion ist.][][
    #conclude[#point() Unter allen Umständen regnet es.][Also regnet es auch, wenn die Sonne scheint.]

    #conclude[Unter manchen Umständen regnet es.][Also regnet es auch, wenn die Sonne scheint.]

#point() Der erste Schluss ist gültig, der zweite nicht. Ersetzt man es durch #emph["Unter manchen Umständen ist es der Fall, dass..."] wird der Schluss ungültig. #point() Also ist es aufgr. der Def. LP. ein logisches Partikel.

#point() Eine Wahrheitsfunktion ist es dann nicht, wenn zwei Sätze des gleichen Wahrheitswertes zusammen mit dem Satzteil zwei unterschiedliche Wahrheitswerte ergeben.

#emph["Ich lebe." und "Menschen sind Menschen."] sind wahr. #point() "Unter allen Umständen lebe ich." ist falsch#point(), "Unter allen Umständen sind Menschen Menschen." ist wahr. #point() Der Wahrheitswert hat sich geändert, aufgr. Def. WF. ist es keine WF.
]

#task[Beweisen Sie mithilfe des Ersetzbarkeitsprinzips nach Leibniz "Nemo" und "Dora" nicht identisch sind.][][
Zwei Wörter $⌜alpha⌝$ und $⌜beta⌝$ sind genau dann wahr #point(), wenn es keinen wahren Satz gibt, in dem $alpha$ und $beta$ vertauscht werden können und sich der Wahrheitswert des Satzes ändert. #point() Seien die Sätze #emph["Nemo ist ein oranger Fisch."] und #emph["Dora ist ein blauer Fisch."] wahr. #point() Tauscht man "Dora" durch "Nemo" im zweiten Satz, wird daraus #emph["Nemo ist ein blauer Fisch."], ein falscher Satz. #point() Der Wahrheitswert hat sich geändert, damit sind die beiden nicht identisch.
]

#task[Beweisen Sie die Allgemeingültigkeit folgender Aussage: "Wenn es etwas buntes und schönes gibt, dann gibt es einiges schönes und mindestens auch eine bunte Sache."][][
    "F[1]" := "[1] ist bunt." #point() \
    "G[1]" := "[1] ist schön."

    Theorem: $exists x(F x and G x) => exists F x and exists G x$ #point()

    Beweis:
    #table(columns: (auto,)*5,
        inset: 3pt,
        stroke: 0.1mm + black,
        align: horizon + center,
        [ $star.filled$ ], strong[Nr.], strong[Schema], strong[B.], strong[K.],
        [\*], [1], $exists x (F x and G x)$, [], [P #point()],
        [\*], [2], $F x' and G x'$, [1], [$x'$ES #point()],
        [\*], [3], $F x'$, [2], [AL],
        [\*], [4], $G x'$, [2], [AL],
        [\*], [5], $exists x F x$, [3], [EG #point()],
        [\*], [6], $exists x G x$, [4], [EG],
        [\*], [6], $exists x F x and exists x G x$, [5,6], [AL],
        [\*], [6], $exists x (F x and G x) -> exists x F x and exists x G x$, [1,7], [\*Kd #point()]
    )

    1. In der letzten Zeile und ihren Prämissen kommt keine geflaggte Variable vor. #point()
    2. "$x'$" wurde nur einmal geflaggt.
    3. "$x'$" ist so eine Reihenfolge, da keine rechts oder links von ihr steht und sie daher nirgendwo frei vorkommen kann, wo eine rechts von ihr stehende gebunden ist.

    Die Ableitung ist fertig und aufg. Def. $=>$  #point() ist das Theorem wahr, da in der letzten Zeile keine Sterne mehr vorkommen.
]

#show image: it => align(center, it)
#task[Füllen Sie die leeren Felder des logischen Quadrats korrekt aus!][
    #image("./log_q_a.png", width: 80%)
][
    #image("./log_q_eh.png", width: 90%)

    1. konträr #point()
    2. kontradiktorisch #point()
    3. subkonträr #point()
    4. Es regnet nicht immer. #point()
]

#task(additional: true)[
    Ist der folgende Schluss gültig? Entscheiden Sie und beweisen Sie Ihre Antwort!

    #block(inset: (left: 3em))[#emph[Wenn es regnet, dann ist die Straße nass. Es regnet oder es schneit, also ist die Straße nass, denn es schneit nicht.]]
][][
    "p" := "Es regnet." #point(additional: true) \
    "q" := "Es schneit." \
    "r" := "Die Straße ist nass."

    #show math.equation: it => align(center, it)
    #conclude[$p -> r #point(additional: true) \ p or q \ not q$][$r$]

    #show math.equation: it => it
    #table(columns: (auto,)*7,
        inset: 3pt,
        stroke: 0.1mm + black,
        align: horizon + center,
        [ $star.filled$ ], [ $star.filled$ ], [ $star.filled$ ], strong[Nr.], strong[Schema], strong[B.], strong[K.],
        [\*], [], [], [1], $p -> r$, [], [P #point(additional: true)],
        [], [\*], [], [1], $p or q$, [], [P],
        [], [], [\*], [1], $not q$, [], [P],
        [], [\*], [\*], [1], $p$, [2,3], [AL #point(additional: true)],
        [\*], [\*], [\*], [1], $r$, [1,4], [AL #point(additional: true)],
    )

    Die Ableitung ist fertig, da keine Variable geflaggt wurde. #point(additional: true) Die Konklusion konnte aus den Prämissen abgeleitet werden, daher ist das Theorem wahr.
]

#locate(loc => {
    let points = get_all_points(loc)

    [\_\_\_ / #strong[#points.at(0) + #points.at(1) Punkten]. Zum Bestehen sind #strong[#{points.at(0)/2} Punkte] nötig.]
})