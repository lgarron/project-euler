(* Project Euler, Problem #48 *)
(* Lucas Garron *)
(* Date: December 30, 2012 *)

(* Code *)

result = Mod[Sum[n^n, {n, 10^3}], 10^10];

(* Output *)

Print[result];
