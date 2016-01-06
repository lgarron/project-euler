(* ::Package:: *)

(* Project Euler, Problem #323 *)
(* Lucas Garron *)
(* Date: January 05, 2016 *)

(* Code *)

k = 32;
cdf[N_]:= (1 - 1/2^N)^k;
pdf[N_]:= cdf[N] - cdf[N-1];

result = Sum[pdf[i] * i, {i, Infinity}];

formattedResult = NumberForm[result // N, {Infinity, 10}] // ToString;

(* Output *)

Print[formattedResult];
