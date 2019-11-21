open Gfile
open Tools
open Fordfulkerson

let () =

  (* Check the number of command-line arguments *)
  if Array.length Sys.argv <> 5 then
    begin
      Printf.printf "\nUsage: %s infile source sink outfile\n\n%!" Sys.argv.(0) ;
      exit 0
    end ;


  (* Arguments are : infile(1) source-id(2) sink-id(3) outfile(4) *)

  let infile = Sys.argv.(1)
  and outfile = Sys.argv.(4)

  (* These command-line arguments are not used for the moment. *)
  and _source = int_of_string Sys.argv.(2)
  and _sink = int_of_string Sys.argv.(3)
  in

  (* Open file *)
  let graph = from_file infile in

  (*Test de ecart_of_flot*)
  (*let graph2 = gmap_string_of_int (ecart_of_flot (gmap_flot_of_string graph)) in*)

  (*Test de update_flot *)
  (*let graphAmeliorant = ecart_of_flot (gmap_flot_of_string graph) in
    let graphFlot = gmap_flot_of_string graph in 
    let graph1 = gmap_string_of_flot (update_flot graphAmeliorant graphFlot) in *)

  (*Test Path_to_graph*)
  (*let graph1 = gmap_string_of_int (path_to_graph ([0; 1; 5], 7) ) in*)

  (*Test find_path*)
  let graph1 = gmap_string_of_int (path_to_graph find_path (ecart_of_flot (gmap_flot_of_string graph)) 0 5) in

  (*Test de Ford Fulkerson*)
  (*let graph1 = match fordfulkerson graph 0 5 with
    | (capacite, gr) -> gr in *)

  (* Rewrite the graph that has been read. *)
  (*let () = write_file outfile graph1 in*)
  (*let () = export outfile graph2 in*)
  let () = export outfile graph1 in

  ()

