fun listFirst([x]) = x
  | listFirst(x :: xs) = x

fun isMember(_, []) = false
  | isMember(y, (x::xs)) = if x = y then true 
                           else isMember(y, xs)
