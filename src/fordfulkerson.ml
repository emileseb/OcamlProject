(*Instance de tools.gmap qui prépare le graph avec les capacités*)
let gmap_flot_of_string = 
  let flot_of_string = fun s -> (0, int_of_string s) in
  fun graph -> tools.gmap graph flot_of_string
;;

(*le contraire de la fct précédente*)
let gmap_string_of_flot =
  let string_of_flot = fun f -> match f with
    |(a,b) -> Printf.sprintf "(%d/%d)" a b in 
  fun graph -> tools.gmap graph string_of_flot
;;

(* Algo de FordFulkerson*)
let fordfulkerson = fun s_graph -> (*string graph -> (int * string graph)*)
  let f_graph = flot_of_string s_graph in
  let e_graph = ecart_of_flot f_graph in



;;
(*Créé le graph d'écart à partir du graph de capacité*)
let ecart_of_flot = 

;;

(*Update le graph de flot avec un meilleur chemin*)
let find_better_path =

;;

(*trouve un chemin de source à puit*)
let find_path =

;;

(*renvoie la capacité max du chemin*)
let capacite_max_chemin = 

;;