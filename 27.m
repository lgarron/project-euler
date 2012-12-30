(* Project Euler, Problem #27 *)
(* Lucas Garron *)
(* Date: December 26, 2012 *)

(* Code *)

PrimeRun[a_Integer, b_Integer] := Module[{n = 0},
  While[
    PrimeQ[n^2 + a n + b],
    n++
  ];
  Return[n];
]

max = 0;
maxPair = {};
Do[
  If[
    PrimeRun[a, b] > max,
    max = PrimeRun[a, b]; maxPair = {a, b}
  ],
  {a, -999, 999},
  {b, -999, 999}
]

result = Times @@ maxPair

(* Output *)

Print[result];