let () =
    print_endline "Hello, World!"

(* problem 1 *)
(* Write a function last : 'a list -> 'a 
    option that returns the last element of a list*)

let rec last (xs : 'a list) : 'a option = match xs with
    | [ ] -> None
    | [x]  -> Some x
    |  x :: rest -> last rest

(* problem 2 *)
(* Last Two Elements of a List *)
let rec last_and_penultimate (xs: 'a list) : ('a * 'a) option =
    match xs with
    | [ ] -> None
    | [_] -> None
    | [x; y] -> Some (x, y)
    |  _ :: rest -> last_and_penultimate rest

(* problem 3*)
(* N'th Element of a List *)

let rec at (xs: 'a list) (n: int) : 'a option =
    match xs with
    | x :: _ when n == 0 -> Some x
    | _ :: rest when n > 0 -> at rest (n-1)
    | _ -> None

(* problem 4*)
(* length of a list *)

let rec length (xs: 'a list) : int = 
    match xs with
    | [ ] -> 0
    | head :: tail -> (length (tail)) + 1

(* Bonus: Do it with tail recursion *)



(* problem 5*)
(* Reverse a list *)

let rec reverse (xs : 'a list) : 'a list = 
    match xs with
    | [ ] -> [ ]
    | [ x ] -> [ x ]
    | head :: tail -> reverse tail @ [head]

