(* Project Euler, Problem #73 *)
(* Lucas Garron *)
(* Date: September 02, 2014 *)

(* Code *)

NumMultiplesInRange[k_, rangeLowest_, rangeHighest_] :=
  (Floor[rangeHighest, k] - Ceiling[rangeLowest, k])/k + 1

NumMultiplesOfAllAllInRange[rangeLowest_, rangeHighest_][values_] :=
 NumMultiplesInRange[Times @@ values, rangeLowest, rangeHighest]

InclusionExclusion[set_, fn_] := Total[Table[
  Total[fn /@ Subsets[set, {i}]*((-1)^(i - 1))],
  {i, Length[set]}]
]

numFractionsWithDenominator[denominator_, greaterThan_, lessThan_] := Module[{
     rangeLowest = Floor[denominator*greaterThan] + 1,
     rangeHighest = Ceiling[denominator*lessThan] - 1,
     primeFactors = First /@ FactorInteger[denominator]
   },
  (rangeHighest - rangeLowest + 1) - InclusionExclusion[primeFactors, NumMultiplesOfAllAllInRange[rangeLowest, rangeHighest]]
]


result = Sum[
  numFractionsWithDenominator[n, 1/3, 1/2],
  {n, 12000}
]

(* Output *)

Print[result];