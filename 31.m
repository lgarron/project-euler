(* Project Euler, Problem #31 *)
(* Lucas Garron *)
(* Date: December 26, 2012 *)

generatingFunction = Times @@ (1/(1 - x^#) & /@ {1, 2, 5, 10, 20, 50, 100, 200});
result = Coefficient[Series[generatingFunction, {x, 0, 200}], x^200];

Print[result];