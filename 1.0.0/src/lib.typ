#import "@preview/touying:0.6.1": *

// Project
#import "tugcolors.typ"
#import "helper.typ": *
#import "logos.typ": *

// Core Imports
#import "@preview/codly:1.3.0": * // For bindings
#import "@preview/cetz:0.3.2" // For bindings
#import "@preview/fletcher:0.5.5" as fletcher: edge, node // For bindings
#import "@preview/tiaoma:0.3.0" // For auto QR generation

// Styling Macro Imports
#import "@preview/showybox:2.0.4": showybox

// Touying bindings for cetz
#let cetz-canvas = touying-reducer.with(
  reduce: cetz.canvas,
  cover: cetz.draw.hide.with(bounds: true),
)
// Touying bindings for fletcher
#let fletcher-diagram = touying-reducer.with(
  reduce: fletcher.diagram,
  cover: fletcher.hide,
)

// Macro for notes
#let note(text) = [
  #pdfpc.speaker-note(text)
]

// -----------------------------------------------------------------------------
// Slide Types
// -----------------------------------------------------------------------------

//
// Normal Slide
//
#let slide(
  title: auto,
  alignment: none,
  outlined: true,
  ..args,
) = touying-slide-wrapper(self => {
  let info = self.info + args.named()

  // Header:
  // ---------------------------------------------------------------------------
  // [ ] Slide Title                                                [ ] Logo [ ]
  // ---------------------------------------------------------------------------
  let header(self) = {
    // Slide Title: if the user overrides the title of a certain slide, use it
    let hdr = if title != auto { title } else { self.store.header }

    show heading: set text(size: 24pt, weight: "semibold")

    grid(
      columns: (self.page.margin.left, 1fr, 1cm, auto, 1.2cm),
      block(),
      heading(level: 1, outlined: outlined, hdr),
      block(),
      move(dy: -0.31cm, institute-logo(self)),
      block(),
    )
  }

  // Footer:
  // ---------------------------------------------------------------------------
  // Slide Number [ ] First Author
  // ---------------------------------------------------------------------------
  let footer(self) = context {
    set block(height: 100%, width: 100%)
    set text(size: 15pt, fill: self.colors.footer)

    grid(
      columns: (self.page.margin.bottom - 1.68%, 1.3%, auto, 1cm),
      block(fill: self.colors.primary)[
        #set align(center + horizon)
        #set text(fill: white, size: 12pt)
        #utils.slide-counter.display()
      ],
      block(),
      block[
        #set align(left + horizon)
        #set text(size: 13pt)
        #info.at("footer", default: "")
      ],
      block(),
    )

    // Progress bar
    if self.store.progress-bar {
      place(bottom + left, float: true,
        move(dy: 1.05cm, // Bad solution, I know
          components.progress-bar(
            height: 3pt,
            self.colors.primary,
            white,
          )
        )
      )
    }
  }

  let self = utils.merge-dicts(self, config-page(
    header: header,
    footer: footer,
  ))

  set align(
    if alignment == none {
      self.store.default-alignment 
    } else {
      alignment 
    } 
  )

  touying-slide(self: self, ..args)
})

// 
// Title Slide
// 
#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    let footer-isec = [
      #set text(size: 13.3pt, weight: "medium")

      #let arrow-icon = [
        #move(dy: -0.05cm, dx: -0.05cm, rotate(45deg, square(
          fill: none,
          size: 0.18cm,
          stroke: (
            "top": self.colors.primary + 1.35pt,
            "bottom": none,
            "right": self.colors.primary + 1.35pt,
            "left": none,
          ),
        )))
      ]

      #v(-0.5cm)
      #box(arrow-icon) #h(0.1cm) #self.store.institute
    ]

    set page(footer: footer-isec, header: none)
    set block(below: 0pt, above: 0pt)

    // Top-right icon + text
    place(top + right, dy: -1.9cm, dx: 0.78cm, [
      #self.store.logo
    ])

    v(0.8cm)

    block(width: 83%)[
      #let title = text(size: 40.5pt, weight: "bold")[#info.at(
          "title",
          default: "",
        )]

      #move(dx: 0.04em)[
        #grid(
          columns: (0.195cm, auto),
          column-gutter: 0.7cm,
          context [
            #let s = measure(title)
            #move(dy: -0.4cm, rect(
              fill: self.colors.primary,
              height: s.height + 0.65cm,
            ))
          ],
          title,
        )
      ]
    ]

    v(0.6cm)

    block(width: 70%)[
      #text(
        size: 28.3pt,
        fill: self.colors.primary,
        weight: "bold",
      )[#info.subtitle]
    ]

    v(1.48cm)

    block(width: 70%)[
      #set text(size: 19pt)
      #if type(info.authors) == array [
        #for author in info.authors [
          #author #h(1.1em)
        ]
      ] else [
        #info.authors
      ]
    ]

    v(0.95cm)

    block(width: 70%)[
      #info.extra
    ]

    if (
      self.info.at("download-qr", default: none) != none
        and self.info.at("download-qr", default: none) != ""
    ) {
      place(bottom + right)[
        #align(center + horizon)[
          #let s = 4.9cm
          #tiaoma.qrcode(self.info.download-qr, width: s, height: s)
        ]
      ]
    }
  }

  touying-slide(self: self, body)
})

//
// Standout Slide
//
#let standout-slide(
  title: auto,
  ..args,
) = touying-slide-wrapper(self => {
  let body = {
    set align(center + horizon)
    set text(size: 28pt)
    move(dy: -2.08cm)[
      #text(weight: "semibold")[#title]
    ]
  }

  let self = utils.merge-dicts(self, config-page(
    header: none,
    footer: none,
  ))

  //counter("touying-slide-counter").update(n => if n > 0 { n - 1 } else { 0 })

  touying-slide(self: self, body, ..args)
})

//
// Section Slide
//
#let section-slide(
  title: none,
  subtitle: none,
  ..args,
) = touying-slide-wrapper(self => {
  let body = {
    align(center + horizon)[
      #move(dy: -0.4cm)[
        #if title != none [
          #text(size: 36pt, weight: "semibold")[#title]
        ]

        #if subtitle != none [
          #text(size: 20pt)[#subtitle]
        ]
      ]
    ]
  }

  let self = utils.merge-dicts(self, config-page(
    header: none,
    footer: none,
  ))

  touying-slide(self: self, body, ..args)
})

//
// Blank Slide
//
#let blank-slide(
  ..args,
  body,
) = touying-slide-wrapper(self => {
  let body = {
    align(center + horizon)[
      #body
    ]
  }

  let self = utils.merge-dicts(self, config-page(
    header: none,
    footer: none,
    margin: 0pt,
  ))

  touying-slide(self: self, body, ..args)
})

// -----------------------------------------------------------------------------
// Main Function
// -----------------------------------------------------------------------------

#let definitely-not-isec-theme(
  aspect-ratio: "16-9",
  header: utils.display-current-heading(level: 1),
  font: "Open Sans",
  institute: [isec.tugraz.at],
  logo: tugraz-logo,
  slide-alignment: top,
  progress-bar: true,
  ..args,
  body,
) = {
  // Touying configuration
  show: touying-slides.with(
    config-page(
      paper: "presentation-" + aspect-ratio,
      margin: (
        left: 1.49cm,
        right: 1.48cm,
        top: 2.6cm,
        bottom: 1.6cm,
      )
    ),
    config-store(
      header: header,
      font: font,
      institute: institute,
      logo: logo,
      default-alignment: slide-alignment,
      progress-bar: progress-bar,
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: none,
      preamble: {
        codly(
          display-name: false,
          display-icon: false,
          radius: 0pt,
          stroke: 1pt + black,
          smart-indent: true,
          fill: luma(260),
          zebra-fill: luma(250),
          number-format: number => [#text(size: 12pt, fill: gray)[#number]],
          number-align: right + horizon,
          breakable: true,
        )
      }
    ),
    config-colors(primary: tugcolors.tug, footer: rgb("808080")),
    config-methods(
      cover: (self: none, body) => hide(body),
      init: (
      self: none,
      body,
    ) => {
      // TUGraz uses Source Sans Pro, but its a licensed Adobe font
      set text(size: 20pt, lang: "en", region: "US", font: font)
      show emph: it => { text(self.colors.primary, it.body) }
      show strong: it => { text(weight: "bold", it.body) }

      // Bibliography
      set bibliography(title: none, style: "ieee")
      set cite(style: "alphanumeric")
      show bibliography: set par(spacing: 0.4cm)
      show bibliography: set grid(align: top + left)
      show bibliography: set text(17pt)
      show bibliography: t => {
        show grid.cell.where(x: 0): set text(fill: self.colors.primary)
        show grid.cell.where(x: 0): set align(top + left)
        show link: set text(fill: gray)
        t
      }

      // Lists & Enums
      set list(
        marker: ( 
          (move(dy: 0.11cm, square(width: 0.4em, height: 0.4em, fill: self.colors.primary))),
          (move(dy: 0.11cm, square(width: 0.4em, height: 0.4em, fill: black))),
          (move(dy: 0.11cm, square(width: 0.4em, height: 0.4em, fill: gray))),
        ),
        body-indent: 1.2em,
      )
      set enum(
        numbering: n => {
          square(stroke: none, fill: self.colors.primary, size: 0.53cm)[
            #align(center + horizon)[ #text(size: 12pt, fill: white)[#n] ]
          ]
        },
        body-indent: 0.6cm
      )


      // Code blocks
      show: codly-init.with()
      show raw.where(block: true): set text(size: 13pt)


      // Hotfixes, the messy part

      // https://github.com/touying-typ/touying/issues/136
      set par(spacing: 0.65em)

      body
    }),
    ..args,
  )

  body
}

// -----------------------------------------------------------------------------
// Styling Macros
// -----------------------------------------------------------------------------

#let quote-block(
  top-pad: 0.55cm,
  color: tugcolors.tug,
  spacing: 0.3cm,
  body,
) = [
  #touying-fn-wrapper((self: none) => [
    // Grid with the design
    #let g(s: 0cm, body) = [
      #grid(
        columns: (0.195cm, auto),
        column-gutter: 0.7cm,
        row-gutter: 0cm,
        [
        #rect(
          fill: self.colors.primary,
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
  ])
]

// https://tabler.io/icons

#let color-block(
  title,
  icon: none,
  spacing: 0.78em,
  color: none,
  color-body: tugcolors.lite,
  body
) = [
  #import "@preview/tableau-icons:0.331.0": *
  #touying-fn-wrapper((self: none) => [
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
        border-color: if color == none { self.colors.primary } else { color },
        title-color: if color == none { self.colors.primary } else { color },
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
  ])
]

//vim:tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab colorcolumn=81
