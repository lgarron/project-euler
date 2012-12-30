(* Project Euler, Problem #12 *)
(* Lucas Garron *)
(* Date: November 23, 2012 *)

(* Input *)

inputFile = FileNameJoin[{DirectoryName[$InputFileName],"input","11.txt"}];
input = Import[inputFile,"Table"];

(* Code *)

arr = input;

Products[arr_List] := Times @@@ Partition[#, 4, 1] & /@ arr;
Diagonals[m_List?MatrixQ] := Table[Diagonal[m, i], {i, -Length[m] + 1, Length[m[[1]]] - 1}]
result = Max[Products /@ {arr, Transpose[arr], Diagonals[arr], Diagonals[Reverse[arr]]}]

(* Output *)

Print[result];
