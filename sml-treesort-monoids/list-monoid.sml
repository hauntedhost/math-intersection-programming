fun listMonoidLift(f:('a -> 'b), (combine:(('b * 'b) -> 'b), id:'b)) =
   let
      fun f'(nil) = id
        | f'(head::tail) = combine(f(head), f'(tail))
   in
      f'
   end

fun plus(x, y) = x + y
val sum = listMonoidLift(fn x => x, (plus, 0))
val length = listMonoidLift(fn x:int => 1, (plus, 0))

fun aOrB(a, b) = a orelse b
fun member(x) = listMonoidLift(fn y => y = x, (aOrB, false))

(*

https://jeremykun.com/2013/04/07/a-sample-of-standard-ml-and-the-treesort-algorithm/

Write map as a special case of listMonoidLift. The result (the map function) should have one of the two type signatures:

map : ('a -> 'b) * ('a list) -> 'b list
map : 'a -> 'b -> 'a list -> b' list

As a hint, the target monoid should also be a list monoid

*)

fun mapper(x, y) = x @ y
fun map(f:('a -> 'b)) = listMonoidLift(fn x => f(x), (mapper, []))
