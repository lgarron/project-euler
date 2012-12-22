(* Project Euler, Problem #19 *)
(* Lucas Garron *)
(* Date: December 21, 2012 *)

<< Calendar`

days = DayOfWeek /@ Tuples[{Range[1901, 2000], Range[12], {1}}];
Print[Count[days, Sunday]];