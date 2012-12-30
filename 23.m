(* Project Euler, Problem #23 *)
(* Lucas Garron *)
(* Date: December 23, 2012 *)

(* Code *)

AbundantQ[n_Integer] := DivisorSigma[1, n] > 2 n;

(* Not efficient, but it works. *)
abundantNumbers = Select[Range[28123], AbundantQ];
NotAbundantSum[n_Integer] :=  Intersection[abundantNumbers, n - abundantNumbers] == {};

result = Total@Select[Range[28123], NotAbundantSum];

(* Output *)

Print[result];