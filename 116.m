(* Project Euler, Problem #116 *)
(* Lucas Garron *)
(* Date: September 04, 2014 *)

(* Code *)

result = ((LinearRecurrence[{1, 1, 0, 0}, {0, 0, 0, 1}, 50 + 4] // Last) - 1) +
         ((LinearRecurrence[{1, 0, 1, 0}, {0, 0, 0, 1}, 50 + 4] // Last) - 1) +
         ((LinearRecurrence[{1, 0, 0, 1}, {0, 0, 0, 1}, 50 + 4] // Last) - 1)

(* Output *)

Print[result];
