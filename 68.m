(* Project Euler, Problem #68 *)
(* Lucas Garron *)
(* Date: September 01, 2014 *)

(* Code *)

spiralPermutation = {{1, 2, 3}, {4, 3, 5}, {6, 5, 7}, {8, 7, 9}, {10, 9, 2}};
Rotations[l_] := Table[RotateRight[l, i], {i, Length[l]}]
Canonicalize[l_List] := First[Sort[Rotations[l]]]
MagicQ[v_] := Equal @@ (Total /@ v)
Stringify[v_] := StringJoin[ToString /@ Flatten[v]]

magic16 = Reap[Do[
  v = Canonicalize[Map[p[[#]] &, spiralPermutation, {2}]];
  If[
    MagicQ[v] && StringLength[Stringify[v]] == 16,
    Sow[Stringify[v]]
  ],
  {p, Permutations[Range[10]]}]
][[-1, -1]];

result = magic16 // Sort // Last

(* Output *)

Print[result];