let max = max (21 * 2) (int_of_string "713");;

print_int max;;
print_string "\n"

(* Argument *)
let a = String.starts_with ~prefix:"state" "stateless";;

print_string (string_of_bool a);;
print_string "\n"

(* Function *)

(* Operator *)
(* The @@ application operator applies an argument (on the right) to a function (on the left) *)
let number = int_of_float @@ sqrt @@ float_of_int @@ int_of_string "81";;

print_int number;;
print_string "\n"

(* The pipe operator (|>) also avoids parentheses but in reversed order: function on right, argument on left. *)
let number = "81" |> int_of_string |> float_of_int |> sqrt |> int_of_float;;

print_int number;;
print_string "\n";;

(* Local function *)
let sq x = x * x in
sq 7 * sq 7

(* Recursive function *)
let rec fibo n = if n <= 1 then n else fibo (n - 1) + fibo (n - 2);;

print_int (fibo 10);;
print_string "\n"

(* Multiple arguments *)
let sour_cat x y = x ^ " " ^ y;;

print_string (sour_cat "sour" "cat");;
print_string "\n"

(* Partial application *)
(* Normal way *)
let sour_kitty x = sour_cat "kitty" x;;

print_string (sour_kitty "sour");;
print_string "\n"

(* Using partial *)
let sour_kitty = sour_cat "kitty";;

print_string (sour_kitty "sour");;
print_string "\n"

(* Tuple as argument *)
let add (x, y) = x + y
let add_with_out_tuple x y = x + y;;

print_int (add (3, 4));;
print_string "\n";;
print_int (add_with_out_tuple 3 4)
