(define (timed-prime-test n fun_next)
  (start-prime-test n (runtime) fun_next))

(define (start-prime-test n start-time fun_next)
  (if (prime? n fun_next)
      (report-prime (- (runtime) start-time) n)))

(define (report-prime elapsed-time number)
  (newline)
  (display number)
  (display " *** ")
  (display (* elapsed-time 1000)))

(define (prime? n fun_next)
  (= n (smallest-divisor n fun_next)))

(define (smallest-divisor n fun_next)
  (find-divisor n 2 fun_next))

(define (find-divisor n div fun_next)
  (cond((> (* div div) n) n)
       ((= (remainder n div) 0) div)
       (else (find-divisor n (fun_next div) fun_next))))

(define (next x)
  (+ x 1))

(define (supernext x)
  (if (= x 2)
      3
      (+ x 2)))

(timed-prime-test 100000007 next)
(timed-prime-test 100000037 next)
(timed-prime-test 100000039 next)

(timed-prime-test 100000007 supernext)
(timed-prime-test 100000037 supernext)
(timed-prime-test 100000039 supernext)

(timed-prime-test 1000000007 next)
(timed-prime-test 1000000009 next)
(timed-prime-test 1000000021 next)

(timed-prime-test 1000000007 supernext)
(timed-prime-test 1000000009 supernext)
(timed-prime-test 1000000021 supernext)

(timed-prime-test 10000000019 next)
(timed-prime-test 10000000033 next)
(timed-prime-test 10000000061 next)

(timed-prime-test 10000000019 supernext)
(timed-prime-test 10000000033 supernext)
(timed-prime-test 10000000061 supernext)

(timed-prime-test 100000000003 next)
(timed-prime-test 100000000019 next)
(timed-prime-test 100000000057 next)

(timed-prime-test 100000000003 supernext)
(timed-prime-test 100000000019 supernext)
(timed-prime-test 100000000057 supernext)

(timed-prime-test 1000000000039 next)
(timed-prime-test 1000000000061 next)
(timed-prime-test 1000000000063 next)

(timed-prime-test 1000000000039 supernext)
(timed-prime-test 1000000000061 supernext)
(timed-prime-test 1000000000063 supernext)

(timed-prime-test 10000000000037 next)
(timed-prime-test 10000000000051 next)
(timed-prime-test 10000000000099 next)

(timed-prime-test 10000000000037 supernext)
(timed-prime-test 10000000000051 supernext)
(timed-prime-test 10000000000099 supernext)

(timed-prime-test 100000000000031 next)
(timed-prime-test 100000000000067 next)
(timed-prime-test 100000000000097 next)

(timed-prime-test 100000000000031 supernext)
(timed-prime-test 100000000000067 supernext)
(timed-prime-test 100000000000097 supernext)