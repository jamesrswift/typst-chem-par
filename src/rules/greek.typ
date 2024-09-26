#import "../stateful.typ": *
#import "../constants.typ"

#let greek(body) = context {
    if-state-enabled( body , {
        show: it => {
            for (k, v) in constants.greek {
                it = {show k + "-": v + "-"; it}
            }
            it
        }
        body
    })
}