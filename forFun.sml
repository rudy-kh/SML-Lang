(*let
    val a = fn (x : int) => 2 * x
in
    a 
end      
*)
(************************************************)
(* Aufgabe 3.1 S.50 im Buch *)
(* mit einer Kaskadierten Prozedurdeklaration *)
fun mul3K(x : int)(y : int)(z: int)= x * y * z

(* mit einer Prozedurdeklaration und zwei Abstraktionen*)
fun mul3P(x : int)= fn (y : int) => fn (z : int) => x * y * z
						 
(* mit einer Deklaration mit val und drei Abstraktionen*)
val mul = fn (x : int) => fn (y : int) => fn (z : int) => x * y * z

								       
(**************************************************************************)
fun iter (n : int) (s : int)(f : int -> int) = iter (n-1) (f s) f
fun power (x : int) (n : int) = iter n 1 (fn (a : int) => a * x)

(*
val a = (fn x ⇒ (fn y ⇒ (fn z ⇒ z + x) y) x) 5				  *)   
fun f (x : int): int = f (x + 1)

fun di1(x : int) = di1(x-1)
fun di2 (x : int) = 1 + di2(x-1)		      

    
(*
fun ('a, 'b) f (p: 'a*'a->'b) (i:'a) = p(i, i);
val f = fn : ('a * 'a -> 'b) -> 'a -> 'b
- fun f(a, b, c) = b;
val f = fn : 'a * 'b * 'c -> 'b

 fun fib(n:int) = #2( iter (fn(x, y)=>(y, x+y)) n (0, 1));
*)

fun ('a, 'b) f (x : 'a, y : 'b) = y

fun iter n s f = if n < 1 then s else iter (n-1) (f s) f

fun ff p = #1 (p : int * int )

fun iterdn n m s f = if n<m then s else iterdn (n-1) m (f(n,s)) f	      

fun iter' n m s f = if n<m then s else iter'(n-1) m (f s) f

fun iterup m n s f = if m>n then s else iterup (m+1) n (f(m,s)) f

fun iterup' n s f = if n < 1 then s else iterup' (n-1) (f s) f

fun fib (n : int) = #2 (iter (n-1) (0,1) (fn (a : int, y : int) => (y, y + a)))

fun fib1 (n:int) = #2(iter n (0,1) (fn(x,y) => (y,x+y)));
		       
fun fac (n:int) : int = #2(iter n (0,1) (fn (k:int, a:int) => (k+1, a*(k+1))))

fun add (n: int) (s :int) = #1 (iter n (s,3) (fn (a : int, y : int) => ((a+y), if y = 7 then 3 else 7)))

val x = fn x => (fn x => (fn y => let
                                    fun x z = (z+y)* z
                                    val y = 5
                                  in
                                    x (y)
                                  end ))

fun first (s: int) (p: int -> bool) = if p s then s else first (s+1) p
								 
fun mymod (a : int) (b : int) : int = first a (fn (x : int) => if x < b then true else false)
