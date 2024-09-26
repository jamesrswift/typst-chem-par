#import "../stateful.typ": *

#let enantiomers(body) = {
  show regex("\([EZRS]\)"): (it) => context {
    if-state-enabled( it , {
      show regex("\w"): text.with(style:"italic")
      it
    } )
  }
  body
}
