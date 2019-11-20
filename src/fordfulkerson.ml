open Tools
(*A TESTER*)
(*Instance de tools.gmap qui prépare le graph avec les capacités*)
let gmap_flot_of_string = 
  let flot_of_string = fun s -> (0, int_of_string s) in
  fun graph -> gmap graph flot_of_string
;;
(*A TESTER*)
(*le contraire de la fct précédente*)
let gmap_string_of_flot =
  let string_of_flot = fun f -> match f with
    |(a,b) -> Printf.sprintf "(%d/%d)" a b in 
  fun graph -> gmap graph string_of_flot
;;
(*PAS FINI*)
(* Algo de FordFulkerson*)

let fordfulkerson s=  fun s_graph -> (*string graph -> (int * string graph)*) 
  (*let f_graph = flot_of_string s_graph in
    let e_graph = ecart_of_flot f_graph in
  *)
  (1,[])
;;
(*A TESTER*)
(*Créé le graph d'écart à partir du graph de capacité*) 
let ecart_of_flot =
  let ecart_of_flot = fun f -> match f with
    |(a,b) -> b in
  fun graph -> gmap graph ecart_of_flot

;;

(*Update le graph de flot avec un meilleur chemin*)
(*let find_better_path e_graph f_graph = function ->
  let better_path = Some ([1,2],2) in(*y insérer l'application de find_path *) 
  match better_path with
  |None -> None
  |Some (chemin, capacite) -> 
  ;;*)