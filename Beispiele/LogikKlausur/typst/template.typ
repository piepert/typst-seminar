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
                            let stars = stack(dir: ltr, .. ($star.filled$,) * dict.at(key))
                            let width = measure(stars, s).width

                            place(top + right,
                                dy: eval(key) - fontsize*0.75,
                                dx: width + 1em,
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

            if k == none or pagenum not in k {
                let pager = if k == none {
                    (:)
                } else {
                    k
                }

                let m = (:)
                m.insert(key, 1)
                pager.insert(pagenum, m)
                pager

            } else if pagenum in k {
                let stars = k.at(pagenum)
                let value = if key in stars { stars.at(key) } else { 0 } 
                stars.insert(key, value+1)
                k.at(pagenum) = stars
                k
            }
        })

        /*
        - state dictionary that maps each y-position (vertical) of the page to a LTR stack of these symbols

        - If, when point is called and the current y-position is not yet in this state dictionary, then you place the first star in the margin.

        - Then subsequent calls to point at the same y-position would find the existing star and append to it.
        */

        /*
        for i in range(dict.at(key)) {
            let amount = i * 10pt
            place(right, dx: amount + 20pt)[#rect(fill: red, width: 5pt, height: 5pt)]
            // place(right, dx: amount + 20pt, dy: -1em)[$star.filled$]
        }
        */
    })

    increase_task_points(1)
}

#let task(description, points, body) = {
    add_task_task_points()
    counter("tasks").step()

    grid(columns: (1fr, auto),
        gutter: 2em,
        strong(smallcaps([Aufgabe ]
            + counter("tasks").display()))
            + [. ]
            + description,
        strong(get_task_points() + [P]))

    v(0.5em)
    body
}