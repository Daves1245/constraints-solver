int: n = 7;
int: capacity = 100;

array[1..n] of int: weights = [10, 20, 30, 40, 50, 15, 25];
array[1..n] of int: values = [60, 100, 120, 160, 200, 80, 110];

array[1..n] of string: names = ["Gold", "Silver", "Diamond", "Emerald", "Ruby", "Sapphire", "Pearl"];

array[1..n] of var 0..1: x;

constraint sum(i in 1..n)(weights[i] * x[i]) <= capacity;

var int: total_value = sum(i in 1..n)(values[i] * x[i]);
solve maximize total_value;

output [
    "knapsack:\n" ++
    "capacity: " ++ show(capacity) ++ "\n" ++
    "items (weight, value):\n"
] ++
[
    "  " ++ show(i) ++ ": " ++ names[i] ++ " (" ++ show(weights[i]) ++ ", " ++ show(values[i]) ++ ")\n"
    | i in 1..n
] ++
[
    "\nselected:\n"
] ++
[
    names[i] ++ " - weight: " ++ show(weights[i]) ++ ", value: " ++ show(values[i]) ++ "\n"
    | i in 1..n where fix(x[i]) = 1
] ++
[
    "\nTotal weight used: " ++ show(sum(i in 1..n)(weights[i] * fix(x[i]))) ++ "/" ++ show(capacity) ++ "\n" ++
    "value achieved: " ++ show(total_value) ++ "\n" ++
    "items selected: " ++ show([i | i in 1..n where fix(x[i]) = 1]) ++ "\n"
];
