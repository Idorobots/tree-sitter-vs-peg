# TreeSitter vs hand-rolled PEG parser generator benchmark.

This repository contains a simple Lisp parser defined both in TreeSitter `grammar.js` (which is then loaded in Racket with FFI) and a custom PEG parser generator grammar (`peggen.rkt` with the specific parser found in `bench.rkt`). Both parsers use the same grammar rules, and support roughly the same features (maintaining source offsets etc).

The benchmark parses the `test.rkt` file concatenated 20 times with itself to compare the performance. To run it, you'll need `tree-sitter` and a `racket` distribution installed. Before running you will need to build the TreeSitter parser with make:

```
$ make
$ racket -t bench.rkt
```

Here are the results:

```
TreeSitter:    cpu time: 195 real time: 195 gc time: 63
PEG generator: cpu time: 634 real time: 636 gc time: 210

```

The Racket-defined parser generator is about 3-4 times slower than natively-compiled TreeSitter parser and is considerably heavier on the GC as TreeSitter manages its own memory for the AST nodes.
