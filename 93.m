(* Project Euler, Problem #93 *)
(* Lucas Garron *)
(* Date: September 03, 2014 *)

(* Code *)

AllOperations[{s1_Results, s2_Results}] :=
Results @@ Union[Flatten[Outer[
  Join[
    {#1*#2, #1 + #2, #1 - #2, #2 - #1},
    If[#1 == 0, {}, {#2/#1}],
    If[#2 == 0, {}, {#1/#2}]
  ] &,
  List @@ s1, List @@ s2
]]]

BinaryTrees[{x_}] := Results[x];
BinaryTrees[l_] := Module[{splits},
  splits = Union[Sort[{#, Complement[l, #]}] & /@
    Subsets[l, {1, Min[Length[l] - 1, Floor[Length[l]/2]]}]
  ];
  (*Print[{l,splits}];*)
  Results @@ Union[Join @@ Table[
    (*Print[":",split];*)
    List @@ AllOperations[BinaryTrees /@ split],
    {split, splits}]
  ]
]

ResultsForInputs[l_] := List @@ BinaryTrees[l];
PositiveIntegerResultsForInputs[l_] := Select[
  ResultsForInputs[l],
  # \[Element] Integers && # > 0 &
];

InitialRunLength[l_] := Split[l - Range[Length[l]]] // First // Length
IncreasingSequencesWithMax[max_, len_: 4] :=
  Sort[Reverse /@ Sort /@ IntegerPartitions[max, {len}]
]

(* Dynamic[{max, maxInputs}] *)

max = 0;
maxInputs = {};
Do[
  Table[
    abcd = Accumulate[differenceList];
    len = InitialRunLength[PositiveIntegerResultsForInputs[abcd]];
    If[len > max, max = len; maxInputs = abcd],
    {differenceSet, IncreasingSequencesWithMax[n]},
    {differenceList, Permutations[differenceSet]}
  ],
  {n, 8}
]

result = FromDigits[maxInputs]

(* Output *)

Print[result];
