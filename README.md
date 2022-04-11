# TreeSitter vs hand-rolled PEG parser generator benchmark.

This repository contains a simple Lisp parser defined both in TreeSitter `grammar.js` (which is then loaded in Racket with FFI) and a custom PEG parser generator grammar (`peggen.rkt` with the specific parser found in `bench.rkt`). Both parsers use the same grammar rules, and support roughly the same features (maintaining source offsets etc).

The benchmark parses the `test.rkt` file concatenated 20 times with itself to compare the performance. To run it, you'll need `tree-sitter` and a `racket` distribution installed. Before running you will need to build the TreeSitter parser with make:

```
$ make
$ racket -t bench.rkt
```

Here are the results:

```
test/nodes.rkt duplicated (0 500 1000 1500 2000 2500 3000 3500 4000 4500 5000) times:
# lines:             0   5000  10000  15000  20000  25000  30000  35000  40000  45000  50000
TreeSitter:        0ms   32ms   56ms   82ms  108ms  186ms  175ms  239ms  216ms  307ms  283ms
PEG generator:     0ms   65ms  132ms  211ms  291ms  427ms  443ms  622ms  591ms  758ms  733ms

test/small.rkt duplicated (0 100 200 300 400 500 600 700 800 900 1000) times:
# lines:             0   4700   9400  14100  18800  23500  28200  32900  37600  42300  47000
TreeSitter:        0ms   58ms  228ms  275ms  199ms  378ms  444ms  365ms  554ms  613ms  527ms
PEG generator:     5ms  172ms  358ms  648ms  743ms 1182ms 1341ms 1409ms 1788ms 2074ms 2075ms

test/large.rkt duplicated (0 5 10 15 20 25 30 35 40 45 50) times:
# lines:             0   5230  10460  15690  20920  26150  31380  36610  41840  47070  52300
TreeSitter:        0ms   38ms   76ms  116ms  216ms  198ms  444ms  273ms  538ms  572ms  633ms
PEG generator:    17ms  119ms  267ms  433ms  648ms  774ms  934ms 1171ms 1416ms 1629ms 1898ms
```
The Racket-defined parser generator is about 3-4 times slower than natively-compiled TreeSitter parser and is considerably heavier on the GC as TreeSitter manages its own memory for the AST nodes.
