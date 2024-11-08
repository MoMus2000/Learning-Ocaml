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

let length_opt (xs : 'a list) : int = 
    let rec length_opt' (xs: 'a list) (acc: int) : int = 
        match xs with
    | [ ] -> acc
    | head :: tail -> length_opt' tail  (acc + 1)
    in length_opt' xs 0

(* problem 5*)
(* Reverse a list *)

let rec reverse (xs : 'a list) : 'a list = 
    match xs with
    | [ ] -> [ ]
    | [ x ] -> [ x ]
    | head :: tail -> reverse tail @ [head]

(* problem 6*)
(* Find out whether a list is a palindrome.*)

let is_palindrome (xs: 'a list) : bool =
    let rec is_palindrome' (xs: 'a list) (ys: 'a list) : bool = 
        match (xs, ys) with
        | ([], []) -> true
        | (x:: xs', y::ys') when x = y -> is_palindrome' xs' ys'
        | _  -> false
        in is_palindrome' xs (reverse xs)

