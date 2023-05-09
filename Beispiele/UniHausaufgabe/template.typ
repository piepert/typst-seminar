#set text(size: 12pt)
#let tasks_points_state = state("tasks_points")
#let subtask_counter = counter("subtask_counter")
#let st_color = rgb("#e1e1e1")
#let st_color_border = rgb("#8e8e8e")

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

#let get_task_points() = {
    init_task_points()

    locate(loc => tasks_points_state
        .final(loc)
        .points
        .at(tasks_points_state
            .at(loc)
            .tasks))
}

#let pointed(points, content) = {
    table(columns: (1fr, auto),
        inset: 0pt,
        stroke: 0cm + white,
        align: bottom,
        [#content],

        text(size: 12pt,
            style: "normal",
            block(
            inset: (left: 1.5em),
            [(#points P.)])
        )
    )

    increase_task_points(points)
}

#let subtask(border: false, task, points, solution) = {
    if border {
        block(stroke: (bottom: 0.25mm + black, left: 0.25mm + black),
            inset: (rest: 1em), [
                #grid(columns: (auto, 1fr, auto),
                    block(inset: (right: 1em), strong(locate(loc => numbering("(a)", subtask_counter.at(loc).at(0)+1)))),
                    task,
                    [#if points >= 1 { block(inset: (left: 1.5em), [(#points P.)]) }]
                )
            ]
        )

        par(block(inset: (left: 1em), solution))

    } else {
        table(columns: (auto, 1fr, auto),
            stroke: white,
            inset: 0pt,

            strong(
                block(breakable: true,
                    inset: (right: 0.5em),
                    locate(loc => numbering("(a)", subtask_counter.at(loc).at(0)+1))
                )
            ),

            task,
            if points > 0 { block(inset: (left: 1.5em),
            [(#points P.)]) }
        )

        par(solution)
    }

    v(1.5em, weak: true)
    subtask_counter.update(k => k+1)
    increase_task_points(points)
}

#let task(title, content) = {
    add_task_task_points()
    subtask_counter.update(0)

    heading(
        table(columns: (1fr, auto),
            inset: 0pt,
            stroke: 0cm + white,
            align: bottom,
            [Aufgabe #locate(loc => tasks_points_state.at(loc).tasks) -- #title],

            text(size: 12pt,
                style: "normal",
                block(
                inset: (left: 1.5em),
                [(#get_task_points() P.)])
            )
        )
    )

    content
    v(1.5em, weak: true)
}

#let adt(types, operants, variable_line, rules) = block(inset: (left: 0.5em), block(breakable: true,
        inset: 0em,
        stroke: (left: 0.25mm), [
            #block(inset: (left: 1em, bottom: 1em, top: 1em, right: 1em),
                stroke: (bottom: 0.25mm), {
                    if types.len() > 0 {
                        "["
                        let i = 0
                        while i < types.len() {
                            types.at(i)
                            i += 1

                            if i < types.len() {
                                ", "
                            }
                        }
                        "]"

                        v(0.5em)
                    }

                    par({
                        for o in operants {
                            par(o)
                        }
                    })
                }
            )

            #block(inset: (top: 0em, left: 1em, bottom: 1em, right: 1em), {
                variable_line
                set par(first-line-indent: 0em, hanging-indent: 0em)
                v(0.5em)

                block(inset: (left: 1.5em),
                    for r in rules {
                        if r == "" {
                            v(0.5em)
                        } else {
                            par(r)
                        }
                    }
                )
            })
        ]
    )
)

#let project(title: "", authors: (), date: none, body) = {
    let _ = subtask_counter.update(0)
    let _ = init_task_points()

    /* ------------- PAGE SETUP START ------------- */
    set document(author: authors.map(a => a.name), title: title)
    set par(first-line-indent: 0em, justify: true, linebreaks: "optimized")
    set page(footer: align(center, counter(page).display() + " / " + locate(l => counter(page).final(l).at(0))))
    set text(size: 12pt, lang: "de")

    show par: set block(below: 1em)
    show heading: it => block(inset: (top: 0.5em, bottom: 0.5em), par(justify: false, it.body))

    show raw: it => if it.block {
        v(1.5em, weak: true)
        it
    } else {
        it
    }

    show raw.where(block: true): it => {
        set par(justify: false)

        block(inset: (left: 1em), grid(columns: (100%, 100%), column-gutter: -100%,
            block(width: 100%, inset: 1em, {
                let lines = it.text.split("\n").rev()
                let _i = 0

                while _i < lines.len() and lines.at(_i).trim() == "" and _i < 2 {
                    _i += 1
                }

                let lines = lines.slice(_i).rev()

                for (i, line) in lines.enumerate() {
                    hide(box(width: 0pt, align(right, str(i + 1) + h(2em))))

                    set text(fill: rgb("#5e5e5e"), size: 0.75em)
                    box(width: 0pt, align(right, str(i + 1) + h(2em)))

                    hide(line)
                    linebreak()
                }
            }),

            block(stroke: (left: 0.025cm + rgb("#8e8e8e")),
                fill: luma(246),
                width: 100%,
                inset: 1em,
                it),
        ))
    }

    show raw.where(block:true): block.with(
        width: 100%,
    )
    /* ------------- PAGE SETUP END ------------- */
    table(columns: (50%, 50%),
        inset: 0pt,
        stroke: white,

        table(columns: (auto),
            inset: 4pt,
            stroke: white,
            [Universität Rostock,],
            [Fakultät für Informatik und\ Elektrotechnik]),

        align(right, table(columns: (auto),
            inset: 4pt,
            stroke: white,

            [Algorithmen und Datenstrukturen],
            [Sommersemester 2023],
            date
        ))
    )

    align(center, [
        #locate(loc => {
            text(size: 2em, strong("Aufgabenblatt "+str(title)))

            if tasks_points_state.final(loc) == none {
                return
            }

            par(text(size: 1em, [Erreichbare Punktzahl: ] + str(tasks_points_state.final(loc).points.fold(0, (i,j) => i+j))) + [ P.])
        })
    ])

    pad(
        top: 0.5em,
        bottom: 0.5em,
        x: 2em,

        grid(columns: (1fr,) * calc.min(3, authors.len()),
            gutter: 1em,
            ..authors.map(author => align(center)[
                *#author.name* \
                Mat.-Nr.: #author.matnr
            ]),
        ),
    )

    body
}

#let todo(body) = block(fill: rgb("#fff0f0"), stroke: (left: 2pt + red, rest: none), inset: 1em, width: 100%, strong[To Do] + par(body))