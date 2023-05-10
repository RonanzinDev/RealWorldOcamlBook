open Core
let do_hash filename = 
    Md5.digest_file_blocking filename |> Md5.to_hex |> print_endline
let filename_param =
    let open Command.Param in
    anon ("filename" %: string)

let command = 
    Command.basic 
        ~summary: "Generade an MD5 hash of the input data"
        ~readme: (fun () -> "More detailed information")
        (Command.Param.map filename_param ~f: (fun filename () -> do_hash filename))