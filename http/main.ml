open Lwt
open Cohttp
open Cohttp_lwt_unix
open Soup

type request = {
  status_code: int;
  body: string;
}

let send_http_request url = Client.get (
  Uri.of_string url ) >>= fun (resp, body) ->
    let status_code = Response.status resp |> 
    Code.code_of_status in 
      body |> Cohttp_lwt.Body.to_string >>= 
      fun _body ->
        let response = {status_code = status_code; body = _body} in
        Lwt.return response

let parse_html body = 
  let parsed = parse body in
  parsed

let print_response response name =
  Printf.printf "Output From %s: %s with code %d \n" name (String.sub response.body 0 10) 
  response.status_code;
  let soup = parse_html (response.body)
  in
    soup $ "title" |> R.leaf_text |> print_endline;
    soup $$ "a[href]" |> iter (fun a -> print_endline (R.attribute "href" a));
  ()



let () = 
  Lwt_main.run (
      send_http_request "https://www.mmuhammad.net/" >>= fun response ->
      print_response response "MMuhammad" ;
      Lwt.return ()
  );


  ()

