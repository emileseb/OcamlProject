open Tools
open Graph

(*VALIDEE*)
(*Instance de tools.gmap qui prépare le graph avec les capacités*)
let gmap_flot_of_string = 
  let flot_of_string = fun s -> (0, int_of_string s) in
  fun graph -> gmap graph flot_of_string
;;
(*VALIDEE*)
(*le contraire de la fct précédente*)
let gmap_string_of_flot =
  let string_of_flot = fun f -> match f with
    | (a,b) -> Printf.sprintf "(%d/%d)" a b in 
  fun graph -> gmap graph string_of_flot
;;

(*a pour but de tester les graphs d'écart*)
let gmap_string_of_int =
  fun graph -> gmap graph string_of_int
;;


(*Validee*)
(*Créé le graph d'écart à partir du graph de capacité*) 
let ecart_of_flot = fun graph ->
  let aller = fun lb -> match lb with 
    |(a,b) -> b-a in
  let retour = fun lb -> match lb with 
    |(a,b) -> a in
  let g = clone_nodes graph in
  let create_arc = fun gr id1 id2 lbl -> match (retour lbl) with 
    | 0 -> add_arc gr id1 id2 (aller lbl) 
    | x -> match (aller lbl) with 
      | 0 -> add_arc gr id2 id1 x
      | y -> add_arc (add_arc gr id1 id2 (y)) id2 id1 x in
  e_fold graph (fun gr id1 id2 lbl -> create_arc gr id1 id2 lbl) g
;;

(*Validee*)
let update_flot = fun chemin f_graph ->
  e_fold chemin (fun acc id1 id2 m -> 
      let arc = find_arc acc id1 id2 in
      match arc with
      | None -> let arc2 = find_arc acc id2 id1 in
        begin match arc2 with
          | None -> empty_graph
          | Some(flow2, capacity2) -> new_arc acc id2 id1 (min capacity2 (flow2 - m), capacity2)
        end
      | Some(flow, capacity) -> let g2 = new_arc acc id1 id2 (min capacity (flow + m), capacity) in
        let arc2 = find_arc g2 id2 id1 in
        begin match arc2 with
          | None -> g2
          | Some(flow2, capacity2) -> new_arc g2 id2 id1 (min capacity2 (flow2 - (flow + m - capacity)), capacity2)
        end
    ) f_graph

(*Validée*)
let path_to_graph = fun (path, m) ->
  let rec f = fun a path ->
    match path with
    | [] -> empty_graph
    | b::rest -> add_arc (new_node (f b rest) a) a b m in
  match path with
  | [] -> empty_graph
  | first::rest -> f first rest

(*Validée*)
(*trouve un chemin de source à puit*)
let find_path = fun graph source puits -> 
  let rec find_path2 = fun  g node target visited m ->
    if node = target then ([node], m, []) else
      let o = List.find_opt (fun a -> a = node) visited in
      match o with
      | Some x -> ([], -1, visited)
      | None ->
        let arcs = out_arcs g node
        and visited2 = node::visited in
        let rec f = fun arcs2 visited3 -> 
          match arcs2 with
          | [] -> ([], -1, visited3)
          | (id, lbl)::rest -> let (path, m2, visited4) = find_path2 g id target visited3  (Stdlib.min m lbl) in
            if m2 = -1 then f rest visited4 else (node::path, m2, visited4) in
        f arcs visited2 in
  let (path, m, visited) = find_path2 graph source puits [] Stdlib.max_int in
  if m = -1 then None else Some(path, m)

(*A TESTER*)
(* Algo de FordFulkerson*)
let fordfulkerson =  fun s_graph source puit-> (*string graph -> (int * string graph)*) 
  let f_graph = gmap_flot_of_string s_graph in
  let rec run = fun acc ->
    let e_graph = ecart_of_flot acc in
    match find_path e_graph source puit with
    |None -> (0, gmap_string_of_flot acc) (* mettre à jour le flot max*)
    |Some chemin -> run (update_flot (path_to_graph chemin) acc) in
  run f_graph


;;