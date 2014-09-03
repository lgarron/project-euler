(* Project Euler, Problem #90 *)
(* Lucas Garron *)
(* Date: September 03, 2014 *)

(* Code *)

digitChoices = (IntegerDigits[#, 10, 2] & /@ (Range[9]^2)) /. {9 -> 6}

DiePossibilities[mustBeOnDie_List] :=
  Module[{d = Union[mustBeOnDie]},
    If[Length[d] > 6, Return[{}]];
    Select[Union[
      Sort /@ Tuples[
        Join[(List /@ d) /. {6} -> {6, 9},
         Table[Range[0, 9], {6 - Length[d]}]]]], Union[#] == # &]
  ]

dice = Reap[Table[
  Sow /@ Tuples[{
    DiePossibilities[MapThread[Extract, {digitChoices, t}]],
    DiePossibilities[MapThread[Extract, {digitChoices, 3 - t}]]
  }],
  {t, Tuples[Table[{1, 2}, {9}]]}
]][[-1, -1]];

result = Union[Sort /@ (dice)] // Length

(* Output *)

Print[result];
