open Graph
open Tools

(*Validee*)
(*Instance de tools.gmap qui prépare le graph avec les capacités*)
val gmap_flot_of_string: string graph -> (int * int) graph

(*Validee*)
(*le contraire de la fct précédente*)
val gmap_string_of_flot: (int * int) graph -> string graph

(*Validee*)
(*a pour but de tester les graphs d'écart*)
val gmap_string_of_int: int graph -> string graph

(*Validee*)
(*Créé le graph d'écart à partir du graph de capacité*)
val ecart_of_flot: (int * int) graph -> int graph

(*Validee*)
(*Update le graph de flot avec un meilleur chemin et renvoie la quantité dont il à été incrementé *)
val update_flot: int graph -> (int * int) graph -> (int * int) graph

(*Validee*)
(* fusionne les différents arcs entre 2 noeuds pour en avoir maximum 1 dans chaque sens*)
val path_to_graph: (id list * int) -> int graph

(*A Tester *)
(*trouve un chemin de source à puit*)
(*Graph d'écart -> Source -> Puit -> (chemin trouvé * capacité max du chemin) si trouvé *)
val find_path: int graph -> id -> id -> (id list * int) option

(*A Tester *)
(* Algo de FordFulkerson*)
val fordfulkerson: string graph -> id -> id -> (int * string graph)