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
    |(a,b) -> Printf.sprintf "(%d/%d)" a b in 
  fun graph -> gmap graph string_of_flot
;;

(*PAS FINI*)
(* Algo de FordFulkerson*)
(*let fordfulkerson s=  fun s_graph source puit-> (*string graph -> (int * string graph)*) 
  (*let f_graph = flot_of_string s_graph in
    let e_graph = ecart_of_flot f_graph in
    let run = Match find_path e_graph source puit with
    |None -> (* end *)
    |Some (chemin, capacite) -> (*incrémenter e_graph*)

  *)
  (1,[])
  ;;*)

(*Pas Fini*)
(*Créé le graph d'écart à partir du graph de capacité*) 
let ecart_of_flot = fun graph ->
  let aller = fun lb -> match lb with 
    |(a,b) -> b-a in
  let retour = fun lb -> match lb with 
    |(a,b) -> a in
  let g = clone_nodes graph in
  let create_arc = fun gr id1 id2 lbl -> match (retour lbl) with (*Il faudrait aussi tester si un arc n'a pas déjà été créé (cas ou il y a une capacité aller et retour) *)
    | 0 -> new_arc gr id1 id2 (aller lbl) 
    | x -> new_arc gr id1 id2 (aller lbl) -> new_arc gr id2 id1 x in
  e_fold graph (fun gr id1 id2 lbl -> create_arc gr id1 id2 lbl) g
;;

(*A TESTER*)
(*trouve un chemin de source à puit*)
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

(*Update le graph de flot avec un meilleur chemin*)
(*let find_better_path e_graph f_graph = function ->
  let better_path = Some ([1,2],2) in(*y insérer l'application de find_path *) 
  match better_path with
  |None -> None
  |Some (chemin, capacite) -> 
  ;;*)
