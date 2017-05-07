module O = Opium.Std;;
open Util;;

type person = {
  name: string;
  age: int;
}

let json_of_person { name ; age } =
  let open Ezjsonm in
  dict [ "name", (string name)
       ; "age", (int age) ]

let print_param = O.get "/hello/:name" begin fun req ->
  `String ("Hello " ^ O.param req "name") |> O.respond'
end

let print_person = O.get "/person/:name/:age" begin fun req ->
  let person = {
    name = O.param req "name";
    age = "age" |> O.param req |> int_of_string;
  } in
  `Json (person |> json_of_person) |> O.respond'
end

let print_qpdf = O.get "/api/pdf/:method/:option/:data" begin fun req ->
  let cmd =
    match O.param req "method" with
    | "merge" ->
      "qpdf --empty --pages #{[infile.pdf...]} -- #{outfile.pdf}"
    | "split" ->
      "qpdf #{infile.pdf} --pages #{from}-#{to} -- #{outfile.pdf}"
    | "linearize" ->
      "qpdf #{infile.pdf} --linearize #{outfile.pdf}"
    | "encrypt" ->
      "qpdf #{infile.pdf} --encryption-file-password=#{password} #{outfile.pdf}"
    | "decrypt" ->
      "qpdf #{infile.pdf} --password=#{password} --decrypt #{outfile.pdf}"
    | _ ->
      syscall "qpdf --help"
  in
  `String (cmd) |> O.respond'
end

let _ =
  O.App.empty
  |> print_param
  |> print_person
  |> print_qpdf
  |> O.App.run_command
