(* Project Euler, Problem #29 *)
(* Lucas Garron *)
(* Date: December 26, 2012 *)

(* Code *)

result = Power @@@ Tuples[Range[2, 100], 2] // Union // Length;

(* Output *)

Print[result];