open Graph
open Tools

(*Instance de tools.gmap qui prépare le graph avec les capacités*)
val gmap_flot_of_string: string graph -> (int * int) graph

(*le contraire de la fct précédente*)
val gmap_string_of_flot: (int * int) graph -> string graph

(* Algo de FordFulkerson*)
(*val fordfulkerson: string graph -> id -> id -> (int * string graph)*)

(*Créé le graph d'écart à partir du graph de capacité*)
val ecart_of_flot: (int * int) graph -> int graph

(*Update le graph de flot avec un meilleur chemin et renvoie la quantité dont il à été incrementé *)
(*val find_better_path: int graph -> (int * int) graph -> (int * (int * int) graph) option*)

(*trouve un chemin de source à puit*)
(*Graph d'écart -> Source -> Puit -> (chemin trouvé * capacité max du chemin) si trouvé *)
val find_path: int graph -> id -> id -> (id list * int) option