(* Project Euler, Problem #69 *)
(* Lucas Garron *)
(* Date: September 01, 2014 *)

(* Code *)

result = MaximalBy[Range[10^6], #/EulerPhi[#] &][[1]]

(* Output *)

Print[result];