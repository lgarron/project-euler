(* Project Euler, Problem #113 *)
(* Lucas Garron *)
(* Date: September 04, 2014 *)

(* Code *)

result = Binomial[100 + 9, 100] - 1 + (* Increasing, at most 100 digits. Exclude 000...0 *)
  Sum[
    (* Decreasing, exactly i digits. Exclude 000...0, 111...1, ..., 999...9*)
    Binomial[i + 9, i] - 10,
    {i, 100}
  ]

(* Output *)

Print[result];
