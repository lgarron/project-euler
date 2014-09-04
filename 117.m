(* Project Euler, Problem #117 *)
(* Lucas Garron *)
(* Date: September 01, 2014 *)

(* Code *)

result = LinearRecurrence[{1, 1, 1, 1}, {0, 0, 0, 1}, 50 + 4] // Last;

(* Output *)

Print[result];
