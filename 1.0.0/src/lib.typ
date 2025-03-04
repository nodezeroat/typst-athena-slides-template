#import "@preview/polylux:0.4.0": *
#import "@preview/codly:1.2.0": *
#import "@preview/showybox:2.0.4": showybox
#import "@preview/cheq:0.2.2": *
#import "@preview/fontawesome:0.5.0": *

#import "pages/title.typ": *
#import "pages/outline.typ": *
#import "colors.typ"

#let slides(
	title: none,
	subtitle: none,
	authors: none,
	date: none,
	footer: none,
	progress: true,
	extra: none,
	body
) = [


	#let get-heading(level: 1) = context {
		let ah = query(heading.where(level: level).after(here()))
		let bh = query(heading.where(level: level).before(here()))

		if ah.len() > 0 {
			let h = ah.first()
			if h.location().page() == here().page() {
				h.body
			} else {
				if bh.len() > 0 {
					let h = bh.last()
					h.body
				}
			}
		}
	}

	#show emph: it => {
		text(colors.tug, it.body)
	}

	// --------------------------------------------------------------------------
	// Text

	#set text(size: 20pt, lang: "en", region: "US", font: "Open Sans")
	
	// --------------------------------------------------------------------------
	// Page

	#set page(
		paper: "presentation-16-9",
		margin: (
			left:   1.49cm,
			right:  1.48cm,
			top:    2.6cm,
			bottom: 1.6cm,
		),
		header: [
				#set block(width: 100%)
				#set text(fill: black)

				#grid(columns: (auto, 25%), gutter: 0pt, align: top,
					block[
						#text(size: 24pt, weight: "semibold", get-heading())
					],
					block()[
						#align(top + right)[
							#v(-0.17cm)
							#move(dx: 0.27cm)[
								#text(size: 13.5pt, weight: "medium")[isec.tugraz.at]
								#h(0.1cm)
								#box(inset: 0pt, outset: 0pt)[#square(width: 0.3cm, height: 0.3cm, outset: 0pt, inset: 0pt, stroke: none, fill: colors.tug)]
							]
						]
					],
				)
		],
		footer: context [
			#let footer-body = [

				#set block(height: 100%, width: 100%)
				#set text(size: 15pt, fill: rgb("808080"))

				#grid(columns: (page.margin.bottom.length - 1.68%, 1.3%, auto, 2.5%),
							gutter: 0pt, align: horizon,
					block(fill: colors.tug)[
						#set align(center + horizon)
						#set text(fill: white, size: 12pt)
						#toolbox.slide-number
					],
					block(),
					block[
						#set align(left + horizon)
						#set text(size: 13pt)
						#footer
					],
					block(),
				)
			]

			#let progress-body = [
				#set block(height: 2pt, width: 100%)
				#toolbox.progress-ratio(ratio => {
					grid(
						columns: (ratio * 100%, 1fr), gutter: 0pt,
						block(fill: colors.tug),
						block(fill: colors.tug),
					)
				})
			]

			#show: toolbox.full-width-block[
				#stack(dir: ttb, 
					block(height: 100%, footer-body),
					if progress { place(float: true, bottom)[#progress-body] }
				)
			]
		],
	)

	// --------------------------------------------------------------------------
	// Enumerate and listing

	#let default-map = (
		"x": text(fill: colors.tuggreen, fa-square-check()),
		" ": text(fill: colors.tuggray, fa-square()),
		"+": text(fill: colors.tuggreen, fa-plus-circle()),
		"-": text(fill: colors.tug, fa-minus-circle()),
		">": text(fill: colors.tugblue, fa-arrow-circle-right()),
	)


	// TODO not a big fan of doing this one
	#show: checklist.with(
		marker-map: default-map,
		show-list-set-block: (above: 0.7em, below: 0.7em),
		radius: 0pt,
	)

	// TODO improve

	#set list(indent: 0.48cm, body-indent: 1.2em, spacing: 0.4cm)
	#set list(marker: ( 
		(move(dy: 0.11cm, square(width: 0.4em, height: 0.4em, fill: colors.tug))),
		(move(dy: 0.11cm, square(width: 0.4em, height: 0.4em, fill: black))),
		(move(dy: 0.11cm, square(width: 0.4em, height: 0.4em, fill: gray))),
	))

	//#show list.item.where(level: 1): set text(size: 10pt)

	#set enum(numbering: n => [
		#square(stroke: none, fill: colors.tug)[
			#align(center)[
				#text(fill: white)[#n]
			]
		]
	])

	// --------------------------------------------------------------------------
	// Code listings

	#show raw.where(block: true): set text(size: 13pt)

	#show: codly-init.with()
	#codly(
		display-name: false,
		display-icon: false,
		radius: 0pt,
		stroke: 1pt + black,
		smart-indent: true,
		zebra-fill: luma(240),
		number-format: (number) => [#text(size: 12pt, fill: gray)[#number]],
		number-align: right + horizon,
		breakable: true)

	// --------------------------------------------------------------------------
	// Bibliography

	#set bibliography(title: "Bibliography", style: "ieee")
	#set cite(style: "alphanumeric")
	#show bibliography: set par(spacing: 0.4cm)
	#show bibliography: set grid(align: top + left)
	#show bibliography: set text(17pt)
	#show bibliography: t => {
		show grid.cell.where(x: 0): set text(fill: colors.tug)
		show grid.cell.where(x: 0): set align(top + left)
		show link: set text(fill: colors.tuggray)
		t
	}

	// --------------------------------------------------------------------------
	// Page
	#show heading.where(level: 1): it => [
		#slide[
			// Hack to show the slides even if empty
			#place(left + top, hide(square(width: 0pt, height: 0pt)))
		]
	]

	#title-slide(title, subtitle, authors, extra)

	#counter("logical-slide").update(0)
	#set align(horizon)

	#body
]

// Standout slides don't count as real slides in the official template
#let standout-slide(body) = [
	#set page(footer: none, header: none)
	#set align(center)
	#set text(size: 28pt)
	#move(dy: -2.08cm)[
		#body
	]
]

#let section-slide(section, subtitle) = [
	#set page(footer: none, header: none)
	#set align(center)

	#slide[
		#move(dy: -0.3cm)[
			#text(size: 36pt)[#section]

			#v(-0.2cm)
			#text(size: 20pt)[#subtitle]
		]
	]
]

#let blank-slide(body) = [
	#set page(footer: none, header: none, margin: 0pt)
	#set align(center)

	#slide[
		#body
	]
]

#let highlight(color: colors.tug, fill: white, body) = [
	#box[
		#rect(fill: color, inset: (x: 0.2em, y: 0.4em))[
			#set text(fill: fill)
			#body
		]
	]
]

#let comment(body) = [
	#set text(fill: colors.tuggray, size: 16pt)
	#body
]

#let tblock(title, body, color: colors.tug, color-body: colors.lite) = [

	#show emph: it => {
		text(weight: "medium", fill: color, it.body)
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
			above: 0.78em,
			below: 0.78em,
			title: title,
			body
		)
]

//vim:tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab colorcolumn=81
