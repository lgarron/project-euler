(* Project Euler, Problem #100 *)
(* Lucas Garron *)
(* Date: September 03, 2014 *)

(* Code *)

bFromA = b /. Solve[2 a (a - 1) == b (b - 1), b][[2]];

v = Module[{b},
  Reap[Table[
    If[bFromA \[Element] Integers, Sow[{a, bFromA}], 0],
    {a, 10000}
  ]][[-1, -1]]
];

expr = FindSequenceFunction[#, n] & /@ Transpose[v];

result = Select[Table[expr // RootReduce, {n, 24}], Last[#] > 10^12 &][[1, 1]];

(* Output *)

Print[result];
