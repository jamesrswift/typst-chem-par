#let Chemistry-Style-disable-state = state("Chemistry-Style-disable", true)

#let chem-toggle(bool) = {Chemistry-Style-disable-state.update(bool)}

#let if-state-enabled(it, fn) = context {
  if (not Chemistry-Style-disable-state.get()) {
    return it
  }
  return fn 
}

#let chem-disabled(content) = {
  chem-toggle(false)
  content
  chem-toggle(true)
}