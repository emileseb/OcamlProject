open Graph

let find_path = fun graph source puit -> 
  let rec find_path2 = fun  g node target visited m ->
    let o = List.find_opt (fun a -> a = node) visited in
    match o with
    | Some x -> ([], -1, [])
    | None ->
      let arcs = out_arcs g node
      and visited2 = node::visited in
      let rec f = fun arcs2 visited3 -> match arcs2 with
        | [] -> ([], -1, [])
        | (id, lbl)::rest -> let (path, m2, visited4) = find_path2 g id target visited3  (Stdlib.min m lbl) in
          if m2 = -1 then f rest visited4 else (path, m2, visited4) in
      f arcs visited2 in
  let (path, m, visited) = find_path2 graph source puit [] Stdlib.max_int in
  if m = -1 then None else Some(path, m)

