(* Project Euler, Problem #98 *)
(* Lucas Garron *)
(* Date: October 01, 2014 *)

(* Input *)

inputFile = FileNameJoin[{DirectoryName[$InputFileName],"input","98.csv"}];
input = Import[inputFile, "CSV"] // First;

(* Code *)

anagrams = Values[Select[GroupBy[input, Sort@*Characters], Length[#] > 1 &]];
pairs = Flatten[Subsets[#, {2}] & /@ anagrams, 1];

ValidSquareDigitsQ[s_] := (s[[1]] != 0 && Sqrt[FromDigits[s]] \[Element] Integers)
NumberMatchesWord[w_String, n_Integer] := Equal @@ (Sort@*Values@*PositionIndex) /@ {IntegerDigits[n], Characters[w]}
Remap[i_, {a_, b_}] := Characters[b] /. Inner[Rule, Characters[a], IntegerDigits[i], List]
SquaresWithKDigits[k_] := Range[Floor[Sqrt[10^(k - 1)]], Sqrt[10^k]]^2

HandlePair[pair : {a_, _}] := Table[
  If[
    NumberMatchesWord[a, s] && ValidSquareDigitsQ[Remap[s, pair]],
    Sow[s];
    Sow[FromDigits[Remap[s, pair]]]
  ],
  {s, SquaresWithKDigits[StringLength[a]]}
]

result = Reap[HandlePair /@ pairs][[-1, -1]] // Sort // Last;

(* Output *)

Print[result];
