(* Project Euler, Problem #89 *)
(* Lucas Garron *)
(* Date: September 03, 2014 *)

(* Input *)

inputFile = FileNameJoin[{DirectoryName[$InputFileName],"input","89.txt"}];
input = Import[inputFile, "Lines"];

(* Code *)

Quiet[
  minimal = IntegerString[FromDigits[#, "Roman"], "Roman"] & /@ input,
  FromDigits::nrom
]

result = Total[StringLength /@ input] - Total[StringLength /@ minimal]

(* Output *)

Print[result];
