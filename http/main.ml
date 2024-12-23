open Lwt
open Cohttp
open Cohttp_lwt_unix
open Soup

type request = {
  url: Uri.t
}

let construct_url (url: string) = 
  Uri.of_string url

type response = {
  status_code: int;
  body: string;
}

let send_http_request url = Client.get (
    construct_url (url)) >>= fun (resp, body) ->
    let status_code = Response.status resp |> 
    Code.code_of_status in 
      body |> Cohttp_lwt.Body.to_string >>= 
      fun _body ->
        let response = {status_code = status_code; body = _body} in
        Lwt.return response

let parse_html body = 
  let parsed = parse body in
  parsed

let normalize_whitespace text =
  Str.global_replace (Str.regexp "[ \t\n\r]+") " " (String.trim text)

let print_response response name =
  Printf.printf "Output From %s: %s with code %d \n" name (String.sub response.body 0 10) 
  response.status_code;
  let soup = parse_html (response.body)
  in

    soup $ "title" |> R.leaf_text |> print_endline;
    soup $$ "a[href]" |> iter (fun a -> print_endline (R.attribute "href" a));

    Printf.printf "\n";
    Printf.printf "Printing the paragraphs ..\n";
    Printf.printf "\n";
    soup $$ "p" |> iter (fun a -> match Soup.leaf_text a with
      | Some text -> print_endline (normalize_whitespace text)
      | None -> ()
    );

    Printf.printf "\n";
    Printf.printf "Printing the Div ..\n";
    Printf.printf "\n";
    soup $$ "div" |> iter (fun a -> match Soup.leaf_text a with
      | Some text -> print_endline (normalize_whitespace text)
      | None -> ()
    );

    Printf.printf "\n";
    Printf.printf "Printing the img ..\n";
    Printf.printf "\n";
    soup $$ "img" |> iter (fun a -> match Soup.leaf_text a with
      | Some text -> print_endline (normalize_whitespace text)
      | None -> ()
    );

  ()

let () = 
  Lwt_main.run (
      send_http_request "https://www.mmuhammad.net/" >>= fun response ->
      print_response response "MMuhammad";
      Lwt.return ()
  );

  ()

