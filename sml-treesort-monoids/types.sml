datatype Maths = algebra
               | analysis
               | logic
               | computation

fun awesome(algebra) = true
  | awesome(analysis) = false
  | awesome(logic) = false
  | awesome(computation) = true

datatype Language = functional of string * bool
                  | imperative of string
                  | other
