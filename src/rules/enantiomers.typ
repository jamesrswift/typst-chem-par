#import "../stateful.typ": *

#let enantiomers(body) = {
  show regex("\([EZRSDL]\)"): (it) => {
    if-state-enabled( it , {
      show regex("\w"): text.with(style:"italic")
      it
    } )
  }
  body
}
