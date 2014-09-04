(* ::Package:: *)

(* Project Euler, Problem #99 *)
(* Lucas Garron *)
(* Date: September 03, 2014 *)

(* Input *)

inputFile = FileNameJoin[{DirectoryName[$InputFileName],"input","99.csv"}];
input = Import[inputFile, "CSV"];

(* Code *)
logs = (#2*Log[#1])&@@@input;
result = FirstPosition[logs, Max[logs]][[1]];

(* Output *)

Print[result];
