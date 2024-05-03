(* Integer *)
let x : int = 10;;

print_int x;;
print_string "\n"

(* Float *)
let pi = 3.14159
let y = 2.0 *. pi;;

print_float y;;
print_string "\n"

(* Boolean *)
let b = true;;

print_string (string_of_bool b);;
print_string "\n"

let num = 3 * if "foo" = "bar" then 5 else 5 + 2;;

print_int num;;
print_string "\n"

(* String *)
let s = "Hello, World!";;

print_string s;;
print_string "\n"

(* Char *)
let c = s.[0];;

print_char c;;
print_string "\n"

(* Bytes *)
let b = Bytes.of_string s;;

Printf.printf "%s\n" (Bytes.to_string b)

(* Array *)
let a = [| 1; 2; 3; 4; 5 |]
let letter = [| 'v'; 'x'; 'y'; 'z' |];;

letter.(2) <- 'w';;
print_char letter.(2);;
print_string "\n"

(* List *)
let l = [ 1; 2; 3; 4; 5 ];;

match l with
| x :: u :: y -> print_int u
| x :: u -> print_int x
| [] -> print_string "Empty list"
;;

print_string "\n"

(* Option & Result *)
let o = Some 10;;

match o with Some x -> print_int x | None -> print_string "None";;
print_string "\n"

let r = Ok 10;;

match r with Ok x -> print_int x | Error _ -> print_string "Error";;
print_string "\n"

(* Tuple *)
let tuple = ("hi", 1);;

print_string (fst tuple);;
print_string "\n";;
print_int (snd tuple);;
print_string "\n"

let f x = match x with a, b -> a;;

print_string (f tuple);;
print_endline ""

(* Unit *)
let record = read_line () (* Read a line from stdin *)
let () = Printf.printf "You entered: %s\n" record
