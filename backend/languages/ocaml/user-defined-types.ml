(* Variants *)
type character_class =
  | Barbarian
  | Bard
  | Cleric
  | Druid
  | Fighter
  | Monk
  | Paladin
  | Ranger
  | Rogue
  | Sorcerer
  | Wizard

type rectitude = Evil | R_Neutral | Good
type firmness = Chaotic | F_Neutral | Lawful

let rectitude_to_french = function
  | Evil -> "Mauvais"
  | R_Neutral -> "Neutre"
  | Good -> "Bon"
;;

print_string (rectitude_to_french Evil);;
print_endline ""

(* Construct with Data *)
type commit =
  | Hash of string
  | Tag of string
  | Branch of string
  | Head
  | Fetch_head
  | Orig_head
  | Merge_head

let commit_to_string = function
  | Hash sha -> sha
  | Tag name -> name
  | Branch name -> name
  | Head -> "HEAD"
  | Fetch_head -> "FETCH_HEAD"
  | Orig_head -> "ORIG_HEAD"
  | Merge_head -> "MERGE_HEAD"
;;

print_string (commit_to_string (Hash "1234567890abcdef"));;
print_endline ""

(* Recursive Variants *)
type json =
  | Null
  | Bool of bool
  | Int of int
  | Float of float
  | String of string
  | Array of json list
  | Object of (string * json) list

let rec has_field name = function
  | Array u -> List.fold_left (fun b obj -> b || has_field name obj) false u
  | Object u ->
      List.fold_left
        (fun b (key, obj) -> b || key = name || has_field name obj)
        false u
  | _ -> false

(* Polymorphic Data Types *)
type 'a option = None | Some of 'a
type 'b list = [] | ( :: ) of 'b * 'b list
type bool = false | true
type ('a, 'b) pair = Pair of 'a * 'b

(* User Defined Polymorphic Data Types *)
type 'a tree = Leaf | Node of 'a * 'a tree * 'a tree

let rec sum = function Leaf -> 0 | Node (v, l, r) -> v + sum l + sum r

let rec map f = function
  | Leaf -> Leaf
  | Node (v, l, r) -> Node (f v, map f l, map f r)

let tree = Node (1, Node (2, Leaf, Leaf), Node (3, Leaf, Leaf));;

print_int (sum tree);;
print_endline ""

(* Record *)
type character = {
  name : string;
  level : int;
  race : string;
  class_type : character_class;
  alignment : firmness * rectitude;
  armor_class : int;
}

let character =
  {
    name = "Gandalf";
    level = 10;
    race = "Human";
    class_type = Wizard;
    alignment = (Lawful, Good);
    armor_class = 10;
  }

let ghorghor_bey : character =
  {
    name = "Ghôrghôr Bey";
    level = 17;
    race = "half-ogre";
    class_type = Fighter;
    alignment = (Chaotic, R_Neutral);
    armor_class = -8;
  }
;;

print_endline character.name;;
print_endline ghorghor_bey.name
