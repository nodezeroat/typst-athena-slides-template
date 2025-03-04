#import "@preview/polylux:0.4.0": *
#import "../colors.typ"

#let outline-slide() = [

	#slide[
		= Outline
		#let outline = toolbox.all-sections((sections, _current) => {
			enum(..sections)
		})
		#outline.fields()
		#type(outline)
	]

]
