(* Project Euler, Problem #145 *)
(* Lucas Garron *)
(* Date: September 03, 2014 *)

(* Code *)

NextPossibilities[{{sheets_List, total_Integer}, p_}] := Table[
  chosen = sheets[[i]];
  {
    {
      Sort[Join[
        Delete[sheets, i],
        Range[chosen + 1, 5]
      ]],
      total + Boole[Length[sheets] == 1]
    },
    p/Length[sheets]
  },
  {i, Length[sheets]}
];

TallyLasts[l_] := {l[[1, 1]], Total[Last /@ l]};

S[dist_, 0] := dist;
S[dist_, n_] := TallyLasts /@ GatherBy[
  Join @@ (NextPossibilities /@ S[dist, n - 1]),
  First
];

Ex[{{sheets_List, total_Integer}, p_}] := total*p;

finalDistribution = S[
  {
    {{{1}, 0}, 1}
  },
  16
];

result = N[Total[Ex /@ finalDistribution] - 2, 6]

(* Output *)

Print[result];
