(* Project Euler, Problem #64 *)
(* Lucas Garron *)
(* Date: June 01, 2014 *)

(* Code *)

result = Sum[
  Boole[NotElement[Sqrt[n], Integers]] *
  Mod[Length[Last @ ContinuedFraction[Sqrt[n]]], 2]
, {n, 10000}]

(* Output *)

Print[result];