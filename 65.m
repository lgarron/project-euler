(* Project Euler, Problem #65 *)
(* Lucas Garron *)
(* Date: June 01, 2014 *)

(* Code *)

result = Convergents[E, 100] // Last // Numerator // IntegerDigits // Total

(* Output *)

Print[result];