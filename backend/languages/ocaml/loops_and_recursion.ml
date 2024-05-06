for i = 1 to 10 do
  print_int i
done
;;

print_newline ();;

(* ! is the dereference operator, which is used to get the value of a reference. *)
let quit_loop = ref false in
while not !quit_loop do
  print_string "Have you had enough yet? (y/n) ";
  let str = read_line () in
  if str.[0] = 'y' then quit_loop := true
done

(* Looping over Lists *)
let my_list = [ 1; 2; 3; 4; 5 ];;

let f elem = Printf.printf "I'm looking at element %d now\n" elem in
List.iter f my_list
;;

List.map (( * ) 2) my_list

(* Recursion *)
