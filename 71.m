(* Project Euler, Problem #71 *)
(* Lucas Garron *)
(* Date: September 02, 2014 *)

(* Code *)

PreviousValueInList[l_List, v_] := l[[Position[l, v][[1, 1]] - 1]]

FirstPreviousFareyFraction[Rational[a_, b_]] :=
 PreviousValueInList[FareySequence[b], a/b]

PreviousFareyFraction[Rational[a_, b_], maxDenominator_Integer] :=
  Module[{f, maxMultiplier},
    f = FirstPreviousFareyFraction[a/b];
    maxMultiplier = Floor[(maxDenominator - Denominator[f])/b];
    Return[Numerator[f] + a*maxMultiplier];
  ]

result = PreviousFareyFraction[3/7, 10^6]

(* Output *)

Print[result];