(* Project Euler, Problem #100 *)
(* Lucas Garron *)
(* Date: September 03, 2014 *)

(* Code *)

result = blue /. FindInstance[
  blue/total*(blue - 1)/(total - 1) == 1/2 &&
  0 < blue < total > 10^12,
  {blue, total},
  Integers
][[1]];

(* Output *)

Print[result];
