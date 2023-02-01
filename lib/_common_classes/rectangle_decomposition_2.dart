// import 'dart:math';
//
// import 'package:interval_tree/interval_tree.dart';
//
// class Vertex{
//
//   var point;
//   var path;
//   var index;
//   var concave;
//   var next;
//   var prev;
//   var visited;
//
//   Vertex({
//     required this.point,
//     required this.path,
//     required this.index,
//     required this.concave
//   }):
//     next = null,
//     prev = null,
//     visited = null;
//
// }
//
// class Segment{
//
//   Vertex start;
//   Vertex end;
//   var direction;
//   var number;
//
//   var a;
//   var b;
//
//   Segment({
//     required this.start,
//     required this.end,
//     required this.direction
//   }):
//         number = -1,
//         a = start.point[direction^1],
//         b = end.point[direction^1];
//
// }
//
// bool testSegment(var a, var b, IntervalTree tree, var direction) {
//   var ax = a.point[direction^1];
//   var bx = b.point[direction^1];
//   tree.
//   return !!tree.queryPoint(a.point[direction], function(s) {
//     var x = s.start.point[direction^1];
//     if(ax < x && x < bx)
//       return true;
//
//     return false;
//   });
// }
//
// getDiagonals(var vertices, var paths, var direction, var tree) {
//   var concave = [];
//   for(var i=0; i<vertices.length; ++i)
//     if(vertices[i].concave)
//       concave.add(vertices[i]);
//
//   concave.sort((a,b) {
//     var d = a.point[direction] - b.point[direction];
//     if(d) return d;
//     return a.point[direction^1] - b.point[direction^1];
//   });
//
//   var diagonals = [];
//
//   for(var i=1; i<concave.length; ++i) {
//     var a = concave[i-1];
//     var b = concave[i];
//     if(a.point[direction] == b.point[direction]) {
//       if(a.path == b.path) {
//         var n = paths[a.path].length;
//         var d = (a.index-b.index+n) % n;
//         if(d == 1 || d == n-1)
//           continue;
//
//       }
//       if(!testSegment(a, b, tree, direction))
//         //Check orientation of diagonal
//         diagonals.add(Segment(
//             start: a,
//             end: b,
//             direction: direction
//         ));
//
//     }
//   }
//   return diagonals;
// }
//
// //Find all crossings between diagonals
// findCrossings(hdiagonals, vdiagonals) {
//   var htree = IntervalTree(hdiagonals);
//   var crossings = [];
//   for(var i=0; i<vdiagonals.length; ++i) {
//     var v = vdiagonals[i];
//     htree.queryPoint(v.start.point[1], function(h) {
//     var x = h.start.point[0];
//     if(v[0] <= x && x <= v[1])
//     crossings.add([h, v]);
//     });
//   }
//   return crossings;
// }
//
// findSplitters(hdiagonals, vdiagonals) {
//   //First find crossings
//   var crossings = findCrossings(hdiagonals, vdiagonals);
//
//   //Then tag and convert edge format
//   for(var i=0; i<hdiagonals.length; ++i)
//     hdiagonals[i].number = i;
//
//   for(var i=0; i<vdiagonals.length; ++i)
//     vdiagonals[i].number = i;
//
//   var edges = crossings.map((c) => [ c[0].number, c[1].number ]).toList();
//
//   //Find independent set
//   var selected = bipartiteIndependentSet(hdiagonals.length, vdiagonals.length, edges);
//
//   //Convert into result format
//   var result = Array(selected[0].length + selected[1].length);
//   var ptr = 0;
//   for(var i=0; i<selected[0].length; ++i)
//     result[ptr++] = hdiagonals[selected[0][i]];
//
//   for(var i=0; i<selected[1].length; ++i)
//     result[ptr++] = vdiagonals[selected[1][i]];
//
//   //Done
//   return result;
// }
//
// splitSegment(Segment segment) {
//   //Store references
//   var a = segment.start;
//   var b = segment.end;
//   var pa = a.prev;
//   var na = a.next;
//   var pb = b.prev;
//   var nb = b.next;
//
//   //Fix concavity
//   a.concave = false;
//   b.concave = false;
//
//   //Compute orientation
//   var ao = pa.point[segment.direction] == a.point[segment.direction];
//   var bo = pb.point[segment.direction] == b.point[segment.direction];
//
//   if(ao && bo) {
//     //Case 1:
//     //            ^
//     //            |
//     //  --->A+++++B<---
//     //      |
//     //      V
//     a.prev = pb;
//     pb.next = a;
//     b.prev = pa;
//     pa.next = b;
//   } else if(ao && !bo) {
//     //Case 2:
//     //      ^     |
//     //      |     V
//     //  --->A+++++B--->
//     //
//     //
//     a.prev = b;
//     b.next = a;
//     pa.next = nb;
//     nb.prev = pa;
//   } else if(!ao && bo) {
//     //Case 3:
//     //
//     //
//     //  <---A+++++B<---
//     //      ^     |
//     //      |     V
//     a.next = b;
//     b.prev = a;
//     na.prev = pb;
//     pb.next = na;
//
//   } else if(!ao && !bo) {
//     //Case 3:
//     //            |
//     //            V
//     //  <---A+++++B--->
//     //      ^
//     //      |
//     a.next = nb;
//     nb.prev = a;
//     b.next = na;
//     na.prev = b;
//   }
// }
//
// List<List<Vertex>> findLoops(List<Vertex> vertices) {
//   //Initialize visit flag
//   for(var i=0; i<vertices.length; ++i)
//     vertices[i].visited = false;
//
//   //Walk over vertex list
//   List<List<Vertex>> loops = [];
//   for(var i=0; i<vertices.length; ++i) {
//     Vertex v = vertices[i];
//     if(v.visited)
//       continue;
//
//     //Walk along loop
//     List<Vertex> loop = [];
//     while(!v.visited) {
//       loop.add(v);
//       v.visited = true;
//       v = v.next;
//     }
//     loops.add(loop);
//   }
//   return loops;
// }
//
//
// splitConcave(vertices) {
//   //First step: build segment tree from vertical segments
//   List<Segment> leftSegments = [];
//   List<Segment> rightSegments = [];
//   for(var i=0; i<vertices.length; ++i) {
//     Vertex v = vertices[i];
//     if(v.next.point[1] == v.point[1]) {
//       if(v.next.point[0] < v.point[0])
//         leftSegments.add(Segment(start: v, end: v.next, direction: 1));
//       else
//         rightSegments.add(Segment(start: v, end: v.next, direction: 1));
//     }
//   }
//   var lefttree = IntervalTree(leftSegments);
//   var righttree = IntervalTree(rightSegments);
//   for(var i=0; i<vertices.length; ++i) {
//     Vertex v = vertices[i];
//     if(!v.concave)
//       continue;
//
//     //Compute orientation
//     var y = v.point[1];
//     var direction;
//     if(v.prev.point[0] == v.point[0])
//       direction = v.prev.point[1] < y;
//     else
//       direction = v.next.point[1] < y;
//
//     direction = direction ? 1 : -1;
//
//     //Scan a horizontal ray
//     var closestSegment = null;
//     var closestDistance = double.infinity * direction;
//     if(direction < 0) {
//       righttree.queryPoint(v.point[0], function(h) {
//         var x = h.start.point[1];
//         if(x < y && x > closestDistance) {
//           closestDistance = x;
//           closestSegment = h;
//         }
//       });
//     } else {
//       lefttree.queryPoint(v.point[0], function(h) {
//         var x = h.start.point[1];
//         if(x > y && x < closestDistance) {
//           closestDistance = x;
//           closestSegment = h;
//         }
//       });
//     }
//
//     //Create two splitting vertices
//     var splitA = Vertex(point: [v.point[0], closestDistance], path: 0, index: 0, concave: false);
//     var splitB = Vertex(point: [v.point[0], closestDistance], path: 0, index: 0, concave: false);
//
//     //Clear concavity flag
//     v.concave = false;
//
//     //Split vertices
//     splitA.prev = closestSegment.start;
//     closestSegment.start.next = splitA;
//     splitB.next = closestSegment.end;
//     closestSegment.end.prev = splitB;
//
//     //Update segment tree
//     var tree;
//     if(direction < 0) {
//       tree = righttree;
//     } else {
//       tree = lefttree;
//     }
//     tree.remove(closestSegment);
//     tree.insert(Segment(start: closestSegment.start, end: splitA, direction: 1));
//     tree.insert(Segment(start: splitB, end: closestSegment.end, direction: 1));
//
//     //Append vertices
//     vertices.push(splitA, splitB);
//
//     //Cut v, 2 different cases
//     if(v.prev.point[0] == v.point[0]) {
//       // Case 1
//       //             ^
//       //             |
//       // --->*+++++++X
//       //     |       |
//       //     V       |
//       splitA.next = v;
//       splitB.prev = v.prev;
//     } else {
//       // Case 2
//       //     |       ^
//       //     V       |
//       // <---*+++++++X
//       //             |
//       //             |
//       splitA.next = v.next;
//       splitB.prev = v;
//     }
//
//     //Fix up links
//     splitA.next.prev = splitA;
//     splitB.prev.next = splitB;
//   }
// }
//
// findRegions(var vertices) {
//   var n = vertices.length;
//   for(var i=0; i<n; ++i) {
//     vertices[i].visited = false;
//   }
//   //Walk over vertex list
//   var rectangles = [];
//   for(var i=0; i<n; ++i) {
//     Vertex v = vertices[i];
//     if(v.visited)
//       continue;
//
//     //Walk along loop
//     var lo = [double.infinity, double.infinity];
//     var hi = [double.negativeInfinity, double.negativeInfinity];
//     while(!v.visited) {
//       for(var j=0; j<2; ++j) {
//         lo[j] = min(v.point[j], lo[j]);
//         hi[j] = max(v.point[j], hi[j]);
//       }
//       v.visited = true;
//       v = v.next;
//     }
//     rectangles.add([lo, hi]);
//   }
//   return rectangles;
// }
//
//
// decomposeRegion(List<List<Vertex>> paths, clockwise) { // List<Vertex> added by me
//   if(!Array.isArray(paths))
//     throw Exception("rectangle-decomposition: Must specify list of loops")
//
//   //Coerce to boolean type
//   clockwise = !!clockwise;
//
//   //First step: unpack all vertices into internal format
//   var vertices = [];
//   var ptr = 0;
//   var npaths = Array(paths.length);
//   for(var i=0; i<paths.length; ++i) {
//     var path = paths[i];
//     if(!Array.isArray(path)) {
//       throw new Exception("rectangle-decomposition: Loop must be array type");
//     }
//     var n = path.length;
//     var prev = path[n-3];
//     var cur = path[n-2];
//     var next = path[n-1];
//     npaths[i] = [];
//     for(var j=0; j<n; ++j) {
//       prev = cur;
//       cur = next;
//       next = path[j];
//       if(!Array.isArray(next) || next.length != 2) {
//         throw Exception("rectangle-decomposition: Must specify list of loops");
//       }
//       var concave = false;
//       if(prev[0] == cur[0]) {
//         if(next[0] == cur[0])
//           continue;
//
//         var dir0 = prev[1] < cur[1];
//         var dir1 = cur[0] < next[0];
//         concave = dir0 == dir1;
//       } else {
//         if(next[1] == cur[1])
//           continue;
//
//         var dir0 = prev[0] < cur[0];
//         var dir1 = cur[1] < next[1];
//         concave = dir0 != dir1;
//       }
//       if(clockwise)
//         concave = !concave;
//
//       Vertex vtx = Vertex(
//           point: cur,
//           path: i,
//           index: (j + n - 1)%n,
//           concave: concave
//       );
//       npaths[i].push(vtx);
//       vertices.add(vtx);
//     }
//   }
//
//   //Next build interval trees for segments, link vertices into a list
//   var hsegments = [];
//   var vsegments = [];
//   for(var i=0; i<npaths.length; ++i) {
//     var p = npaths[i];
//     for(var j=0; j<p.length; ++j) {
//       var a = p[j];
//       var b = p[(j+1)%p.length];
//       if(a.point[0] == b.point[0]) {
//         hsegments.add(Segment(start: a, end: b, direction: 0));
//       } else {
//         vsegments.add(Segment(start: a, end: b, direction: 1));
//       }
//       if(clockwise) {
//         a.prev = b;
//         b.next = a;
//       } else {
//         a.next = b;
//         b.prev = a;
//       }
//     }
//   }
//   var htree = createIntervalTree(hsegments);
//   var vtree = createIntervalTree(vsegments);
//
//   //Find horizontal and vertical diagonals
//   var hdiagonals = getDiagonals(vertices, npaths, 0, vtree);
//   var vdiagonals = getDiagonals(vertices, npaths, 1, htree);
//
//   //Find all splitting edges
//   var splitters = findSplitters(hdiagonals, vdiagonals);
//
//   //Cut all the splitting diagonals
//   for(var i=0; i<splitters.length; ++i)
//     splitSegment(splitters[i]);
//
//   //Split all concave vertices
//   splitConcave(vertices);
//
//   //Return regions
//   return findRegions(vertices);
// }