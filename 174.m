(* ::Package:: *)

(* Project Euler, Problem #174 *)
(* Lucas Garron *)
(* Date: September 01, 2014 *)

(* Code *)

MatchParity[p_, n_] := If[Mod[p, 2] == Mod[n, 2], n, n+1]
maxT = 10^6;

minimumInnerDiameter[outerDiameter_] := MatchParity[outerDiameter, Ceiling[Sqrt[Max[1, outerDiameter^2 - maxT]]]]
t = Reap[
	Do[
		Do[
			Sow[outerDiameter^2 - innerDiameter^2],
		{innerDiameter, minimumInnerDiameter[outerDiameter], outerDiameter, 2}
	],
	{outerDiameter, 1, maxT/4 + 1}]
][[-1, -1]];

l = Select[Tally[t], First[#] <= maxT &];
n = Tally[l[[All, 2]]];

result = Total[Last /@ Select[n, 1 <= #[[1]] <= 10 &]]

(* Output *)

Print[result];
