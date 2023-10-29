#import "../stateful.typ": *

#let greek(body) = {
    if-state-enabled( body , {
        show regex("alpha-"): $alpha$ + "-"
        show regex("beta-"): $beta$ + "-"
        show regex("gamma-"): $gamma$ + "-"
        body
    })
}