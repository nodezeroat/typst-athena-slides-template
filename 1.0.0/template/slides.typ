#import "../src/lib.typ": *
//#import "@local/definitely-not-isec-slides:1.0.0": *

#show: definitely-not-isec-theme.with(
  aspect-ratio: "16-9",
  slide-alignment: top,
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
  config-colors(
    primary: black,
  ),
)

// -------------------------------[[ CUT HERE ]]--------------------------------
//
// === Available slides ===
//
// #title-slide()
// #standout-slide()
// #section-slide()
// #blank-slide()
// #bibliography-slide()
// #slide()
//
// === Available macros ===
// #intro-block[]
// #color-block[]
// #icon-block[]
//
// === Integration with pdfpc ===
//
// Use #note("...") to add pdfpc presenter annotations on a specific slide
// Before presenting, export all notes to a pdfpc file:
// $ typst query slides.typ --field value --one "<pdfpc-file>" > slides.pdfpc

// -------------------------------[[ CUT HERE ]]--------------------------------
 
#title-slide()

#slide(title: [First Slide])[
  #quote-block[
    Important or introductory phrase for the current slide topic.
  ]

  Continuatory explanation @emg25template over the introductory phrase, leading to:

  #v(0.2cm)
  #grid(
    columns: 2,
    column-gutter: 0.6cm,
    color-block([Result A])[
      - Benefit
      - Benefit
      - Downside
    ],
    color-block([Result B])[
      - Benefit
      - Downside
      - Downside
    ],
  )
  #v(0.2cm)

  #lorem(10)

  #v(0.2cm)
  ```c
  int main() {
    void *p = malloc(0x10);
  }
  ```
]

#slide(title: [First Slide])[
  #quote-block[
    #lorem(20)
  ]

]

#section-slide(
  title: [Section A],
  subtitle: [Longer Subtitle]
)

#slide(title: [Second Slide])[
  #rect(fill: gray.lighten(70%), width: 100%, height: 100%)[
    #align(center + horizon)[
      Usable Area
    ]
  ]
]

= This is a test

test

#slide(title: [Bibliography], alignment: top)[
  #bibliography("bibliography.bib")
]
