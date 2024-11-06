type student = {
    year : int;
    name : string;
    gpa  : float;
}

let ruth = {
    name  = "Ruth";
    gpa = 4.0;
    year = 1954;
} 

type point = float * float

let p : point = (5.0, 3.5)

let x = match not true with
    | true  -> "nope"
    | false -> "yeppers"


let z = match "FOO" with
    | "BAR" -> 0
    |   _   -> 1

let get_charizard = match ["Charizard"; "Blastoise"; "Venusaur";] with
    | [] -> "Empty"
    | h :: t -> h

let second  = match p with 
    | (a, b) -> b


let get_third_value t = match t with 
    | (a, b, c) -> c

let triple = (1, 2, 3)

let result = get_third_value triple
