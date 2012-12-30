(* Project Euler, Problem #21 *)
(* Lucas Garron *)
(* Date: December 23, 2012 *)

(* Code *)

d[n_] := DivisorSigma[1, n] - n;
AmicableQ[n_] := (d[n] != n && d[d[n]] == n);
result = Total@Select[Range[10000], AmicableQ];

(* Output *)

Print[result];