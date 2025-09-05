// TUGraz
#let tug     = rgb("e4154b")
#let isec    = rgb("272733")
#let foot    = rgb("e1e1e1")
#let web     = rgb("0c5a77")

// Faculties
#let csbme   = rgb("19b4e3")
#let arch    = rgb("0a98a2") 
#let bauw    = rgb("d68e23") 
#let etec    = rgb("68242c")
#let mach    = rgb("3066ba")
#let chem    = rgb("5e60a8")
#let math    = rgb("1e6934")

// ISEC research areas
#let crypto  = rgb("a6c947")
#let system  = rgb("1171a8")
#let formal  = rgb("f7931e")
#let applied = rgb("7d219e") 

// Powerpoint palette
#let page    = tug
#let fore    = rgb("0f0f0f") 
#let back    = rgb("ffffff")
#let dark    = rgb("3b5a70")
#let lite    = rgb("eeece1")
#let head    = rgb("245b78")
#let body    = rgb("e2e9ed")
#let urlA    = rgb("0066d8")
#let urlB    = rgb("6c2f91")
#let colA    = tug
#let colB    = rgb("5191c1")
#let colC    = rgb("a5a5a5")
#let colD    = rgb("285f82")
#let colE    = rgb("78b473")
#let colF    = rgb("e59352")


#let tugred = colA
#let tuggreen = colE
#let tugblue = colD
#let tugyellow = colF
#let tugcyan = csbme
#let tugpurple = applied
#let tugviolet = chem
#let tugmagenta = tugpurple
#let tugturquoise = arch
#let tugbrown = etec
#let tugblack = fore
#let tugwhite = back
#let tuggray = colC
#let tuggrey = tuggray
#let tugdark = dark
#let tugmid = colB
#let tuglite = lite

#let main = tug
#let head = isec
#let emph = colD
#let standout = head

#let showcase = [
  #set rect(width: 7.4cm, height: 1.5cm)
  #set text(fill: white)
	#set align(center)
  #grid(columns: 3, rows: 6, column-gutter: 1.8cm, row-gutter: 0.05cm, align: left,
    rect(fill: isec)[isec],
    rect(fill: tug)[tug = main],
    rect(fill: colA)[colA = tugred],
    rect(fill: csbme)[csbme = tugcyan],
    rect(fill: fore)[fore],
    rect(fill: colB)[colB = tugmid],
    rect(fill: crypto)[crypto],
    rect(fill: back)[#text(fill: black)[back]],
    rect(fill: colC)[colC = tuggray],
    rect(fill: system)[system],
    rect(fill: foot)[#text(fill: black)[foot]],
    rect(fill: colD)[colD = tugblue],
    rect(fill: formal)[formal],
    rect(fill: emph)[emph],
    rect(fill: colE)[colE = tuggreen],
    rect(fill: applied)[applied = tugpurple],
    rect(fill: lite)[#text(fill: black)[lite]],
    rect(fill: colF)[colF = tugyellow],
  )
]
