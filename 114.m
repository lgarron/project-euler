(* Project Euler, Problem #114 *)
(* Lucas Garron *)
(* Date: September 04, 2014 *)

(* Code *)

BlackOnRight[0] = 1;
RedOnRight[0] = 0;
BlackOnRight[n_] := BlackOnRight[n] = BlackOnRight[n - 1] + RedOnRight[n - 1]
RedOnRight[n_] := RedOnRight[n] = Sum[BlackOnRight[i], {i, 0, n - 3}]

result = BlackOnRight[50] + RedOnRight[50];

(* Output *)

Print[result];
