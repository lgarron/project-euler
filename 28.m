(* Project Euler, Problem #28 *)
(* Lucas Garron *)
(* Date: December 26, 2012 *)

(* Formula for the average value at each level found by interpolating values:

  Fit[{{0, 1}, {1, 6}, {2, 19}}, {1, x, x^2}, x];

  In case you're worried that it's not safe to use {0, 1}: I actually calculated {3, 40}
  and used that first. {0, 1} works, though.
*)

result = 1 + 4*Sum[4 x^2 + x + 1, {x, 1, 500}];

Print[result];