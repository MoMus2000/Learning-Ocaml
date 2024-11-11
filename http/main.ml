open Lwt
open Cohttp
open Cohttp_lwt_unix

let send_http_request url = Client.get (
  Uri.of_string url ) >>= fun (resp, body) ->
    let status_code = Response.status resp |> 
    Code.code_of_status in 
    Printf.printf "Status code: %d\n" status_code;
    body |> Cohttp_lwt.Body.to_string >>= 
    fun _body ->
  Lwt.return (status_code, _body)

let() = 
  let (status_code, body) = Lwt_main.run (send_http_request
  "https://www.mmuhammad.net/") in
  Printf.printf "Status Code: %d\n" status_code;
  Printf.printf "Body : %s\n" body

