(* ::Package:: *)

(* Project Euler, Problem #60 *)
(* Lucas Garron *)
(* Date: December 02, 2013 *)

(* Code *)

DigitConcat[x_, y_] := FromDigits@Flatten[IntegerDigits/@{x, y}]
ConcatPrimeQ[x_, y_]:= ConcatPrimeQ[x, y] = PrimeQ[DigitConcat[x, y]] && PrimeQ[DigitConcat[y, x]]

FindTuple[level_, current_]:=Module[{p = Min[current], n}, 
  If[level == 1, Return[current]];
  Catch[
    While[p>2, 
      p = NextPrime[p, -1];
      If[And@@(ConcatPrimeQ[p, #]&/@current), 
        rec = FindTuple[level - 1, Append[current, p]];
        If[rec =!= Null, 
          Throw[rec]
        ]
      ]
    ]
  ]
]

n = 5;
startPrime = 2;
While[FindTuple[n, {startPrime}] === Null, 
  startPrime = NextPrime[startPrime];
]
result = Total[FindTuple[n, {startPrime}]]

(* Output *)

Print[result];
