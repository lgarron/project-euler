(* Project Euler, Problem #72 *)
(* Lucas Garron *)
(* Date: September 02, 2014 *)

(* Code *)

result = EulerPhi /@ Range[2, 10^6] // Total

(* Output *)

Print[result];