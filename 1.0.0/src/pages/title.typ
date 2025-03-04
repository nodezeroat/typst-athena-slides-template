#import "@preview/polylux:0.4.0": *
#import "../colors.typ"

#let title-slide(title, subtitle, authors, extra) = [



	#let footer-isec = [
		#set text(size: 13.3pt, weight: "medium")

		#let arrow-icon = [
				#move(dy: -0.05cm, dx: -0.05cm,
					rotate(45deg,
						square(fill: none, size: 0.18cm, stroke: (
							"top": colors.tug + 1.35pt,
							"bottom": none,
							"right": colors.tug + 1.35pt,
							"left": none,
						))
					)
				)	
		]

		#v(0.4cm)
		#box(arrow-icon) #h(0.1cm) isec.tugraz.at
	]

	#set page(footer: footer-isec, header: none)
	#set block(below: 0pt, above: 0pt)

	#slide[

		#place(top + right, dy: -1.9cm, dx: 0.78cm,
			[
				#set align(right)
				#set text(size: 12pt, tracking: 3.6pt)

				#image("../assets/tuglogo.svg", width: 4.1cm)

				#v(0.13cm)

				#move(dx: -0.07cm)[
					SCIENCE
				]

				#v(0.65em)

				#move(dx: -0.03cm)[
					PASSION
				]

				#v(0.65em)

				#move(dx: -0.06cm)[
				TECHNOLOGY
				]

			]
		)


		#v(0.8cm)

		#block(width: 70%)[
			#let title = text(size: 40.5pt, weight: "bold")[#title]

			#move(dx: 0.04em)[
				#grid(columns: (0.195cm, auto), column-gutter: 0.7cm,
					context [
						#let s = measure(title)
						#move(dy: -0.4cm, rect(fill: colors.tug, height: s.height + 0.65cm))
					],
					title
				)
			]
		]

		#v(0.6cm)

		#block(width: 70%)[
			#text(size: 28.3pt, fill: colors.tug, weight: "bold")[#subtitle]
		]

		#v(1.48cm)

		#block(width: 70%)[
			#set text(size: 19pt)
			#for author in authors [
				#author #h(1.1em)
			]
		]

		#v(0.95cm)

		#block(width: 70%)[
			#extra
		]

	]

]
