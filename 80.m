(* Project Euler, Problem #80 *)
(* Lucas Garron *)
(* Date: September 02, 2014 *)

(* Code *)

result = Sum[
  If[
    Sqrt[i] \[Element] Integers,
    0,
    RealDigits[Sqrt[i], 10, 100] // First // Total
  ]
  , {i, 100}
]

(* Output *)

Print[result];