let () = print_endline "Remove Duplicates"

let rec compress = function
  | a :: (b :: _ as t) -> if a = b then compress t else a :: compress t
  | smaller -> smaller

let result = compress ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e"]
let () = List.iter print_endline result


let rec pack current acc list=
  match list with
    | [] -> []
    | [x] -> (x :: current) :: acc
    | a :: (b :: _ as t) -> if a = b then 
      pack (a :: current) acc t
      else pack [] ((a :: current) :: acc) t


let res = pack [] [] ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e"]
let () = List.iter (fun l -> Printf.printf "[%s]\n" (String.concat "; " l)) res

let rec duplicate list = 
    match list with
    | [] -> []
    | a :: b -> a :: a :: duplicate b

(*Tail recursive code*)
let dup list = 
  let rec t_duplicate list acc = 
      match list with
      | [] -> acc
      | a :: b -> t_duplicate b (a::a::acc)
  in List.rev (t_duplicate list [])

let () = print_endline "Hello"
let res = duplicate ["a"; "b"; "c"; "c"; "d"]
let () = List.iter print_endline res

let () = print_endline "Hello"
let res = dup ["a"; "b"; "c"; "c"; "d"]
let () = List.iter print_endline res

(*Replicate the Elements of a List a Given Number of Times*)

let rec replicate list count = 
  match (list, count) with
    | [], _ -> []
    | _, 0 -> list
    | a :: b , n -> 
      let acc = ref [] in
      for _ = 1 to n do
        acc := a :: !acc
      done;
      !acc @ replicate b n

let () = print_endline "Hello"
let r = replicate ["a"; "b"; "c"] 3
let () = List.iter print_endline r


(*Drop every nth element from the list*)

let rec drop_nth list n = 
  match (list, n) with
    | a :: b , n when n > 0 -> a :: drop_nth b (n-1)
    | _ :: b , 0 -> b
    | [], _ -> list
    | _ , _ -> list

let () = print_endline "Hello"
let r = drop_nth ["a"; "b"; "c"; "d"; "e"; "f"; "g"] 4
let () = List.iter print_endline r

