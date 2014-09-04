(* Project Euler, Problem #97 *)
(* Lucas Garron *)
(* Date: September 03, 2014 *)

(* Code *)

(* We could use PowerMod for the exponentiation, but this is already very fast.*)
result = Mod[28433 * 2^7830457 + 1, 10^10]

(* Output *)

Print[result];
