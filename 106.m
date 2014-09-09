(* Project Euler, Problem #106 *)
(* Lucas Garron *)
(* Date: September 09, 2014 *)

(* Code *)

result = Length[Select[
  Tuples[Table[{0, 1, -1}, {12}]],
  Count[#, 1] == Count[#, -1] &&
  MemberQ[Accumulate[#], 1] &&
  MemberQ[Accumulate[#], -1]&
]]/2;

(* Output *)

Print[result];
