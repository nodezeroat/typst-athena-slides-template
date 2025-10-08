#import "../src/lib.typ": *

#show: athena-theme.with(
  aspect-ratio: "16-9",
  slide-alignment: top,
  progress-bar: true,
  font: "Berkeley Mono",
  institute: [\@nodezeroat/project-athena],
  logo: [],
  config-info(
    title: [Module 01: Legal],
    subtitle: [Überblick über die Rechtslage in Österreich und Deutschland],
    authors: ([*Marcel Schnideritsch*]),
    extra: [],
    footer: [First Author, Second Author, Third Author],
  ),
  config-common(
    handout: false,
  ),
  config-colors(
      primary: rgb("14b5fc"),
  ),
)

// -------------------------------[[ CUT HERE ]]--------------------------------
//
// === Available slides ===
//
// #title-slide()
// #standout-slide(title)
// #section-slide(title,subtitle)
// #blank-slide()
// #slide(title)
//
// === Available macros ===
//
// #quote-block(body)
// #color-block(title, body)
// #icon-block(title, icon, body)
//
// === Presenting with pdfpc ===
//
// Use #note("...") to add pdfpc presenter annotations on a specific slide
// Before presenting, export all notes to a pdfpc file:
// $ typst query slides.typ --field value --one "<pdfpc-file>" > slides.pdfpc
// $ pdfpc slides.pdf
//
// -------------------------------[[ CUT HERE ]]--------------------------------
 
#title-slide()

#section-slide(title: [First Section])

#slide(title: [First Slide])[
  #quote-block[
    Good luck with your presentation! @emg25template
  ]

  #note("This will show on pdfpc speaker notes ;)")
]

#slide(title: [Bibliography])[
  #bibliography("bibliography.bib")
]
