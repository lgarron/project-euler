(* Project Euler, Problem #137 *)
(* Lucas Garron *)
(* Date: September October 01, 2014 *)

(* Code *)

(* Very small modification of 140.m *)

gf = FindGeneratingFunction[{0, 1, 1, 2, 3, 5}, x];
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

result = Nest[NextGoldenNugget, 0, 15]

(* Output *)

Print[result];
