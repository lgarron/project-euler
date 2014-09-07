(* Project Euler, Problem #479 *)
(* Lucas Garron *)
(* Date: September 01, 2014 *)

(* Code *)

(* Note: This code is the result of math simplifications. *)

n = 10^6
modulus = 10^9 + 7

result = Mod[Module[{q}, Sum[
  q = k^2 - 1;
  q *(-1 + PowerMod[q, n, modulus])*PowerMod[1 + q, -1, modulus],
  {k, n}
]], modulus]

(* Output *)

Print[result];
