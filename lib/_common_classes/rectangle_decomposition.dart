// import 'dart:math';
//
// import 'package:tuple/tuple.dart';
//
// List<int> x = [];
// List<int> y = [];
// // vertex-type := rectilinear = -1; convex = 0; concave = 1
// List vertex_type = [];
// // store the bipartite graph of chords
// G = nx.Graph();
//
// int stride = 25;
//
// class Chord{
//
//   final int indexFrom;
//   final int indexTo;
//
//   const Chord(this.indexFrom, this.indexTo);
//
// }
//
// class Vertex{
//
// }
//
// // The movements of the turtle are recorded and the rectilinear graph thus
// // obtained is converted into bipartite graph of chords
// compute_partition(List<Tuple2<int, int>> p) {
//   // p now contains the list of coordinates of vertices
//   // last one is same as the origin
//   // and the origin is always going to be a convex vertex
//
//   // p.pop();
//   p.removeLast();
//   vertex_type[0] = 0;
//
//   // x and y contain list of x and y coordinates respectively
//   for(Tuple2<int, int> point in p) {
//     x.add(point.item1);
//     y.add(point.item2);
//   }
//
//   // deleting vertices that are on a straight line
//   // List collinear_vertices = [i for i,val in enumerate(vertex_type) if val == -1];
//   List collinear_vertices = [];
//   for(int i=0; i<vertex_type.length; i++)
//     if(vertex_type[i] == -1)
//       collinear_vertices.add(i);
//
//   // Reverse order deletion is done so that the previous index does not
//   // overthrow the current one
//
//
//   // finding the chords inside the polygon
//   List<Chord> horizontal_chords = [];
//   List<Chord> vertical_chords = [];
//   // List concave_vertices = [i for i,val in enumerate(vertex_type) if val == 1];
//
//   List<int> concaveVertexIdxs = []; //concave_vertices
//   for(int i=0; i<vertex_type.length; i++)
//     if(vertex_type[i] == 1)
//       concaveVertexIdxs.add(i);
//
//   // middles is used because, there are cases when there is a chord between vertices
//   // and they intersect with external chords, hence if there is any vertex in between
//   // two vertices then skip that chord.
//   for(int i=0; i<concaveVertexIdxs.length; i++){
//     for(int j=i+1; i<concaveVertexIdxs.length; j++){
//       if(concaveVertexIdxs[j] != concaveVertexIdxs[i] + 1){
//         List middles = [];
//         if(y[concaveVertexIdxs[i]] == y[concaveVertexIdxs[j]])
//           for(int k=0; k<x.length; k++){
//             if(y[concaveVertexIdxs[i]] == y[k] && (x[concaveVertexIdxs[i]] < x[k] && x[concaveVertexIdxs[j]] > x[k] || x[concaveVertexIdxs[i]] > x[k] && x[concaveVertexIdxs[j]] < x[k]))
//                middles.add(k);
//             if(middles.isEmpty)
//                horizontal_chords.add(Chord(
//                  concaveVertexIdxs[i],
//                  concaveVertexIdxs[j]
//                ));
//           }
//         middles = [];
//         if(x[concaveVertexIdxs[i]] == x[concaveVertexIdxs[j]])
//           for(int k=0; k<x.length; k++)
//             if(x[concaveVertexIdxs[i]] == x[k] && (y[concaveVertexIdxs[i]] < y[k] && y[concaveVertexIdxs[j]] > y[k]|| y[concaveVertexIdxs[i]] > y[k] && y[concaveVertexIdxs[j]] < y[k]))
//                middles.add(k);
//           if(middles.isEmpty)
//               vertical_chords.add(Chord(
//                 concaveVertexIdxs[i],
//                 concaveVertexIdxs[j]
//               ));
//       }
//     }
//   }
//
//   // Creating a bipartite graph from the set of chords
//   for(int i=0; i<horizontal_chords.length; i++){
//     Chord h = horizontal_chords[i];
//     var y1 = y[h.indexFrom];
//     var x1 = min(x[h.indexFrom], x[h.indexTo]);
//     var x2 = max(x[h.indexFrom], x[h.indexTo]);
//     G.add_node(i, bipartite=1);
//     for(int j=0; j<vertical_chords.length; j++){
//       Chord v = vertical_chords[j];
//       var x3 = x[v.indexFrom];
//       var y3 = min(y[v.indexFrom],y[v.indexTo]);
//       var y4 = max(y[v.indexFrom],y[v.indexTo]);
//       G.add_node(j + horizontal_chords.length, bipartite=0);
//       if(x1 <= x3 && x3 <=x2 && y3 <= y1 && y1 <= y4)
//         G.add_edge(i, j + horizontal_chords.length);
//     }
//   }
//
//   if(horizontal_chords.isEmpty)
//     for(int j=0; j<vertical_chords.length; j++) {
//       Chord v = vertical_chords[j];
//       var x3 = x[v.indexFrom];
//       var y3 = min(y[v.indexFrom], y[v.indexTo]);
//       var y4 = max(y[v.indexFrom], y[v.indexTo]);
//       G.add_node(j, bipartite = 0);
//     }
//
//   // finding the maximum matching of the bipartite graph, G.
//   var M = nx.Graph();
//   var maximum_matching = nx.bipartite.maximum_matching(G);
//   var maximum_matching_list = [];
//   for(i,j in maximum_matching.items())
//     maximum_matching_list += [(i,j)];
//   M.add_edges_from(maximum_matching_list);
//   maximum_matching = M.edges();
//
//   // breaking up into two sets
//   var H, V = bipartite.sets(G);
//   List free_vertices = [];
//   for(var u in H){
//     var temp = [];
//     for(var v in V)
//       if(maximum_matching.contains((u,v)) || maximum_matching.contains((v,u)))
//         temp += [v];
//     if(temp.isEmpty)
//       free_vertices += [u];
//   }
//
//   for(u in V){
//     var temp = [];
//     for(v in H)
//       if(maximum_matching.contains((u,v)) || maximum_matching.contains((v,u)))
//         temp += [v];
//     if(temp.isEmpty)
//       free_vertices += [u];
//   }
//
//   // finding the maximum independent set
//   List max_independent = [];
//   while(free_vertices.isNotEmpty || maximum_matching.isNotEmpty){
//     if(free_vertices.isNotEmpty){
//       Vertex u = free_vertices.pop();
//       max_independent += [u];
//     } else {
//       var u, v = maximum_matching.pop();
//       G.remove_edge(u,v);
//       max_independent += [u];
//     }
//
//     for(var v in G.neighbors(u)){
//       G.remove_edge(u, v);
//       for(var h in G.nodes()){
//         if(maximum_matching.contains((v,h))){
//           maximum_matching.remove((v,h));
//           free_vertices += [h];
//         }
//         if(maximum_matching.contains((h,v))){
//           maximum_matching.remove((h,v));
//           free_vertices += [h];
//         }
//       }
//     }
//   }
//
//   // drawing the partitioned polygon
//   List<Chord> ind_chords = [];
//   for(int i in max_independent)
//     if(i >= horizontal_chords.length)
//       ind_chords += [vertical_chords[i-horizontal_chords.length]];
//     else
//       ind_chords += [horizontal_chords[i]];
//
//   List<int> unmatched_concave_vertices = List.of(concaveVertexIdxs);
//   for(Chord chord in ind_chords){
//     if(unmatched_concave_vertices.contains(chord.indexFrom))
//       unmatched_concave_vertices.remove(chord.indexFrom);
//     if(unmatched_concave_vertices.contains(chord.indexTo))
//       unmatched_concave_vertices.remove(chord.indexTo);
//   }
//
//   List nearest_chord = [];
//   for(int i in unmatched_concave_vertices){
//     var dist = 0;
//     var nearest_distance = double.infinity;
//     for(int j in max_independent)
//       if(j < horizontal_chords.length){
//         Chord chord = horizontal_chords[j];
//         if(abs(y[i] - y[chord.indexFrom]) < nearest_distance && (x[i] <= x[chord.indexFrom] && x[i] >= x[chord.indexTo] || x[i] >= x[chord.indexFrom] && x[i] <= x[chord.indexTo]) && abs(chord.indexFrom - i) != 1 && abs(chord.indexFrom - i) != 1){
//           List middles = [];
//           for(int u=0; u < x.length; u++)
//             if(x[i] == x[u] && (y[i] < y[u] && y[u] < y[chord.indexFrom] || y[chord.indexFrom] < y[u] && y[u] < y[i]))
//               middles.add(u);
//
//           if(middles.isEmpty){
//             nearest_distance = abs(y[i] - y[chord.indexFrom]);
//             dist = y[chord.indexFrom] - y[i];
//           }
//         }
//       }
//
//     if(nearest_distance != double.infinity)
//       nearest_chord.add(Chord(i, dist));
//     else{
//       for(int k in collinear_vertices)
//         if(x[k] == x[i] && abs(y[k] - y[i]) < nearest_distance && abs(k-i) != 1){
//           List middles = [];
//           for(int u=0; u<x.length; u++)
//             if(x[i] == x[u] && (y[i] < y[u] && y[u] < y[k] || y[k] < y[u] && y[u] < y[i]))
//               middles.add(u);
//           if(middles.isEmpty){
//             nearest_distance = abs(y[i] - y[k]);
//             dist = y[k] - y[i];
//           }
//         }
//       nearest_chord.add(Chord(i, dist));
//     }
//   }
//
// }