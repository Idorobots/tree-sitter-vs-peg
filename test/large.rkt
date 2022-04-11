#lang racket

(define Sexps
  (let ((cache8347329 (make-hasheq))
        (cache8347330 (make-hasheq))
        (cache8347331 (make-hasheq))
        (cache8347332 (make-hasheq))
        (cache8347333 (make-hasheq))
        (cache8347334 (make-hasheq))
        (cache8347335 (make-hasheq))
        (cache8347336 (make-hasheq))
        (cache8347337 (make-hasheq))
        (cache8347338 (make-hasheq)))
    (letrec ((Sexps
              (lambda (input8347339 offset8347340)
                (if (hash-has-key? cache8347329 offset8347340)
                    (hash-ref! cache8347329 offset8347340 '())
                    (let ((result8347351
                           (let loop8347344 ((matches8347343 '())
                                             (end8347342 offset8347340))
                             (let ((result8347341
                                    (let ((result8347350
                                           (Quote input8347339 end8347342)))
                                      (if (matches? result8347350)
                                          result8347350
                                          (let ((result8347349
                                                 (List input8347339 end8347342)))
                                            (if (matches? result8347349)
                                                result8347349
                                                (let ((result8347348
                                                       (String
                                                        input8347339
                                                        end8347342)))
                                                  (if (matches? result8347348)
                                                      result8347348
                                                      (let ((result8347345
                                                             (let ((result8347347
                                                                    (Number
                                                                     input8347339
                                                                     end8347342)))
                                                               (if (matches?
                                                                    result8347347)
                                                                   result8347347
                                                                   (let ((result8347346
                                                                          (Symbol
                                                                           input8347339
                                                                           end8347342)))
                                                                     (if (matches?
                                                                          result8347346)
                                                                         result8347346
                                                                         (no-match)))))))
                                                        (if (matches? result8347345)
                                                            result8347345
                                                            (no-match)))))))))))
                               (if (matches? result8347341)
                                   (loop8347344
                                    (cons
                                     (match-match result8347341)
                                     matches8347343)
                                    (match-end result8347341))
                                   (matches
                                    (reverse matches8347343)
                                    offset8347340
                                    end8347342))))))
                      (hash-set! cache8347329 offset8347340 result8347351)
                      result8347351))))
             (Sexp
              (lambda (input8347352 offset8347353)
                (if (hash-has-key? cache8347330 offset8347353)
                    (hash-ref! cache8347330 offset8347353 '())
                    (let ((result8347360
                           (let ((result8347359
                                  (Quote input8347352 offset8347353)))
                             (if (matches? result8347359)
                                 result8347359
                                 (let ((result8347358
                                        (List input8347352 offset8347353)))
                                   (if (matches? result8347358)
                                       result8347358
                                       (let ((result8347357
                                              (String input8347352 offset8347353)))
                                         (if (matches? result8347357)
                                             result8347357
                                             (let ((result8347354
                                                    (let ((result8347356
                                                           (Number
                                                            input8347352
                                                            offset8347353)))
                                                      (if (matches? result8347356)
                                                          result8347356
                                                          (let ((result8347355
                                                                 (Symbol
                                                                  input8347352
                                                                  offset8347353)))
                                                            (if (matches? result8347355)
                                                                result8347355
                                                                (no-match)))))))
                                               (if (matches? result8347354)
                                                   result8347354
                                                   (no-match)))))))))))
                      (hash-set! cache8347330 offset8347353 result8347360)
                      result8347360))))
             (Quote
              (lambda (input8347361 offset8347362)
                (if (hash-has-key? cache8347331 offset8347362)
                    (hash-ref! cache8347331 offset8347362 '())
                    (let ((result8347393
                           (let ((result8347392
                                  (let ((result8347363
                                         (let ((result8347376
                                                (let loop8347369 ((matches8347368
                                                                   '())
                                                                  (end8347367
                                                                   offset8347362))
                                                  (let ((result8347366
                                                         (let ((result8347374
                                                                (let ((result8347375
                                                                       (regexp-match
                                                                        "^[ \t\v\r\n]+"
                                                                        input8347361
                                                                        end8347367)))
                                                                  (if result8347375
                                                                      (matches
                                                                       (car
                                                                        result8347375)
                                                                       end8347367
                                                                       (+
                                                                        end8347367
                                                                        (string-length
                                                                         (car
                                                                          result8347375))))
                                                                      (no-match)))))
                                                           (if (matches?
                                                                result8347374)
                                                               result8347374
                                                               (let ((result8347370
                                                                      (let ((result8347372
                                                                             (let ((result8347371
                                                                                    (regexp-match
                                                                                     "^;[^\n]*"
                                                                                     input8347361
                                                                                     end8347367)))
                                                                               (if result8347371
                                                                                   (matches
                                                                                    (car
                                                                                     result8347371)
                                                                                    end8347367
                                                                                    (+
                                                                                     end8347367
                                                                                     (string-length
                                                                                      (car
                                                                                       result8347371))))
                                                                                   (no-match)))))
                                                                        (if (matches?
                                                                             result8347372)
                                                                            (let ((end8347373
                                                                                   (match-end
                                                                                    result8347372)))
                                                                              (matches
                                                                               '()
                                                                               end8347373
                                                                               end8347373))
                                                                            (no-match)))))
                                                                 (if (matches?
                                                                      result8347370)
                                                                     result8347370
                                                                     (no-match)))))))
                                                    (if (matches? result8347366)
                                                        (loop8347369
                                                         (cons
                                                          (match-match
                                                           result8347366)
                                                          matches8347368)
                                                         (match-end
                                                          result8347366))
                                                        (matches
                                                         (reverse matches8347368)
                                                         offset8347362
                                                         end8347367))))))
                                           (if (matches? result8347376)
                                               (let ((end8347377
                                                      (match-end result8347376)))
                                                 (matches
                                                  '()
                                                  end8347377
                                                  end8347377))
                                               (no-match)))))
                                    (if (matches? result8347363)
                                        (let ((match8347364
                                               (match-match result8347363))
                                              (end8347365
                                               (match-end result8347363)))
                                          (let ((result8347378
                                                 (let ((result8347381
                                                        (if (and (<
                                                                  end8347365
                                                                  (string-length
                                                                   input8347361))
                                                                 (equal?
                                                                  (string-ref
                                                                   input8347361
                                                                   end8347365)
                                                                  "'"))
                                                            (matches
                                                             "'"
                                                             end8347365
                                                             (+ 1 end8347365))
                                                            (no-match))))
                                                   (if (matches? result8347381)
                                                       (let ((end8347382
                                                              (match-end
                                                               result8347381)))
                                                         (matches
                                                          '()
                                                          end8347382
                                                          end8347382))
                                                       (no-match)))))
                                            (if (matches? result8347378)
                                                (let ((match8347379
                                                       (match-match result8347378))
                                                      (end8347380
                                                       (match-end result8347378)))
                                                  (let ((result8347383
                                                         (let ((result8347391
                                                                (Quote
                                                                 input8347361
                                                                 end8347380)))
                                                           (if (matches?
                                                                result8347391)
                                                               result8347391
                                                               (let ((result8347390
                                                                      (List
                                                                       input8347361
                                                                       end8347380)))
                                                                 (if (matches?
                                                                      result8347390)
                                                                     result8347390
                                                                     (let ((result8347389
                                                                            (String
                                                                             input8347361
                                                                             end8347380)))
                                                                       (if (matches?
                                                                            result8347389)
                                                                           result8347389
                                                                           (let ((result8347386
                                                                                  (let ((result8347388
                                                                                         (Number
                                                                                          input8347361
                                                                                          end8347380)))
                                                                                    (if (matches?
                                                                                         result8347388)
                                                                                        result8347388
                                                                                        (let ((result8347387
                                                                                               (Symbol
                                                                                                input8347361
                                                                                                end8347380)))
                                                                                          (if (matches?
                                                                                               result8347387)
                                                                                              result8347387
                                                                                              (no-match)))))))
                                                                             (if (matches?
                                                                                  result8347386)
                                                                                 result8347386
                                                                                 (no-match)))))))))))
                                                    (if (matches? result8347383)
                                                        (let ((match8347384
                                                               (match-match
                                                                result8347383))
                                                              (end8347385
                                                               (match-end
                                                                result8347383)))
                                                          (matches
                                                           (list
                                                            match8347364
                                                            match8347379
                                                            match8347384)
                                                           offset8347362
                                                           end8347385))
                                                        (no-match))))
                                                (no-match))))
                                        (no-match)))))
                             (if (matches? result8347392)
                                 (noop input8347361 result8347392)
                                 result8347392))))
                      (hash-set! cache8347331 offset8347362 result8347393)
                      result8347393))))
             (List
              (lambda (input8347394 offset8347395)
                (if (hash-has-key? cache8347332 offset8347395)
                    (hash-ref! cache8347332 offset8347395 '())
                    (let ((result8347431
                           (let ((result8347430
                                  (let ((result8347396
                                         (let ((result8347409
                                                (let loop8347402 ((matches8347401
                                                                   '())
                                                                  (end8347400
                                                                   offset8347395))
                                                  (let ((result8347399
                                                         (let ((result8347407
                                                                (let ((result8347408
                                                                       (regexp-match
                                                                        "^[ \t\v\r\n]+"
                                                                        input8347394
                                                                        end8347400)))
                                                                  (if result8347408
                                                                      (matches
                                                                       (car
                                                                        result8347408)
                                                                       end8347400
                                                                       (+
                                                                        end8347400
                                                                        (string-length
                                                                         (car
                                                                          result8347408))))
                                                                      (no-match)))))
                                                           (if (matches?
                                                                result8347407)
                                                               result8347407
                                                               (let ((result8347403
                                                                      (let ((result8347405
                                                                             (let ((result8347404
                                                                                    (regexp-match
                                                                                     "^;[^\n]*"
                                                                                     input8347394
                                                                                     end8347400)))
                                                                               (if result8347404
                                                                                   (matches
                                                                                    (car
                                                                                     result8347404)
                                                                                    end8347400
                                                                                    (+
                                                                                     end8347400
                                                                                     (string-length
                                                                                      (car
                                                                                       result8347404))))
                                                                                   (no-match)))))
                                                                        (if (matches?
                                                                             result8347405)
                                                                            (let ((end8347406
                                                                                   (match-end
                                                                                    result8347405)))
                                                                              (matches
                                                                               '()
                                                                               end8347406
                                                                               end8347406))
                                                                            (no-match)))))
                                                                 (if (matches?
                                                                      result8347403)
                                                                     result8347403
                                                                     (no-match)))))))
                                                    (if (matches? result8347399)
                                                        (loop8347402
                                                         (cons
                                                          (match-match
                                                           result8347399)
                                                          matches8347401)
                                                         (match-end
                                                          result8347399))
                                                        (matches
                                                         (reverse matches8347401)
                                                         offset8347395
                                                         end8347400))))))
                                           (if (matches? result8347409)
                                               (let ((end8347410
                                                      (match-end result8347409)))
                                                 (matches
                                                  '()
                                                  end8347410
                                                  end8347410))
                                               (no-match)))))
                                    (if (matches? result8347396)
                                        (let ((match8347397
                                               (match-match result8347396))
                                              (end8347398
                                               (match-end result8347396)))
                                          (let ((result8347411
                                                 (if (and (<
                                                           end8347398
                                                           (string-length
                                                            input8347394))
                                                          (equal?
                                                           (string-ref
                                                            input8347394
                                                            end8347398)
                                                           "("))
                                                     (matches
                                                      "("
                                                      end8347398
                                                      (+ 1 end8347398))
                                                     (no-match))))
                                            (if (matches? result8347411)
                                                (let ((match8347412
                                                       (match-match result8347411))
                                                      (end8347413
                                                       (match-end result8347411)))
                                                  (let ((result8347414
                                                         (let loop8347420 ((matches8347419
                                                                            '())
                                                                           (end8347418
                                                                            end8347413))
                                                           (let ((result8347417
                                                                  (let ((result8347426
                                                                         (Quote
                                                                          input8347394
                                                                          end8347418)))
                                                                    (if (matches?
                                                                         result8347426)
                                                                        result8347426
                                                                        (let ((result8347425
                                                                               (List
                                                                                input8347394
                                                                                end8347418)))
                                                                          (if (matches?
                                                                               result8347425)
                                                                              result8347425
                                                                              (let ((result8347424
                                                                                     (String
                                                                                      input8347394
                                                                                      end8347418)))
                                                                                (if (matches?
                                                                                     result8347424)
                                                                                    result8347424
                                                                                    (let ((result8347421
                                                                                           (let ((result8347423
                                                                                                  (Number
                                                                                                   input8347394
                                                                                                   end8347418)))
                                                                                             (if (matches?
                                                                                                  result8347423)
                                                                                                 result8347423
                                                                                                 (let ((result8347422
                                                                                                        (Symbol
                                                                                                         input8347394
                                                                                                         end8347418)))
                                                                                                   (if (matches?
                                                                                                        result8347422)
                                                                                                       result8347422
                                                                                                       (no-match)))))))
                                                                                      (if (matches?
                                                                                           result8347421)
                                                                                          result8347421
                                                                                          (no-match)))))))))))
                                                             (if (matches?
                                                                  result8347417)
                                                                 (loop8347420
                                                                  (cons
                                                                   (match-match
                                                                    result8347417)
                                                                   matches8347419)
                                                                  (match-end
                                                                   result8347417))
                                                                 (matches
                                                                  (reverse
                                                                   matches8347419)
                                                                  end8347413
                                                                  end8347418))))))
                                                    (if (matches? result8347414)
                                                        (let ((match8347415
                                                               (match-match
                                                                result8347414))
                                                              (end8347416
                                                               (match-end
                                                                result8347414)))
                                                          (let ((result8347427
                                                                 (if (and (<
                                                                           end8347416
                                                                           (string-length
                                                                            input8347394))
                                                                          (equal?
                                                                           (string-ref
                                                                            input8347394
                                                                            end8347416)
                                                                           ")"))
                                                                     (matches
                                                                      ")"
                                                                      end8347416
                                                                      (+ 1 end8347416))
                                                                     (no-match))))
                                                            (if (matches?
                                                                 result8347427)
                                                                (let ((match8347428
                                                                       (match-match
                                                                        result8347427))
                                                                      (end8347429
                                                                       (match-end
                                                                        result8347427)))
                                                                  (matches
                                                                   (list
                                                                    match8347397
                                                                    match8347412
                                                                    match8347415
                                                                    match8347428)
                                                                   offset8347395
                                                                   end8347429))
                                                                (no-match))))
                                                        (no-match))))
                                                (no-match))))
                                        (no-match)))))
                             (if (matches? result8347430)
                                 (noop input8347394 result8347430)
                                 result8347430))))
                      (hash-set! cache8347332 offset8347395 result8347431)
                      result8347431))))
             (String
              (lambda (input8347432 offset8347433)
                (if (hash-has-key? cache8347333 offset8347433)
                    (hash-ref! cache8347333 offset8347433 '())
                    (let ((result8347460
                           (let ((result8347459
                                  (let ((result8347434
                                         (let ((result8347447
                                                (let loop8347440 ((matches8347439
                                                                   '())
                                                                  (end8347438
                                                                   offset8347433))
                                                  (let ((result8347437
                                                         (let ((result8347445
                                                                (let ((result8347446
                                                                       (regexp-match
                                                                        "^[ \t\v\r\n]+"
                                                                        input8347432
                                                                        end8347438)))
                                                                  (if result8347446
                                                                      (matches
                                                                       (car
                                                                        result8347446)
                                                                       end8347438
                                                                       (+
                                                                        end8347438
                                                                        (string-length
                                                                         (car
                                                                          result8347446))))
                                                                      (no-match)))))
                                                           (if (matches?
                                                                result8347445)
                                                               result8347445
                                                               (let ((result8347441
                                                                      (let ((result8347443
                                                                             (let ((result8347442
                                                                                    (regexp-match
                                                                                     "^;[^\n]*"
                                                                                     input8347432
                                                                                     end8347438)))
                                                                               (if result8347442
                                                                                   (matches
                                                                                    (car
                                                                                     result8347442)
                                                                                    end8347438
                                                                                    (+
                                                                                     end8347438
                                                                                     (string-length
                                                                                      (car
                                                                                       result8347442))))
                                                                                   (no-match)))))
                                                                        (if (matches?
                                                                             result8347443)
                                                                            (let ((end8347444
                                                                                   (match-end
                                                                                    result8347443)))
                                                                              (matches
                                                                               '()
                                                                               end8347444
                                                                               end8347444))
                                                                            (no-match)))))
                                                                 (if (matches?
                                                                      result8347441)
                                                                     result8347441
                                                                     (no-match)))))))
                                                    (if (matches? result8347437)
                                                        (loop8347440
                                                         (cons
                                                          (match-match
                                                           result8347437)
                                                          matches8347439)
                                                         (match-end
                                                          result8347437))
                                                        (matches
                                                         (reverse matches8347439)
                                                         offset8347433
                                                         end8347438))))))
                                           (if (matches? result8347447)
                                               (let ((end8347448
                                                      (match-end result8347447)))
                                                 (matches
                                                  '()
                                                  end8347448
                                                  end8347448))
                                               (no-match)))))
                                    (if (matches? result8347434)
                                        (let ((match8347435
                                               (match-match result8347434))
                                              (end8347436
                                               (match-end result8347434)))
                                          (let ((result8347449
                                                 (if (and (<
                                                           end8347436
                                                           (string-length
                                                            input8347432))
                                                          (equal?
                                                           (string-ref
                                                            input8347432
                                                            end8347436)
                                                           "FIXME"))
                                                     (matches
                                                      "FIXME"
                                                      end8347436
                                                      (+ 1 end8347436))
                                                     (no-match))))
                                            (if (matches? result8347449)
                                                (let ((match8347450
                                                       (match-match result8347449))
                                                      (end8347451
                                                       (match-end result8347449)))
                                                  (let ((result8347452
                                                         (let ((result8347455
                                                                (regexp-match
                                                                 "^[^FIXME]*"
                                                                 input8347432
                                                                 end8347451)))
                                                           (if result8347455
                                                               (matches
                                                                (car result8347455)
                                                                end8347451
                                                                (+
                                                                 end8347451
                                                                 (string-length
                                                                  (car
                                                                   result8347455))))
                                                               (no-match)))))
                                                    (if (matches? result8347452)
                                                        (let ((match8347453
                                                               (match-match
                                                                result8347452))
                                                              (end8347454
                                                               (match-end
                                                                result8347452)))
                                                          (let ((result8347456
                                                                 (if (and (<
                                                                           end8347454
                                                                           (string-length
                                                                            input8347432))
                                                                          (equal?
                                                                           (string-ref
                                                                            input8347432
                                                                            end8347454)
                                                                           "FIXME"))
                                                                     (matches
                                                                      "FIXME"
                                                                      end8347454
                                                                      (+ 1 end8347454))
                                                                     (no-match))))
                                                            (if (matches?
                                                                 result8347456)
                                                                (let ((match8347457
                                                                       (match-match
                                                                        result8347456))
                                                                      (end8347458
                                                                       (match-end
                                                                        result8347456)))
                                                                  (matches
                                                                   (list
                                                                    match8347435
                                                                    match8347450
                                                                    match8347453
                                                                    match8347457)
                                                                   offset8347433
                                                                   end8347458))
                                                                (no-match))))
                                                        (no-match))))
                                                (no-match))))
                                        (no-match)))))
                             (if (matches? result8347459)
                                 (noop input8347432 result8347459)
                                 result8347459))))
                      (hash-set! cache8347333 offset8347433 result8347460)
                      result8347460))))
             (Atom
              (lambda (input8347461 offset8347462)
                (if (hash-has-key? cache8347334 offset8347462)
                    (hash-ref! cache8347334 offset8347462 '())
                    (let ((result8347465
                           (let ((result8347464
                                  (Number input8347461 offset8347462)))
                             (if (matches? result8347464)
                                 result8347464
                                 (let ((result8347463
                                        (Symbol input8347461 offset8347462)))
                                   (if (matches? result8347463)
                                       result8347463
                                       (no-match)))))))
                      (hash-set! cache8347334 offset8347462 result8347465)
                      result8347465))))
             (Number
              (lambda (input8347466 offset8347467)
                (if (hash-has-key? cache8347335 offset8347467)
                    (hash-ref! cache8347335 offset8347467 '())
                    (let ((result8347488
                           (let ((result8347487
                                  (let ((result8347468
                                         (let ((result8347481
                                                (let loop8347474 ((matches8347473
                                                                   '())
                                                                  (end8347472
                                                                   offset8347467))
                                                  (let ((result8347471
                                                         (let ((result8347479
                                                                (let ((result8347480
                                                                       (regexp-match
                                                                        "^[ \t\v\r\n]+"
                                                                        input8347466
                                                                        end8347472)))
                                                                  (if result8347480
                                                                      (matches
                                                                       (car
                                                                        result8347480)
                                                                       end8347472
                                                                       (+
                                                                        end8347472
                                                                        (string-length
                                                                         (car
                                                                          result8347480))))
                                                                      (no-match)))))
                                                           (if (matches?
                                                                result8347479)
                                                               result8347479
                                                               (let ((result8347475
                                                                      (let ((result8347477
                                                                             (let ((result8347476
                                                                                    (regexp-match
                                                                                     "^;[^\n]*"
                                                                                     input8347466
                                                                                     end8347472)))
                                                                               (if result8347476
                                                                                   (matches
                                                                                    (car
                                                                                     result8347476)
                                                                                    end8347472
                                                                                    (+
                                                                                     end8347472
                                                                                     (string-length
                                                                                      (car
                                                                                       result8347476))))
                                                                                   (no-match)))))
                                                                        (if (matches?
                                                                             result8347477)
                                                                            (let ((end8347478
                                                                                   (match-end
                                                                                    result8347477)))
                                                                              (matches
                                                                               '()
                                                                               end8347478
                                                                               end8347478))
                                                                            (no-match)))))
                                                                 (if (matches?
                                                                      result8347475)
                                                                     result8347475
                                                                     (no-match)))))))
                                                    (if (matches? result8347471)
                                                        (loop8347474
                                                         (cons
                                                          (match-match
                                                           result8347471)
                                                          matches8347473)
                                                         (match-end
                                                          result8347471))
                                                        (matches
                                                         (reverse matches8347473)
                                                         offset8347467
                                                         end8347472))))))
                                           (if (matches? result8347481)
                                               (let ((end8347482
                                                      (match-end result8347481)))
                                                 (matches
                                                  '()
                                                  end8347482
                                                  end8347482))
                                               (no-match)))))
                                    (if (matches? result8347468)
                                        (let ((match8347469
                                               (match-match result8347468))
                                              (end8347470
                                               (match-end result8347468)))
                                          (let ((result8347483
                                                 (let ((result8347486
                                                        (regexp-match
                                                         "^[0-9]+(\\.[0-9]+)?"
                                                         input8347466
                                                         end8347470)))
                                                   (if result8347486
                                                       (matches
                                                        (car result8347486)
                                                        end8347470
                                                        (+
                                                         end8347470
                                                         (string-length
                                                          (car result8347486))))
                                                       (no-match)))))
                                            (if (matches? result8347483)
                                                (let ((match8347484
                                                       (match-match result8347483))
                                                      (end8347485
                                                       (match-end result8347483)))
                                                  (matches
                                                   (list match8347469 match8347484)
                                                   offset8347467
                                                   end8347485))
                                                (no-match))))
                                        (no-match)))))
                             (if (matches? result8347487)
                                 (noop input8347466 result8347487)
                                 result8347487))))
                      (hash-set! cache8347335 offset8347467 result8347488)
                      result8347488))))
             (Symbol
              (lambda (input8347489 offset8347490)
                (if (hash-has-key? cache8347336 offset8347490)
                    (hash-ref! cache8347336 offset8347490 '())
                    (let ((result8347511
                           (let ((result8347510
                                  (let ((result8347491
                                         (let ((result8347504
                                                (let loop8347497 ((matches8347496
                                                                   '())
                                                                  (end8347495
                                                                   offset8347490))
                                                  (let ((result8347494
                                                         (let ((result8347502
                                                                (let ((result8347503
                                                                       (regexp-match
                                                                        "^[ \t\v\r\n]+"
                                                                        input8347489
                                                                        end8347495)))
                                                                  (if result8347503
                                                                      (matches
                                                                       (car
                                                                        result8347503)
                                                                       end8347495
                                                                       (+
                                                                        end8347495
                                                                        (string-length
                                                                         (car
                                                                          result8347503))))
                                                                      (no-match)))))
                                                           (if (matches?
                                                                result8347502)
                                                               result8347502
                                                               (let ((result8347498
                                                                      (let ((result8347500
                                                                             (let ((result8347499
                                                                                    (regexp-match
                                                                                     "^;[^\n]*"
                                                                                     input8347489
                                                                                     end8347495)))
                                                                               (if result8347499
                                                                                   (matches
                                                                                    (car
                                                                                     result8347499)
                                                                                    end8347495
                                                                                    (+
                                                                                     end8347495
                                                                                     (string-length
                                                                                      (car
                                                                                       result8347499))))
                                                                                   (no-match)))))
                                                                        (if (matches?
                                                                             result8347500)
                                                                            (let ((end8347501
                                                                                   (match-end
                                                                                    result8347500)))
                                                                              (matches
                                                                               '()
                                                                               end8347501
                                                                               end8347501))
                                                                            (no-match)))))
                                                                 (if (matches?
                                                                      result8347498)
                                                                     result8347498
                                                                     (no-match)))))))
                                                    (if (matches? result8347494)
                                                        (loop8347497
                                                         (cons
                                                          (match-match
                                                           result8347494)
                                                          matches8347496)
                                                         (match-end
                                                          result8347494))
                                                        (matches
                                                         (reverse matches8347496)
                                                         offset8347490
                                                         end8347495))))))
                                           (if (matches? result8347504)
                                               (let ((end8347505
                                                      (match-end result8347504)))
                                                 (matches
                                                  '()
                                                  end8347505
                                                  end8347505))
                                               (no-match)))))
                                    (if (matches? result8347491)
                                        (let ((match8347492
                                               (match-match result8347491))
                                              (end8347493
                                               (match-end result8347491)))
                                          (let ((result8347506
                                                 (let ((result8347509
                                                        (regexp-match
                                                         "^[_@#a-zA-Z0-9:=><+*-/]+"
                                                         input8347489
                                                         end8347493)))
                                                   (if result8347509
                                                       (matches
                                                        (car result8347509)
                                                        end8347493
                                                        (+
                                                         end8347493
                                                         (string-length
                                                          (car result8347509))))
                                                       (no-match)))))
                                            (if (matches? result8347506)
                                                (let ((match8347507
                                                       (match-match result8347506))
                                                      (end8347508
                                                       (match-end result8347506)))
                                                  (matches
                                                   (list match8347492 match8347507)
                                                   offset8347490
                                                   end8347508))
                                                (no-match))))
                                        (no-match)))))
                             (if (matches? result8347510)
                                 (noop input8347489 result8347510)
                                 result8347510))))
                      (hash-set! cache8347336 offset8347490 result8347511)
                      result8347511))))
             (Spacing
              (lambda (input8347512 offset8347513)
                (if (hash-has-key? cache8347337 offset8347513)
                    (hash-ref! cache8347337 offset8347513 '())
                    (let ((result8347526
                           (let ((result8347524
                                  (let loop8347517 ((matches8347516 '())
                                                    (end8347515 offset8347513))
                                    (let ((result8347514
                                           (let ((result8347522
                                                  (let ((result8347523
                                                         (regexp-match
                                                          "^[ \t\v\r\n]+"
                                                          input8347512
                                                          end8347515)))
                                                    (if result8347523
                                                        (matches
                                                         (car result8347523)
                                                         end8347515
                                                         (+
                                                          end8347515
                                                          (string-length
                                                           (car result8347523))))
                                                        (no-match)))))
                                             (if (matches? result8347522)
                                                 result8347522
                                                 (let ((result8347518
                                                        (let ((result8347520
                                                               (let ((result8347519
                                                                      (regexp-match
                                                                       "^;[^\n]*"
                                                                       input8347512
                                                                       end8347515)))
                                                                 (if result8347519
                                                                     (matches
                                                                      (car
                                                                       result8347519)
                                                                      end8347515
                                                                      (+
                                                                       end8347515
                                                                       (string-length
                                                                        (car
                                                                         result8347519))))
                                                                     (no-match)))))
                                                          (if (matches?
                                                               result8347520)
                                                              (let ((end8347521
                                                                     (match-end
                                                                      result8347520)))
                                                                (matches
                                                                 '()
                                                                 end8347521
                                                                 end8347521))
                                                              (no-match)))))
                                                   (if (matches? result8347518)
                                                       result8347518
                                                       (no-match)))))))
                                      (if (matches? result8347514)
                                          (loop8347517
                                           (cons
                                            (match-match result8347514)
                                            matches8347516)
                                           (match-end result8347514))
                                          (matches
                                           (reverse matches8347516)
                                           offset8347513
                                           end8347515))))))
                             (if (matches? result8347524)
                                 (let ((end8347525 (match-end result8347524)))
                                   (matches '() end8347525 end8347525))
                                 (no-match)))))
                      (hash-set! cache8347337 offset8347513 result8347526)
                      result8347526))))
             (Comment
              (lambda (input8347527 offset8347528)
                (if (hash-has-key? cache8347338 offset8347528)
                    (hash-ref! cache8347338 offset8347528 '())
                    (let ((result8347532
                           (let ((result8347530
                                  (let ((result8347529
                                         (regexp-match
                                          "^;[^\n]*"
                                          input8347527
                                          offset8347528)))
                                    (if result8347529
                                        (matches
                                         (car result8347529)
                                         offset8347528
                                         (+
                                          offset8347528
                                          (string-length (car result8347529))))
                                        (no-match)))))
                             (if (matches? result8347530)
                                 (let ((end8347531 (match-end result8347530)))
                                   (matches '() end8347531 end8347531))
                                 (no-match)))))
                      (hash-set! cache8347338 offset8347528 result8347532)
                      result8347532)))))
      (lambda (input8347328)
        (hash-clear! cache8347329)
        (hash-clear! cache8347330)
        (hash-clear! cache8347331)
        (hash-clear! cache8347332)
        (hash-clear! cache8347333)
        (hash-clear! cache8347334)
        (hash-clear! cache8347335)
        (hash-clear! cache8347336)
        (hash-clear! cache8347337)
        (hash-clear! cache8347338)
        (Sexps input8347328 0)))))

