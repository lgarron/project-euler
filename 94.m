(* Project Euler, Problem #94 *)
(* Lucas Garron *)
(* Date: April 11, 2015 *)

(* Code *)

SquareQ[n_] := And @@ (EvenQ /@ FactorInteger[n][[All, 2]]);

(* ... mathemagic *)
duplicateLower  = (4 #^2 + 1) &@ Select[Range[Sqrt[10^9/(3*4)]], SquareQ[3 #^2 + 1] &];
duplicateHigher = (2 #^2 - 1) &@ Select[Range[Sqrt[10^9/(3*2)]], SquareQ[3 #^2 - 2] &];
result = Total[3 duplicateLower + 1] + Total[3 duplicateHigher - 1];

(* Ultra-fast. *)
(* result = Total[Select[LinearRecurrence[{15, -15, 1}, {5, 65, 901}, 20], # < 10^9/3 &]*3 + 1] +
 Total[Select[LinearRecurrence[{15, -15, 1}, {17, 241, 3361}, 20], # < 10^9/3 &]*3 - 1]; *)

(* Output *)

Print[result];
