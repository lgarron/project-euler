T[n_] := n (n + 1)/2;

n = 1;
While[DivisorSigma[0, T[n]] <= 500, n++]

Print[T[n]]