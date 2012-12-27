(* Project Euler, Problem #29 *)
(* Lucas Garron *)
(* Date: December 26, 2012 *)

result = Power @@@ Tuples[Range[2, 100], 2] // Union // Length;

Print[result];