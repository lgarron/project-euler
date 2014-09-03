(* Project Euler, Problem #87 *)
(* Lucas Garron *)
(* Date: September 02, 2014 *)

(* Code *)

max = 50000000;
PrimePowers[k_] := Table[Prime[i]^k, {i, PrimePi[max^(1/k)]}];

result = Select[Flatten[Outer[
  Plus,
  PrimePowers[2],
  PrimePowers[3],
  PrimePowers[4]
]], # < max &] // Union // Length

(* Output *)

Print[result];