#import "template.typ": adt, task, subtask, project, pointed

#show: project.with(
    title: "1",
    authors: (
        (name: "Peter Lustig", matnr: "123456789"),
        (name: "Fritz Fuchs", matnr: "987654321"),
        (name: "Hermann Paschulke", matnr: "123459876")
    ),
    date: "Sonntag, 16.04.2023")

#task[Objekt-orientierte Programmierung (OOP)][Beantworten Sie die folgenden Fragen zu grundlegenden Konzepten der objekt-orientierten Programmierung in Java.]

#subtask([Was ist ein _Objekt_? Was ist eine _Klasse_? Worin besteht der Unterschied?], 2, [
    Ein Objekt ist häufigerweise eine abstrahierte Repräsentation realer Dinge. Klassen sind eine Kategorie gleichartiger Objekte. Objekte sind Instanzen von Klassen, während Klassen die Baupläne für Objekte darstellen.
])

#subtask([Wie wird der Zustand eines Objektes gespeichert? Wie wird sein Verhalten repräsentiert?], 2, [
    Der Zustand eines Objektes wird durch die Werte seine Attribute gespeichert. Das Verhalten wird durch die Methoden der Klasse beschrieben.
])

#subtask([Wie werden Objekte in Java erzeugt? Was ist ein _Konstruktor_? Wie und wann werden Objekte in Java wieder zerstört?], 3, [
    Objekte werden mit dem `new`-Keyword generiert. Der Konstruktor initialisiert das durch `new` generierte Objekt. Durch den Garbage-Collector werden Objekte dann erzeugt, wenn sie nicht mehr verwendet werden, d.h. z.B. wenn keine weiteren Referenzen mehr auf das Objekt existieren.
])

#subtask([Was ist _Vererbung_? Wie deklariert man in Java eine Klasse, die von einer anderen Klasse erbt?], 2, [
    Vererbung bezeichnet eine hierarchische Relation zwischen Klassen, in der eine Klasse $B$, die _Unterklasse_, von einer Klasse $A$, die _Oberklasse_, Attribute, Methoden und Implementierungen erbt. Damit kann $B$ als ein $A$ behandelt werden. In der Klassendefinition kann man mittels dem Keyword `extends` nach dem Namen der Klasse eine andere Klasse angeben, von der sie erbt.

```java
class B extends A {
    ...
}
```
])

#subtask([Was sind #emph([abstrakte Klassen]) und #emph([Methoden])?], 2, [
    Abstrake Klassen sind Klassen, von denen keine Objekte erzeugt werden können. Abstrakte Methoden sind Methoden ohne Implementierung, die in jeder Unterklasse implementiert werden müssen.
])

#subtask([Was sind _Interfaces_? Wozu benötigt man sie in Java?], 3, [
    Interfaces sind ähnlich zu abstrakten Klassen, die ausschließlich aus abstrakten Methoden bestehen. In Java kann eine Klasse nur von maximal einer anderen Klasse erben, jedoch von beliebig vielen Interfaces. Für Mehrfachvererbung sind Interfaces ein Ausweg.
])

#subtask([Was sind _Exceptions_? Wie behandelt man sie in Java?], 2, [
    Exceptions sind Fehlerereignisse, die, wenn sie nicht behandelt werden, das Programm stoppen. Sie werden durch `try`-`catch`-Anweisungen behandelt. Jede `try`-`catch`-Anweisungen besteht aus einem `try`-Block und beliebig vielen `catch`-Blöcken, die eine bestimmte Exception $E$ behandeln. Im `try`-Block wird der auftretende Fehler abgefangen und der passende `catch`-Fall ausgeführt. Ist kein passender `catch`-Fall vorhanden, wurde sie nicht behandelt und das Programm wird gestoppt.

```java
public static int parseInput(String input) {
    try {
        return Integer.parseInt(input);
    } catch (NumberFormatException e) {
        return -1;
    }
}
```
])

#subtask([Was sind _Generics_? Welche Vorteile bieten sie?], 2, [
    Generics machen es möglich, Methoden und Klassen für verschiedene Datentypen gleichzeitig zu definieren. Wenn keine besondere Eigenschafft eines Datentyps $T$ benutzt wird, kann man die Klasse bzw. die Methode $A$ mithilfe von Generics auf eine Klasse bzw. Methode #emph("A<T>") generalisieren. Anstelle des Namens des Datentyps kann dann ein beliebiger, in der Methoden- oder Klassendefinition definierter, Platzhalter verwendet werden

```java
import java.util.ArrayList;

public class GenericsExample {
    public static <T> ArrayList<T> addElement(ArrayList<T> a, T b) {
        a.add(b);
        return a;
    }

    public static void main(String[] args) {
        ArrayList<Integer> l1 = new ArrayList<Integer>();
        l1.add(1);

        ArrayList<String> l2 = new ArrayList<String>();
        l2.add("Hello");

        addElement(l1, 2);
        addElement(l2, "World");
    }
}
```
])

#task[Komplexe Zahlen][Sowohl abstrakte Datentypen (ADT) als auch Objekte kapseln Daten zusammen mit den Operationen, die auf diese zugreifen. Es bestehen viele Gemeinsamkeiten, aber auch wichtige Unterschiede.]

#subtask([Spezifizieren Sie den ADT "Complex Number" zur Repräsentation komplexer Zahlen. Es soll möglich sein, eine komplexe Zahl zu erzeugen, zwei komplexe Zahlen zu addieren, zu subtrahieren, zu multiplizieren und zu dividieren sowie den Real- und Imaginärteil einer komplexen Zahl zu bestimmen!], 3, [
    #show math.equation: it => emph(it)
    #let complex = "complex"
    #let add = "add"
    #let sub = "sub"
    #let mul = "mul"
    #let div = "div"

    #let Radd = "Radd"
    #let Rsub = "Rsub"
    #let Rmul = "Rmul"
    #let Rdiv = "Rdiv"

    Ein algebraischer Datentyp $CC$ für "Complex Number", wobei $Radd$, $Rsub$, $Rdiv$ und $Rmul$ Operanten zur Addition, Subtraktion, Division und Multiplikation von reellen Zahlen sind:

    #adt(
        (
            $RR$,
        ),
        (
            $complex: RR times RR -> CC$,
            $add: CC times CC -> CC$,
            $sub: CC times CC -> CC$,
            $mul: CC times CC -> CC$,
            $div: CC times CC -> CC$,
        ),
        $forall r_1, r_2, i_1, i_2 in RR circle.filled.small$,
        (
            $add(complex(r_1, i_1), complex(r_2, i_2)) = complex(r_1 + r_2, i_1 + i_2)$,
            $sub(complex(r_1, i_1), complex(r_2, i_2)) = complex(r_1 - r_2, i_1 - i_2)$,
            $mul(complex(r_1, i_1), complex(r_2, i_2)) = complex(r_1 r_2 - i_1 i_2, r_1 i_2 + r_2 i_1)$,
            $div(complex(r_1, i_1), complex(r_2, i_2)) = complex((r_1 r_2 + i_1 i_2)/(r_2 r_2 + i_2 i_2), (i_1 r_2 - r_1 i_2)/(r_2 r_2 + i_2 i_2))$
        )
    )
])

#subtask([Wie lassen sich aus der Signatur des ADT Complex die Methodendeklarationen einer objekt-orientierten Implementierung ableiten? Wie gehen Sie vor?], 3, [
    Der ADT ist die Spezifikation einer Klasse. Verwendete Sorten erscheinen als benutzte Datentypen, $RR$ steht hier für `double`, $CC$ ist die Klasse `Complex` selbst. Die Operatoren sind die Signaturen der Methoden für die Klasse, wobei der Definitionsbereich der Abbildung durch die Argumente dargestellt und der Rückgabewert der Methode der Wertebereich ist. Die Regeln sind die Implementierung der jeweiligen Methoden.
])

#subtask([Erstellen Sie eine objekt-orientierte Implementierung in Java! Nutzen Sie hierzu die Datei Complex.java!], 4, [
    Siehe auch `src/Complex.java`.

    #raw(block: true, lang: "java", read("src/Complex.java"))
])