(* Project Euler, Problem #101 *)
(* Lucas Garron *)
(* Date: April 11, 2015 *)

(* Code *)

u[n_] := Nest[(1 - #*n) &, 1, 10];
result = Sum[InterpolatingPolynomial[u/@Range[k], k+1], {k, 10}]

(* Output *)

Print[result];