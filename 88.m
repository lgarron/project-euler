(* Project Euler, Problem #88 *)
(* Lucas Garron *)
(* Date: September 03, 2014 *)

(* Code *)

DivisorProducts[1, _] = {{}};
DivisorProducts[n_, min_: 2] := (DivisorProducts[n, m] = Join @@ Table[
     Table[
      Join[{d}, e]
      , {e, DivisorProducts[n/d, d]}
      ],
  {d, Select[Divisors[n], # >= min &]}
]);

ProductSumify[l_] := Join[l, Table[1, {Times @@ l - Total[l]}]];

max = 12000;
entries = Table[0, {max}];
numEntries = 0;
n = 1;
While[numEntries < max,
  Do[
    ps = Length[ProductSumify[d]];
    If[
      ps <= max && entries[[ps]] == 0,
      entries[[ps]] = n;
      numEntries++
    ],
    {d, DivisorProducts[n]}];
  n++
];

result = Rest[entries] // Union // Total;

(* Output *)

Print[result];