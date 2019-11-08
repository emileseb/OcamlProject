open Graph

let clone_nodes = fun graph -> 
  let g = ref empty_graph in
  n_iter graph (fun id -> g := new_node !g id);
  !g

let gmap = fun graph f ->
  let g = ref (clone_nodes graph) in
  e_iter graph (fun id1 id2 lbl -> g := new_arc !g id1 id2 (f lbl));
  !g

let add_arc = fun graph id1 id2 n ->
  let arc = find_arc graph id1 id2 in
  match arc with
  | None -> new_arc graph id1 id2 n
  | Some lbl -> new_arc graph id1 id2 (lbl + n)