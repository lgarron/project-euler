(* Project Euler, Problem #11 *)
(* Lucas Garron *)
(* Date: November 23, 2012 *)

(* Code *)

T[n_] := n (n + 1)/2;

n = 1;
While[DivisorSigma[0, T[n]] <= 500, n++]

result = T[n];

(* Output *)

Print[result];
