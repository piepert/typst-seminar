#let fontsize = 12pt

#let project(date: none, title: none, body) = {
    set text(lang: "de", size: fontsize, font: "Times New Roman")
    set par(justify: true)

    set page(margin: (left: 2.5cm,
            right: 2.5cm,
            top: 2.5cm,
            bottom: 2.5cm),
        header: {
            block(stroke: (bottom: black),
                inset: (bottom: 5pt),
                grid(columns: (1fr, 1fr, 1fr),
                    align(left, date),
                    align(center, counter(page).display()
                        + [ \/ ]
                        + locate(l => counter(page).final(l).first())),
                    align(right, title)))

            locate(loc => {
                let pagenum = str(counter(page).at(loc).first())
                let dict = state("line_points").final(loc)

                if dict == none {
                    return
                }

                if pagenum in dict {
                    dict = dict.at(pagenum)

                    for key in dict.keys() {
                        style(s => {
                            let stars = stack(dir: ltr, .. (text(size: 16pt)[★],) * dict.at(key))
                            let width = measure(stars, s).width

                            place(top + right,
                                dy: eval(key) - fontsize,
                                dx: width - 2.25em,
                                stars)
                        })
                    }
                }
            })
        })

    align(center, text(size: 17pt, weight: "thin", title))
    body
}

#let tasks_points_state = state("tasks_points")

#let init_task_points() = {
    tasks_points_state.update(k => {
        if k == none {
            return (points: (0,), tasks: 0)
        }

        k
    })
}

#let increase_task_points(p) = {
    init_task_points()

    tasks_points_state.update(k => {
        k.points.at(k.tasks) += p

        k
    })
}

#let add_task_task_points() = {
    init_task_points()

    tasks_points_state.update(k => {
        let _ = k.points.push(0)
        k.tasks += 1

        k
    })
}

#let get_task_points(payload: none) = {
    init_task_points()

    locate(loc => {
        if payload != none {
            payload(tasks_points_state
                .at(loc)
                .points
                .at(tasks_points_state
                    .at(loc)
                    .tasks))
        } else {
            str(tasks_points_state
                .final(loc)
                .points
                .at(tasks_points_state
                    .at(loc)
                    .tasks))
        }
    })
}

#let point() = {
    locate(loc => {
        let key = repr(loc.position().y)

        state("line_points").update(k => {
            let pagenum = str(counter(page).at(loc).first())
            let pager = if k == none { (:) } else { k }
            let value = (:)

            if pagenum not in pager {
                pager.insert(pagenum, (:))
            }

            value = pager.at(pagenum)
            value.insert(key, if key in value {
                value.at(key) + 1
            } else {
                1
            })

            pager.insert(pagenum, value)
            pager
        })
    })

    increase_task_points(1)
}

#let task(description, body, eh) = {
    add_task_task_points()
    counter("tasks").step()

    let taskname = ([Aufgabe ]
            + counter("tasks").display());

    grid(columns: (1fr, auto),
        gutter: 3em,
        strong(smallcaps(taskname))
            + [. ]
            + description,
        strong(get_task_points() + [P]))

    v(0.5em)
    body

    set text(size: 10pt)
    table(columns: (100%),
        inset: 0pt,
        block(inset: 5pt, fill: black, width: 100%, text(fill: white, [Erwartungshorizont #taskname])),
        block(inset: 1em,
            width: 100% - 3.5em, [
            #box(eh)

            #v(0.5em)
            #strong[Erreichbare Punkte: #get_task_points()]
        ]))

    v(1em)
}

#let conclude(premise, conclusion) = {
    style(s => {
        let bottom = none
        let top = none

        if measure(premise, s).width > measure(conclusion, s).width {
            bottom = black
        } else {
            top = black
        }

        grid(block(inset: 5pt,
                stroke: (bottom: bottom, rest: none),
                premise),
            block(inset: 5pt,
                stroke: (top: top, rest: none),
                conclusion))
    })

}