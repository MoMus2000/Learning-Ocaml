open Lwt
open Cohttp
open Cohttp_lwt_unix

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


let print_response response name =
  Printf.printf "Output From %s: %s with code %d \n" name (String.sub response.body 0 10) 
    response.status_code

let () = 
  let reponses = List.init 10 (fun _ -> Lwt_main.run (send_http_request
  "https://www.mmuhammad.net/"))

  in

  List.iteri (fun i response ->
    Printf.printf "Response %d:\n" (i + 1);
    print_response response "mmuhammad"
  ) reponses;

  ()

