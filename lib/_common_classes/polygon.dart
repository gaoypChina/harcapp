import 'package:polybool/polybool.dart';

extension PolygonOperations on Polygon{

  static const delta = .000000001;

  void fix(){
    for(List<Coordinate> region in regions)
      if(region.first == region.last) region.removeLast();
  }

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

    fix();
    newPoly.fix();

    return equals(newPoly);
  }

  bool containsPoly(Polygon polygon){
    Polygon newPoly = copy().union(polygon);

    fix();
    newPoly.fix();

    return equals(newPoly);
  }

  bool get isEmpty => regions.isEmpty;
  bool get isNotEmpty => regions.isNotEmpty;

  bool equals(Polygon polygon){
    if(regions.length != polygon.regions.length) return false;
    for(int i=0; i<regions.length; i++){
      if(regions[i].length != polygon.regions[i].length) return false;
      for(int j=0; j<regions[i].length; j++){
        if(regions[i][j].x != polygon.regions[i][j].x) return false;
        if(regions[i][j].y != polygon.regions[i][j].y) return false;
      }
    }
    return true;
  }

}