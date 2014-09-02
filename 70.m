(* Project Euler, Problem #70 *)
(* Lucas Garron *)
(* Date: September 01, 2014 *)

(* Code *)

SameDigitsQ[m_, n_] := Equal @@ (Sort /@ IntegerDigits /@ {m, n})
result = MinimalBy[
  Range[2, 10^7],
  If[
    SameDigitsQ[#, EulerPhi[#]],
    #/EulerPhi[#],
    \[Infinity]
  ] &
][[1]]

(* Output *)

Print[result];