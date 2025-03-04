# Typst ISEC Slides Template

Quickstart (CLI):

> [!NOTE]
> This is temporary and the template will be upstreamed in Typst Universe so
> that not a single clone is needed

```sh
git clone git@github.com:ecomaikgolf/typst-isec-slides-template.git ~/.local/share/typst/packages/local/definitely-not-isec-slides/
typst init @preview/definitely-not-isec-slides:1.0.0 slides
```
Tested typst version: `0.13.0`.

## Typst

### What's Typst?

A modern typesetting system which has:

- Milisecond incremental (memoized) builds¹
- Subsecond full builds¹
- Multithreaded builds per pagebreak
- Easy rustc-like compiler error messages (and no intermediates!)
- Transparent multiple compiler passes (no more mklatex/makefiles)
- Simple & powerful scripting and syntax
- WebAssembly plugin support (python/js interpreters in your thesis? Sure)

Migrating from LaTeX? Check the [migration guide](https://typst.app/docs/guides/guide-for-latex-users/)

¹: This is obviously not a serious benchmark and depends on the document. But
   it's fast trust me

### Quick usage

Start incremental compilations with:

```sh
typst watch slides.typ
```

then open the generated PDF:

```sh
xdg-open slides.typ
```

Now edit `slides.typ` and it will be incrementally built in each save.

Incremental builds are blazingly fast, but regular PDF rendering (on the
viewer) is a bottleneck here. 

Use tinymist with neovim's `:TypstPreview` (or VSCode plugin), which uses the
browser to do PDF partial renderings and previews will be even more responsive.
No need for running `typst watch` now. It even has features like cursor sync,
click to jump, etc.

## Design

TODO

## Samples

TODO

## License `src/assets/tuglogo.svg`

According to Wikipedia:

> This logo image consists only of simple geometric shapes or text. It does not
> meet the threshold of originality needed for copyright protection, and is
> therefore in the public domain. [...]

https://en.m.wikipedia.org/wiki/File:TU_Graz.svg
