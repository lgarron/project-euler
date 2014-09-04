(* Project Euler, Problem #124 *)
(* Lucas Garron *)
(* Date: September 04, 2014 *)

(* Code *)

rad[n_] := Times @@ First /@ FactorInteger[n];

result = SortBy[Range[100000], rad][[10000]];

(* Output *)

Print[result];
