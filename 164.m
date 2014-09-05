(* Project Euler, Problem #164 *)
(* Lucas Garron *)
(* Date: September 05, 2014 *)

(* Code *)

Do[
  Num[2, i, j] = Boole[i > 0 && i + j <= 9],
  {i, 0, 9},
  {j, 0, 9}
];

Do[
  Do[
    Num[index, i, j] = 0,
    {i, 0, 9},
    {j, 0, 9}
  ];

  Do[
    Num[index, last, current] += Num[index - 1, penultimate, last],
    {penultimate, 0, 9},
    {last, 0, 9},
    {current, 0, 9 - last - penultimate}
  ],
  {index, 3, 20}
];

result = Sum[
  Num[20, i, j],
  {i, 0, 9},
  {j, 0, 9}
];

(* Output *)

Print[result];
