(* Project Euler, Problem #140 *)
(* Lucas Garron *)
(* Date: September October 01, 2014 *)

(* Code *)

gf = FindGeneratingFunction[{0, 1, 4, 5, 9}, x];
xForGoldenNugget = x /. Solve[gf == k, x][[2]];
discriminant = Cases[xForGoldenNugget, Power[_, 1/2], \[Infinity]][[1, 1]]

NextGoldenNugget[current_] := Module[{upperBound = \[Infinity]},
  While[
    (v = FindInstance[discriminant == m^2 && current < k < upperBound, {k, m}, Integers]) != {},
    upperBound = k /. v[[1]]
  ];
  Write[Streams["stderr"], upperBound];
  upperBound
]

result = NestList[NextGoldenNugget, 0, 30] // Total

(* Output *)

Print[result];
