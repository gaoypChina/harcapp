import 'package:polybool/polybool.dart';

extension PolygonOperations on Polygon{

  static const delta = .000000001;

  Polygon copy(){
    return Polygon(regions: List.generate(regions.length, (i) => List.of(regions[i])));
  }

  bool contains(double x, double y){
    Polygon point = Polygon(regions: [[
      Coordinate(x, y),
      Coordinate(x + delta, y),
      Coordinate(x, y + delta)
    ]]);
    Polygon newPoly = copy().union(point);

    return regions.length == newPoly.regions.length;
  }

  bool get isEmpty => regions.isEmpty;
  bool get isNotEmpty => regions.isNotEmpty;
}