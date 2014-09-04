(* Project Euler, Problem #115 *)
(* Lucas Garron *)
(* Date: September 04, 2014 *)

(* Code *)

BlackOnRight[0] = 1;
RedOnRight[0] = 0;
BlackOnRight[n_] := BlackOnRight[n] = BlackOnRight[n - 1] + RedOnRight[n - 1]
RedOnRight[n_] := RedOnRight[n] = Sum[BlackOnRight[i], {i, 0, n - 50}]

n = 0;
While[
  RedBlockMayComeNext[n] + RedBlockCannotComeNext[n] < 10^6,
  n++
];

result = n;

(* Output *)

Print[result];
