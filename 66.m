(* Project Euler, Problem #66 *)
(* Lucas Garron *)
(* Date: June 01, 2014 *)

(* Code *)

(* Just for fun, let Mathematica do the math. *)
vals = Table[(
  x
    /. Solve[
      x^2 - DD*y^2 == 1
        && x > 0 && y > 0
        && Element[x, Integers] && Element[y, Integers]
      , {x, y}]
    /. x -> {0}
    /. C[1] -> 1
 )[[1]], {DD, 1000}];
result = Position[vals, Max[vals]][[1, 1]]

(* Output *)

Print[result];