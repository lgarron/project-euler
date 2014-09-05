(* Project Euler, Problem #164 *)
(* Lucas Garron *)
(* Date: September 05, 2014 *)

(* Code *)

Num[2, i_, j_] := Boole[i > 0 && i + j <= 9];

Num[index_, last_, current_] := Num[index, last, current] = Sum[
  Num[index - 1, penultimate, last],
  {penultimate, 0, 9 - last - current}
];

result = Sum[
  Num[20, i, j],
  {i, 0, 9},
  {j, 0, 9}
];

(* Output *)

Print[result];
