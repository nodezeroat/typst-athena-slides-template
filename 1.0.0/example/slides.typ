#import "../src/lib.typ": *
//#import "@local/definitely-not-isec-slides:1.0.0": *

// ----------------------------------------------------------------------------
// Configuration
// ----------------------------------------------------------------------------
#show: definitely-not-isec-theme.with(
  aspect-ratio: "16-9",
  progress-bar: true,
  config-info(
    title: [Long Paper Title \ with One to Three Lines],
    subtitle: [An optional short subtitle],
    authors: ([*First Author*], [Second Author], [Third Author]),
    extra: [SomeConf 2025],
    footer: [First Author, Second Author, Third Author],
    download-qr: "",
  ),
  config-common(
    handout: false,
  ),
)
// -------------------------------[[ CUT HERE ]]--------------------------------
//
// #title-slide()
//
// #slide(alignment: top, title: [...])
//
// #standout-slide()
// #section-slide()
// #blank-slide()
//

// -------------------------------[[ CUT HERE ]]--------------------------------

// ----------------------------------------------------------------------------
// Slides
// ----------------------------------------------------------------------------

#show cite: set text(fill: tugcolors.main)

#title-slide()

#slide(alignment: top, title: [First Slide])[

  #quote-block(spacing: 0.3em)[
    #lorem(10)
  ]

  #lorem(10)
  
  #color-block([Symmetric])[
    This looks much better
  ]
  
  #lorem(10)

  #columns(2)[
    #icon-block([Symmetric], "ad-circle")[
          This looks much better
    ]

    #color-block([Symmetric])[
          This looks much better
    ]
  ]

  #pdfpc.speaker-note("This is a note that only the speaker will see.")

]

#slide(alignment: top, title: [First Slide], outlined: false)[

  #quote-block[
    #lorem(20)
  ]

  Thus, by using common sense we can deduce that

  #note("
    This note will appear on pdfpc's presenter mode. Lets see how long it can be lol

    It even supports multiline!
    ")
]


#section-slide(title: [Conclusions], subtitle: [Final Section])


#blank-slide[
  A blank canvas for memes
]


#standout-slide(title: [But what if...?])


#slide(title: [Bibliography], alignment: top)[
  #bibliography("bibliography.bib")
]


#title-slide()
