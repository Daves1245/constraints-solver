int: n = 8;
array[1..n] of var 1..n: queens;

constraint forall(i in 1..n, j in i+1..n) (
    queens[i] != queens[j] /\
    queens[i] + i != queens[j] + j /\
    queens[i] - i != queens[j] - j
);

solve satisfy;
output ["1ueens: \(queens)"];
