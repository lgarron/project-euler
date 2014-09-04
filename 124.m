(* Project Euler, Problem #124 *)
(* Lucas Garron *)
(* Date: September 04, 2014 *)

(* Code *)

result = SortBy[Range[100000], Times @@ First /@ FactorInteger[#] &][[10000]]

(* Output *)

Print[result];
