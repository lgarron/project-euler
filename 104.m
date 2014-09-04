(* Project Euler, Problem #104 *)
(* Lucas Garron *)
(* Date: September 04, 2014 *)

(* Code *)

PandigitalStartQ[n_] := False /; n < 10^8;
PandigitalStartQ[n_] := Sort[IntegerDigits[n][[;; 9]]] == Range[9] /; n >= 10^8;

PandigitalNumberQ[n_] := Sort[IntegerDigits[n]] == Range[9];

k = 2;
a = 1;
b = 1;

While[True,
  If[
    PandigitalNumberQ[b] && PandigitalStartQ[Fibonacci[k]],
    Break[]
  ];
  {a, b} = Mod[{b, a + b}, 10^9];
  k++;
];

result = k;

(* Output *)

Print[result];
