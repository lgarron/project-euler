(* ::Package:: *)

(* Project Euler, Problem #57 *)
(* Lucas Garron *)
(* Date: November 28, 2013 *)

(* Code *)

(*fractions = Table[FromContinuedFraction[Prepend[ Table[2, {i}], 1]], {i, 0, 1000}];*)

fractions = NestList[1 + 1/(1 + #)&, 1 , 1000];
LongerNumeratorQ[x_] := Length[IntegerDigits[Numerator[x]]] > Length[IntegerDigits[Denominator[x]]];
result = Length[Select[fractions, LongerNumeratorQ]];

(* Output *)

Print[result];
