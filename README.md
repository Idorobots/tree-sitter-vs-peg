# TreeSitter vs hand-rolled PEG parser generator benchmark.

This repository contains a simple Lisp parser defined both in TreeSitter `grammar.js` (which is then loaded in Racket with FFI) and a custom PEG parser generator grammar (`peggen.rkt` with the specific parser found in `bench.rkt`). Both parsers use the same grammar rules, and support roughly the same features (maintaining source offsets etc).

The benchmark parses the `test.rkt` file concatenated 20 times with itself to compare the performance. To run it, you'll need `tree-sitter` and a `racket` distribution installed. Before running you will need to build the TreeSitter parser with make:

```
$ make
$ racket -t bench.rkt
```

Here are the results:

```
test/small.rkt duplicated (0 100 200 300 400 500 600 700 800 900 1000) times:
# lines:             0   4700   9400  14100  18800  23500  28200  32900  37600  42300  47000
TreeSitter:        0ms   48ms  141ms  173ms  210ms  250ms  295ms  347ms  393ms  488ms  396ms
PEG generator:     0ms  169ms  420ms  677ms  846ms 1124ms 1450ms 1442ms 1798ms 2167ms 2130ms

test/large.rkt duplicated (0 5 10 15 20 25 30 35 40 45 50) times:
# lines:             0   5230  10460  15690  20920  26150  31380  36610  41840  47070  52300
TreeSitter:        0ms   38ms   63ms  112ms  132ms  369ms  197ms  235ms  470ms  494ms  529ms
PEG generator:    19ms  121ms  260ms  457ms  590ms  774ms  960ms 1170ms 1463ms 1724ms 1930ms
```

The Racket-defined parser generator is about 3-4 times slower than natively-compiled TreeSitter parser and is considerably heavier on the GC as TreeSitter manages its own memory for the AST nodes.
