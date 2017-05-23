datatype 'a Tree = empty
                 | leaf of 'a
                 | node of (('a Tree) * 'a * ('a Tree))

(* count any nodes with values *)
fun nodeCount(empty) = 0
  | nodeCount(leaf(_)) = 1
  | nodeCount(node(left, _, right)) = 1 + nodeCount(left) + nodeCount(right)

(* count leaves only *)
fun leafCount(empty) = 0
  | leafCount(leaf(_)) = 1
  | leafCount(node(left, _, right)) = leafCount(left) + leafCount(right)

(* find length of deepest node *)
fun depth(empty) = 0
  | depth(leaf(_)) = 1
  | depth(node(left, _, right)) =
    let
      val (lDepth, rDepth) = (1 + depth(left), 1 + depth(right))
    in
      if lDepth > rDepth then lDepth else rDepth
    end

fun flatten(empty) = []
  | flatten(leaf(x)) = [x]
  | flatten(node(left, x, right)) = flatten(left) @ (x :: flatten(right))

fun insert(x, empty) = leaf(x)
  | insert(y, leaf(x)) =
    if x < y then node(empty, x, leaf(y))
    else node(leaf(y), x, empty)
  | insert(y, node(left, x, right)) =
    if x < y then node(left, x, insert(y, right))
    else node(insert(y, left), x, right)

(*
An ordered binary tree is a tree which satisfies the following property for each node: all of the values in the left child’s subtree are strictly smaller than the current node’s value, and all of the values in the right child’s subtree are greater than or equal to the current node’s value.
*)

fun sort(L) = flatten(foldl(insert)(empty)(L))

(*
sort([12, 100, 19, ~1, 30, 3, 12, 0, 1])
*)

  (*
      6
     /\
    3  8
   /\
  2  9
     /\
    4  empty
  *)
val leftNode = node(leaf(2), 3, node(leaf(4), 9, empty))
val rightNode = leaf(8)
val tree = node(leftNode, 6, rightNode)

val t1 = insert(3, empty)
val t2 = insert(5, t1)
val t3 = insert(1, t2)
val t4 = insert(0, t3)
val t5 = insert(12, t4)

(*
flatten(t5)
*)
