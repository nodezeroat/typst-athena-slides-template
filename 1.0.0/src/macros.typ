#import "tugcolors.typ"

#let quote-block(
  top-pad: 0.65cm,
  color: tugcolors.tug,
  spacing: 0.3cm,
  body,
) = context [

  // Grid with the design
  #let g(s: 0cm, body) = [
    #grid(
      columns: (0.195cm, auto),
      column-gutter: 0.7cm,
      row-gutter: 0cm,
      [
	#rect(
	  fill: tugcolors.tug,
	  height: s + top-pad,
	)
      ],
      align(horizon, body),
    )
  ]

  // We compute its "auto" heigth and then print it with the correct height
  #layout(size => {
    let (height,) = measure(width: size.width, g(body))
    g(s: height, body)
  })

  #v(spacing)
]

#import "@preview/showybox:2.0.4": showybox
#import "@preview/tableau-icons:0.331.0": *
#let color-block(title, icon: none,
  spacing: 0.78em, color: tugcolors.tug, color-body: tugcolors.lite, body) = [

  #show emph: it => {
    text(weight: "medium", fill: self.colors.primary, it.body)
  }

  #showybox(
    title-style: (
      color: white,
      sep-thickness: 0pt,
    ),
    frame: (
      //inset: 0.4em,
      radius: 0pt,
      thickness: 0pt,
      border-color: color,
      title-color: color,
      body-color: color-body,
      inset: (x: 0.55em, y: 0.65em),
    ),
    above: spacing,
    below: spacing,
    title: if icon == none {
      align(horizon)[#strong(title)]
    } else {
      align(horizon)[
	#draw-icon(icon, height: 1.2em, baseline: 20%, fill: white) #h(0.2cm) #strong[#title]
      ]
    },
    body,
  )
]

// https://tabler.io/icons

#let icon-block(title, icon, body) = [
  #color-block([#v(-0.2cm) #draw-icon(icon, height: 1.2em, baseline: 20%, fill: white) #h(0.2cm) #strong[#title] #v(-0.25cm)])[
    #body
  ]
]



//vim:tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab colorcolumn=81
