(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  (car (cdr s))
)

(define (caddr s)
  (car (cddr s))
)


(define (sign num)
  (cond
    ((> num 0) 1)
    ((< num 0) -1)
    (else 0)
    )
)


(define (square x) (* x x))

(define (pow x y)
  (cond
    ((= y 0) 1)
    ((= x 1) 1)
    (else (* x (pow x (- y 1))))
    )
)

