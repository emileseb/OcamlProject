open Graph

let clone_nodes gr = n_fold gr new_node empty_graph;;

let gmap = fun graph f ->
  let g = clone_nodes graph in
  e_fold graph (fun gr id1 id2 lbl -> new_arc gr id1 id2 (f lbl)) g;;

let add_arc = fun graph id1 id2 n ->
  let arc = find_arc graph id1 id2 in
  match arc with
  | None -> new_arc graph id1 id2 n
  | Some lbl -> new_arc graph id1 id2 (lbl + n)