(* Project Euler, Problem #106 *)
(* Lucas Garron *)
(* Date: September 09, 2014 *)

(* Code *)

result = Length[Select[
  Tuples[Table[{0, 1, -1}, {12}]], (* Of all the ways of assigning the 12 digits to {no set, larger set, smaller set}, *)
  Count[#, 1] == Count[#, -1] &&   (* take those with the same amound ot elements in each set, *)
  MemberQ[Accumulate[#], 1] &&     (* where the larger set has more elements in some initial segment, and *)
  MemberQ[Accumulate[#], -1]&      (* the smaller set also has more elements in some initial segment, and *)
]]/2;                              (* divide for symmetry. *)

(* Output *)

Print[result];
