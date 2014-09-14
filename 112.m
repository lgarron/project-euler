(* Project Euler, Problem #112 *)
(* Lucas Garron *)
(* Date: September 13, 2014 *)

(* Code *)

AnyIncreasingQ[l_List] := Or @@ (Less @@@ Partition[l, 2, 1]);
AnyDecreasingQ[l_List] := Or @@ (Greater @@@ Partition[l, 2, 1]);
BouncyQ[l_Integer] := With[{d = IntegerDigits[l]},
  AnyIncreasingQ[d] && AnyDecreasingQ[d]
];

i = 1;
numBouncy = 0;
While[numBouncy/i != 99/100,
  numBouncy += Boole[BouncyQ[++i]];
];

result = i;

(* Output *)

Print[result];
