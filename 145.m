(* Project Euler, Problem #145 *)
(* Lucas Garron *)
(* Date: September 03, 2014 *)

(* Code *)

(* This really didn't turn out pretty. If I were redoing it, I'd do it using a better pruning-based approach in Python (or analytically). *)

AllOddQ[unCarriedDigits_List] :=
  And @@ (OddQ /@ IntegerDigits[FromDigits[unCarriedDigits, 10]]);

AllOddQAfterPalindroming[totalLength_Integer][firstHalf_List] :=
  Module[{firstHalves, secondHalf},
    secondHalf = Reverse[firstHalf];
    If[OddQ[totalLength], secondHalf = Rest[secondHalf]];
    AllOddQ[Join[firstHalf, secondHalf]
  ]
];

Sums[nDigits_] := Module[{firstHalves, secondHalf, digitSums},
  firstHalves = Tuples[Table[Range[0, 18], {Ceiling[nDigits/2]}]];
  (* We don't need a separate filterfor first halves starting with zero: they get filtered out because they don't end in an odd digit after palindroming. *)

  firstHalves = Select[firstHalves, AllOddQAfterPalindroming[nDigits]];
  (*Print[firstHalves];*)
  Table[
    Times @@ MapIndexed[NumValidDigits[#, #2[[1]], nDigits] &, d],
    {d, firstHalves}
  ]
];

NumValidDigits[total_, digitIndex_, nDigits_] := Module[{smallestValidDigit, min, max},
  (*Print[{total,digitIndex,nDigits}];*)
  If[
   OddQ[nDigits] && digitIndex == (1 + nDigits)/2,
   Return[If[
      OddQ[total],
        0,
        1
      ]
   ]];
  min = Max[If[digitIndex == 1, 1, 0], total - 9];
  max = Min[9, If[digitIndex == 1, total - 1, total]];
  (*Print[{min,max}];*)
  Return[max - min + 1];
];

result = Total[Total /@ Sums /@ Range[9]];

(* Output *)

Print[result];
