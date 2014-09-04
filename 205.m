(* Project Euler, Problem #205 *)
(* Lucas Garron *)
(* Date: September 04, 2014 *)

(* Code *)

pete = Tally[Total /@ Tuples[Table[Range[4], {9}]]];
colin = Tally[Total /@ Tuples[Table[Range[6], {6}]]];

result = N[Total[Reap[Do[
    If[First[p] > First[c], Sow[Last[p]*Last[c]]],
    {p, pete},
    {c, colin}
  ]
][[-1, -1]]]/(4^9*6^6), 7]

(* Output *)

Print[result];
