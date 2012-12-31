(* Project Euler, Problem #53 *)
(* Lucas Garron *)
(* Date: December 31, 2012 *)

(* Code *)

result = Length @ Select[Flatten[Table[Binomial[n, k], {n, 100}, {k, 100}], 1], # > 10^6 &];

(* Output *)

Print[result];