(* Project Euler, Problem #111 *)
(* Lucas Garron *)
(* Date: September 13, 2014 *)

(* Code *)

P[n_Integer, d_Integer, howOften_Integer] := Select[
  Flatten[
    Permutations /@
    Tuples[
      Table[{d}, {howOften}]
      ~Join~
      Select[Table[Range[0, 9], {n - howOften}], OrderedQ]
    ],
    1
  ],
  First[#] != 0 && PrimeQ[FromDigits[#]] &
]

MN[n_, d_] := Module[{howOften = n, list},
  While[(list = P[n, d, howOften]) == {},
   howOften--
   ];
  {howOften, FromDigits /@ list}
  ]

S[n_, d_] := Total@Union@Last@MN[n, d]

result = Sum[S[10, d], {d, 0, 9}]

(* Output *)

Print[result];
