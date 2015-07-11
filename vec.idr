module vec

vapp : Vect n a -> Vect m a -> Vect (n + m) a
vapp Nil	ys = ys
vapp  (x :: xs) ys = x :: vapp xs ys
