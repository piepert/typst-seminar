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