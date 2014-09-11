(* Project Euler, Problem #113 *)
(* Lucas Garron *)
(* Date: September 04, 2014 *)

(* Code *)

result = Binomial[100 +  9,  9] - 1 + (* Non-decreasing, at most 100 digits, Exclude empty case. *)
         Binomial[100 + 10, 10] - 1 - (* Non-increasing, at most 100 digits. Exclude empty case. *)
         10*100 (* Remove over-counted numbers: numbers with certain digit (10 possibilities) repeated a certain number of times (at most 100) *)

(* Output *)

Print[result];
