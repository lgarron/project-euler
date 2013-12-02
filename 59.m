(* ::Package:: *)

(* Project Euler, Problem #59 *)
(* Lucas Garron *)
(* Date: December 01, 2013 *)

(* Input *)

inputFile = FileNameJoin[{"/Users/lgarron/Dropbox/Code/GitHub/project-euler","input","59.txt"}];
input = Import[inputFile, "CSV"][[1]];

(* Assumption: Most common character is space (32). *)
BitXorWithCommonest[l_] := BitXor[l, BitXor[Commonest[l][[1]], 32]];
vectors = Table[input[[j]],{i, 3},{j, i, Length[input], 3}];
data = Flatten[BitXorWithCommonest/@vectors];

(* Code *)

result = Total[data]

(* Output *)

Print[result];



