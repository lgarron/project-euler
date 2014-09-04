(* Project Euler, Problem #173 *)
(* Lucas Garron *)
(* Date: September 01, 2014 *)

(* Code *)

(* Based on code from 174.m, else I would have doem something simpler. *)

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

result = Select[t, 0 < # <= maxT &] // Length

(* Output *)

Print[result];
