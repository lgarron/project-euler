(* Project Euler, Problem #102 *)
(* Lucas Garron *)
(* Date: April 11, 2015 *)

(* Input *)

inputFile = FileNameJoin[{DirectoryName[$InputFileName],"input","102.csv"}];
input = Import[inputFile, "CSV"];

(* Code *)

(* Computes if the origin is closer to v than [the origin's projection onto the line through x and y] is. *)

Q[v_][x_, y_] := Norm[v] < EuclideanDistance[v - x, Projection[-x, y - x]];
ContainsOrigin[A_, B_, C_] := And[Q[A][B, C], Q[B][C, A], Q[C][A, B]];
result = Select[input, ContainsOrigin @@ Partition[#, 2] &] // Length;

(* Output *)

Print[result];
