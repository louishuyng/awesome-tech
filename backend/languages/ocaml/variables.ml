(* Typing *)
type name = { first : string; last : string }

let robin = { first = "Robin"; last = "Milner" }
let { first; last } = robin

(* Type Pattern matching *)
type live_person = int * name

let age ((years, { first; last }) : live_person) = years

let () =
  Printf.printf "Name: %s %s is %d years old\n" robin.first robin.last
    (age (30, robin))

(* List pattern matching *)
let _, y = List.split [ (1, 2); (3, 4); (5, 6); (7, 8) ];;

Printf.printf "%s\n" (String.concat ", " (List.map string_of_int y))

(* Expression & Statement *)
let _ = 1 + 2

(* Inner Shadowing *)
(* The second definition shadows the first. Inner shadowing is limited to the local definition's scope *)
let i = 21;;

let i = 7 in
i * 2
