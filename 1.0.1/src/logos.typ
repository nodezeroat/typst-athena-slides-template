#let institute-logo(self) = [
  #block[
    #text(size: 13.5pt, weight: "medium")[#self.store.institute]
    #h(0.1cm)
    #box(inset: 0pt, outset: 0pt)[#square(
        width: 0.3cm,
        height: 0.3cm,
        outset: 0pt,
        inset: 0pt,
        stroke: none,
        fill: self.colors.primary,
      )]
  ]
]

#let nodezero-logo = [
  #set align(right)
  #set text(size: 12pt, tracking: 3.6pt)
  #move(dx: -1cm, dy: 1cm)[
    #image("assets/nodezero-logo.svg", width: 6cm)
  ]
]