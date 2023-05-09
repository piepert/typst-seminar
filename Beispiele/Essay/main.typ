#import "template.typ": *
#import "fullcite.typ": *

// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: project.with(
  title: "Wie plausibel ist Descartes' Methodik des radikalen Zweifelns?",
  authors: (
    (
      affiliation: "Universtität Rostock",
      institute: "Institut für Philosophie",
      docent: "Dr. phil. Henning Nörenberg",
      course: "Philosophie der Neuzeit: Seminar 1",
      semester: "Sommersemester 2023",
      name: "Tristan Pieper"
    ),
  ),
  date: "20. April 2023",
)

#load-bibliography("bibliography.yaml")
#let ncite(..args) = cite-footnote(fullcite(style: "full", ..args.pos()))
#let blockquote(stroke: white, body) = block(inset: (left: 1em), v(0.5em) + block(stroke: (left: 0.25mm + stroke), inset: (left: 1em, right: 2em, rest: 0.5em), body) + v(0.5em))

/*
- Einleitung + Hinführung
- Hauptteil
  - Darstellung Descartes' Position
  - Argument der Sinnestäuschung: Zweifel nur an wenigem?
  - Genius malignus: Logik bleibt drin, warum? (Erklären)
- Ende
  - Fazit
*/

Bei der Frage nach dem Wahren gibt es einige Probleme. Nicht nur ist fraglich, _was_ als "wahr" bezeichnet werden kann, sondern auch, _ob_ überhaupt etwas als "wahr" bezeichnet werden kann. Seit vielen Jahren überlegen viele Philosophen, wie man am besten zu wahrer Erkenntnis gelangen kann oder ob es diese wahre Erkenntnis überhaupt gibt. René Descartes war ein Philosoph des 17. Jahrhunderts, der sich dieser Frage annahm. Seine _Meditationen über die erste Philosophie_ bestehen aus erkenntnistheoretisches Gedankenexperimenten für eine Methode des Erkennens von grundlegenden, unanzweifelbaren Wahrheiten. // Muss das Problem hier am Ende der Einleitung nochmal genau angesprochen werden?

// Darstellung von Descartes' Position
Um diese unanzweifelbaren Wahrheiten zu finden, geht Descartes systematisch vor. In der ersten Meditation legt er diese Idee fest:

#blockquote(stroke: black)[_[W]eil schon die Vernunft davon überzeugt, dass man den Meinungen, die nicht völlig gewiss und unbezweifelbar sind, die Zustimmung nicht weniger sorgfältig versagen muss als den offensichtlich falschen, so wird es, um sie alle zurückzuweisen, genug sein, wenn ich bei jeder irgendeinen Grund zum Zweifeln finde._ (#fullcite("ATVIIM1", "[2.]")).]

Im darauf folgenden Text macht er sich daran, dieses Zweifelhafte zu bestimmen und für eine sichere Form der Erkenntnis auszuschließen. Seine Entdeckungen werden in drei Schritten deutlich:

#block(inset: (left: 1em))[1. Die Sinne können täuschen, daher ist keine Sinneserfahrung ohne Zweifel.#ncite("ATVIIM1", "[3.]", "vgl.")
2. Die Welt könnte ein Traum sein, daher ist keine weltliche Erkenntnis ohne Zweifel.#ncite("ATVIIM1", "[5.]", "vgl.")
3. Ein böser Geist könnte das eigene Denken beeinflussen, daher ist auch rein geistige Erkenntnis nicht ohne Zweifel.#ncite("ATVIIM1", "[9.]", "vgl.")]

Im ersten Schritt löst Descartes sich von den Sinnen, bleibt jedoch dabei, dass der Mensch einen Körper hat, mit dem er wahrnehmen kann, und dass es eine wirkliche Welt gibt, die wahrgenommen wird. Der zweite Schritt stellt nun dies infrage, denn auch ein Traum kann solche sinnlichen Empfindungen verursachen. Der letzte Schritt ist der radikalste: In einem Traum können trotz der möglicherweise nicht-wirklichen Umgebung mathematische Gesetze gelten.#ncite("ATVIIM1", "[8.]", "vgl.") Doch wenn ein allmächtiger Geist den Verstand so manipulieren könnte, dass er ihn von unwahren Regeln überzeugt, sind auch Gegenstände des Geistes nicht zweifelsfrei wahr.

// Bewertung von Descartes' Position
Dieser Argumentationsgang ist jedoch aus zwei Punkten problematisch: Erstens sind die Stufen nicht so klar, wie Descartes es beschreibt, voneinander abtrennbar und zweitens ist die Methode eines radikalen Zweifels beschränkt auf die Vorstellungskraft des Zweifelnden. Descartes hat ein grundlegendes Problem: Er ist nicht so genau, wie er vorgibt zu sein.

Die Trennung der drei Stufen, in die sich Descartes' Untersuchung einteilen lässt, ist in der Hinsicht zu kritisieren, dass bereits die erste Stufe die Erkenntnis der zweiten Stufe ausschließt: zweifelt Descartes an der Wahrnehmung oder an der Interpretation der Sinne, jedoch nicht an den Sinnen an sich, verschiebt er das Problem der Erkenntnis von der Welt auf die Erkennenden. Falls sich die Erkennenden täuschen, entsteht im zweiten Schritt ein Problem: wenn die Erkennenden falsche Schlüsse ziehen und die Welt ein Traum sein könnte, braucht es keine falsche Welt, die die Erkennenden falsche Schlüsse ziehen lässt, denn das tun die Erkennenden bereits. Eine Welt wird über die Sinne erfahren. Der geistige Filter dazwischen oder die Sinne selbst können täuschen. Ob die Welt dann wirklich ist oder nicht, ist unwichtig. Das Zweifeln an der Wahrnehmung schließt bereits das Erkennen einer wirklichen oder falschen Welt aus und somit auch jede Erkenntnis aus ihr, ohne dass man an der Welt an sich zweifeln muss.

Der zweite zu kritisierende Punkt umfasst das Argument vom bösen Geist. Descartes versucht in seinen Meditationen durch Argumentation und logische Schlussfolgerung seinen Standpunkt zu erklären. Die Mathematik wurde im dritten Schritt zur Erkenntnisgewinnung ausgeschlossen, da der böse Geist den Verstand beeinflussen könnte. Diese Idee zweifelt an so grundlegenden Dingen und geht doch nicht so weit, als dass er den Bereich der Logik verlassen und den Satz vom Widerspruch entfernen würde. Existiert jedoch dieser allmächtige böse Geist, ist es nicht ausgeschlossen, dass er nicht der Logik, die wir kennen, unterworfen ist. Befreit man sich auch von dieser Einschränkung, sind Existenz des Zweifelnden und seine Nicht-Existenz, die Wahrheit und Unwahrheit zugleich, nicht mehr ausgeschlossen. Was für uns unmöglich erscheint, dass also etwa zwei Sachen, die sich gegenseitig widersprechen, zusammen wahr sein können, wäre dort möglich.

Man muss Descartes zugutehalten, dass ohne diese Mindestanforderung der Logik der Begriff "Wahrheit" keine Rolle mehr spielt, da er den Bereich des von uns Verständlichen verlässt. Trotzdem ist es den wirklichen Dingen aber gleich, ob der menschliche Geist sie begreift oder nicht, daher ist das Einbauen der Logik zwar Grund genug für die Annahme der Gültigkeit seiner Schlüsse und die Notwendigkeit seiner Ergebnisse, jedoch nicht für das Erkennen eben dieser wirklichen Dinge. Erschließt sich Descartes seine eigene Existenz durch "Ego sum, ego existo"#ncite("ATVIIM2", "[3.]"), mag sein Argument gültig sein, aber ohne das Widerspruchsprinzip könnte auch das Gegenteil dieses Arguments gültig sein, also dass er nicht existiert.

// Fazit
Die Position, die in den Meditationen beschrieben wird, entsteht aus interessanten und genau geführten Gedankenexperimenten. Solange Descartes jedoch die wirkliche Welt bezweifeln und sie gleichzeitig beschreiben will, entstehen Lücken in der Argumentation. Besonders in der Hinsicht auf das Vorgehen den aller geringsten Zweifel an einer Sache dazu zu benutzen, diese Sache für den Erkenntnisgewinn auszuschließen, ist Descartes seinen eigenen Anforderungen nicht treu geblieben, jedoch ist die einzige Möglichkeit dafür, Descartes' Methode "plausibel" zu nennen, eben jene Logik zu verwenden, die Descartes voraussetzt.

/*
#pagebreak()
#print_bibliography()
*/
