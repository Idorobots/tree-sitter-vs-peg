# TreeSitter vs hand-rolled PEG parser generator benchmark.

This repository contains a simple Lisp parser defined both in TreeSitter `grammar.js` (which is then loaded in Racket with FFI) and a custom PEG parser generator grammar (`peggen.rkt` with the specific parser found in `bench.rkt`). Both parsers use the same grammar rules, and support roughly the same features (maintaining source offsets etc).

The benchmark parses the `test.rkt` file concatenated 20 times with itself to compare the performance. To run it, you'll need `tree-sitter` and a `racket` distribution installed. Before running you will need to build the TreeSitter parser with make:

```
$ make
$ raco exe -o bench bench.rkt
$ ./bench
```

Here are the results:

```
test/nodes.rkt duplicated (0 500 1000 1500 2000 2500 3000 3500 4000 4500 5000) times:
# lines:             0   5000  10000  15000  20000  25000  30000  35000  40000  45000  50000
TreeSitter:        0ms   23ms   48ms   74ms   94ms  122ms  149ms  168ms  210ms  218ms  249ms
PEG generator:     0ms   49ms  130ms  396ms  298ms  366ms  422ms  515ms  598ms  665ms  774ms

test/small.rkt duplicated (0 100 200 300 400 500 600 700 800 900 1000) times:
# lines:             0   4700   9400  14100  18800  23500  28200  32900  37600  42300  47000
TreeSitter:        0ms   44ms   92ms  144ms  192ms  243ms  339ms  394ms  453ms  519ms  610ms
PEG generator:     0ms  180ms  377ms  544ms  764ms  970ms 1132ms 2049ms 1603ms 2479ms 2029ms

test/large.rkt duplicated (0 5 10 15 20 25 30 35 40 45 50) times:
# lines:             0   5230  10460  15690  20920  26150  31380  36610  41840  47070  52300
TreeSitter:        0ms   34ms   68ms  107ms  139ms  192ms  231ms  275ms  315ms  349ms  385ms
PEG generator:     0ms  114ms  264ms  433ms  609ms  783ms  932ms 1105ms 1312ms 1465ms 1569ms
```
The Racket-defined parser generator is about 3-4 times slower than natively-compiled TreeSitter parser and is considerably heavier on the GC as TreeSitter manages its own memory for the AST nodes.
