#import "../stateful.typ": *
#import "../constants.typ"

#let drop-caps = text.with(size: 0.65em, baseline: 0.0em)

#let drop-caps(body) = {
}

#let fischer-dropcaps(body) = {
    show: it => {
        for k in constants.fischer-dropcaps {
            it = {
                show k + "-": (it) => {
                    show: text.with(size: 0.65em)
                    show "-": "–"
                    it
                }
                it
            }
        }
        it
    }
    body
}