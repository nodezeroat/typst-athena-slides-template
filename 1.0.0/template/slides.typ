#import "@local/definitely-not-isec-slides:1.0.0": *

// ----------------------------------------------------------------------------
// Configuration
// ----------------------------------------------------------------------------
#show: slides.with(
  title: [ Long Paper Title #linebreak() with One to Three Lines],
  subtitle: [ An optional short subtitle ],
  authors: ( [*First Author*], [Second Author], [Third Author], ),
  date: [ 29th Jan 2025 ],
  footer: [ First Author ],
  extra: [ SomeConf 2025 ],
  progress: true,
)

= List

- First point...
- Second point...
  - Subpoint...
  - Subpoint...
- Third point...

= List and Figure

#grid(columns: (1fr, 1fr),
  [
    1. First point...
    2. Second point...
    3. Third point...
  ],
  [
    #rect(width: 95%, height: 60%)
  ]
)

#standout-slide[Standout slide]

#section-slide([Section Header], [Optional subtitle or figure])

= Blocks

#tblock([Color], color: colors.tugblue)[
  Highlighted content: _Emphasis_, a + _b_ = c, _n-dimensional_
]

#tblock([Alert Block])[
  Important content: _Alert_, a + _b_ = c
]

#tblock([Example Block], color: colors.tuggreen)[
  Example content
]

#block[
  #set align(horizon)

  #highlight[Highlight (main)] 
  #highlight(color: colors.tugblue)[Highlight (empth)]
  Normal text
  #comment[Minor comment]
]

= Color Palette

#v(-1.5cm)
#colors.showcase

= Lists with FontAwesome


Checklist:

- [x] Item 1
- [x] Item 2
- [ ] Item 3

Advantages and Disadvantages:

- [+] Advantage
- [-] Disadvantage
- [>] Conclusion

- this is a test

= Color Scheme for PGFplots: Lines

= Color Scheme for PGFplots: Fill

= Code Listings

Powered by codly:

```cpp
int main() {
  std::vector<int> test(50);
}
```

```sh
#!/bin/bash

exit 0
```

= Usable Area

#rect(width: 100%, height: 100%, fill: colors.tugmid)

= Acknowledgements

This is a test@emg25template

#bibliography("bibliography.bib")


