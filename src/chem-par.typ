#import "stateful.typ": *

#let elements = ("Ac","Ag","Al","Am","Ar","As","At","Au","Ba","Be","Bh","Bi","Bk","Br","B","Ca","Cd","Ce","Cf","Cl","Cm","Co","Cr","Cs","Cu","C","Ds","Db","Dy","Er","Es","Eu","Fe","Fm","Fr","F","Ga","Gd","Ge","He","Hf","Hg","Ho","Hs","H","In","Ir","I","Kr","K","La","Li","Lr","Lu","Md","Mg","Mn","Mo","Mt","N","Na","Nb","Nd","Ne","Ni","No","Np","Os","O","Pa","Pb","Pd","Pm","Po","Pr","Pt","Pu","P","Ra","Rb","Re","Rf","Rg","Rh","Rn","Ru","Sb","Sc","Se","Sg","Si","Sm","Sn","Sr","S","Ta","Tb","Tc","Te","Th\b","Ti","Tl","Tm","U","V","W","Xe","Yb","Y","Zn","Zr")

#let ChemRegex = "(\(?((" + elements.map(it=>{"("+it+")"}).join("|") + ")+\d?)+(\)\d*)?(\d*([\+-]\W)?)*)"
#let chem-style = (body) => {
  // Chemical short hands
  show regex("\([EZRSDL]\)"): (it) => {
    if-state-enabled( it , {
      show regex("\w"): text.with(style:"italic")
      it
    } )
  }

  show regex("(((iso)|(sec)|(tert)|(cis)|(trans)|[iompnN])-)|(N,)"): (it) => {
    Chemistry-Style-disable-state.display(bDisable =>{
      if ( bDisable == false ){ return it}
      show regex("-"): "–"
      emph(it)
    })
  }

  // Chemical Formulae
  show regex(ChemRegex): (it) => {
    Chemistry-Style-disable-state.display(bDisable =>{
      if ( bDisable == false ){ return it}
      show regex("\d"): sub
      show regex("\d*[+-]"): super
      it
    })
  }
  body
}
