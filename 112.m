(* Project Euler, Problem #112 *)
(* Lucas Garron *)
(* Date: September 13, 2014 *)

(* Code *)

BouncyQ[l_Integer] := With[{pairs = Partition[IntegerDigits[l], 2, 1]},
  Or @@ (Less @@@ pairs) && Or @@ (Greater @@@ pairs)
]

i = 1;
numBouncy = 0;
While[numBouncy/i != 99/100,
  numBouncy += Boole[BouncyQ[++i]];
];

result = i;

(* Output *)

Print[result];
