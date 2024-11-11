let () =
  print_endline "Flatten a list"


type 'a node = | One  of 'a | Many of 'a node list


let flatten list = 
  let rec flatten' acc list =
    match list with
    | [] -> acc
    | One x :: y -> flatten' (x :: acc) y
    | Many l :: t -> flatten' ( flatten' acc l ) t
  in flatten' [] list

let string_of_list lst =
  "[" ^ String.concat "; " lst ^ "]"

let result = flatten [One "a"; Many [One "b"; Many [One "c" ;One "d"]; One "e"]];;

print_endline (string_of_list result)

