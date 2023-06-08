import 'package:flutter_test/flutter_test.dart';
import 'package:harcapp/_common_classes/polygon.dart';
import 'package:polybool/polybool.dart';


void main() {

  test('polygonInsidePolygonUnionTest', () async {

    Polygon polyBig = Polygon(regions: [
      [
        Coordinate(10, 10),
        Coordinate(10, 0),
        Coordinate(0, 0),
        Coordinate(0, 10),
      ]
    ]);

    Polygon polySmall = Polygon(regions: [
      [
        Coordinate(1, 1),
        Coordinate(1, 0),
        Coordinate(0, 0),
        Coordinate(0, 1),
      ]
    ]);

    Polygon polyUnion = polyBig.copy().union(polySmall);

    assert(polyUnion.regions.length == polyBig.regions.length);
    assert(polyUnion.regions.length == 1);
    for(int i=0; i<polyUnion.regions[0].length; i++) {
      assert(polyUnion.regions[0][i].x == polyBig.regions[0][i].x);
      assert(polyUnion.regions[0][i].y == polyBig.regions[0][i].y);
    }
  });

  test('polygonWithHoleWithAPolygonInsideTest', () async {

    Polygon polyOut = Polygon(regions: [
      [
        Coordinate(10, 10),
        Coordinate(10, 0),
        Coordinate(0, 0),
        Coordinate(0, 10),
      ]
    ]);

    Polygon polyIn = Polygon(regions: [
      [
        Coordinate(9, 9),
        Coordinate(9, 1),
        Coordinate(1, 1),
        Coordinate(1, 9),
      ]
    ]);

    Polygon polySquareWithHoleSubtracted = polyOut.difference(polyIn);

    assert(polySquareWithHoleSubtracted.regions.length == 2);

    Polygon polySmallIn = Polygon(regions: [
      [
        Coordinate(5, 5),
        Coordinate(5, 4),
        Coordinate(4, 4),
        Coordinate(4, 5),
      ]
    ]);

    Polygon resultPolygon = polySquareWithHoleSubtracted.copy().union(polySmallIn);

    assert(resultPolygon.regions.length == 3);

  });

  test('polygonTwoSeparateItemsTest', () async {

    Polygon polyTall = Polygon(regions: [
      [
        Coordinate(1, 10),
        Coordinate(1, 0),
        Coordinate(0, 0),
        Coordinate(0, 10),
      ]
    ]);

    assert(polyTall.regions.length == 1);
    assert(polyTall.regions[0].length == 4);

    Polygon polyWide = Polygon(regions: [
      [
        Coordinate(10, 1),
        Coordinate(0, 1),
        Coordinate(0, 0),
        Coordinate(10, 0),

      ]
    ]);

    assert(polyWide.regions.length == 1);
    assert(polyWide.regions[0].length == 4);

    Polygon polyL = polyTall.union(polyWide);

    assert(polyL.regions.length == 1);
    assert(polyL.regions[0].length == 6);

  });

  test('polygonWithHoleTest', () async {

    Polygon polyTallLeft = Polygon(regions: [
      [
        Coordinate(1, 10),
        Coordinate(1, 0),
        Coordinate(0, 0),
        Coordinate(0, 10),
      ]
    ]);

    Polygon polyTallRight = Polygon(regions: [
      [
        Coordinate(10, 10),
        Coordinate(10, 0),
        Coordinate(9, 0),
        Coordinate(9, 10),
      ]
    ]);

    Polygon polyWideBottom = Polygon(regions: [
      [
        Coordinate(10, 1),
        Coordinate(10, 0),
        Coordinate(0, 0),
        Coordinate(0, 1),
      ]
    ]);

    Polygon polyWideTop = Polygon(regions: [
      [
        Coordinate(10, 10),
        Coordinate(10, 9),
        Coordinate(0, 9),
        Coordinate(0, 10),
      ]
    ]);

    Polygon polyU = polyTallLeft.union(polyTallRight).union(polyWideBottom);

    assert(polyU.regions.length == 1);
    assert(polyU.regions[0].length == 8);

    // Add top bar.
    Polygon polySquareWithHoleConstructed = polyU.union(polyWideTop);

    Polygon polyOut = Polygon(regions: [
      [
        Coordinate(10, 10),
        Coordinate(10, 0),
        Coordinate(0, 0),
        Coordinate(0, 10),
      ]
    ]);

    Polygon polyIn = Polygon(regions: [
      [
        Coordinate(9, 9),
        Coordinate(9, 1),
        Coordinate(1, 1),
        Coordinate(1, 9),
      ]
    ]);

    Polygon polySquareWithHoleSubtracted = polyOut.difference(polyIn);

    assert(polySquareWithHoleConstructed.regions.length == polySquareWithHoleSubtracted.regions.length);
    assert(polySquareWithHoleConstructed.regions.length == 2);
    assert(polySquareWithHoleConstructed.regions[0].length == polySquareWithHoleSubtracted.regions[0].length);
    assert(polySquareWithHoleConstructed.regions[1].length == polySquareWithHoleSubtracted.regions[1].length);

  });

  test('polygonDifferenceAndUnionResultInOriginalPolygonTest', () async {

    Polygon polyOut = Polygon(regions: [
      [
        Coordinate(10, 10),
        Coordinate(10, 0),
        Coordinate(0, 0),
        Coordinate(0, 10),
      ]
    ]);

    Polygon polyIn = Polygon(regions: [
      [
        Coordinate(9, 9),
        Coordinate(9, 1),
        Coordinate(1, 1),
        Coordinate(1, 9),
      ]
    ]);

    Polygon polySquareWithHoleSubtracted = polyOut.copy().difference(polyIn);

    Polygon newPolygon = polySquareWithHoleSubtracted.union(polyIn);

    assert(newPolygon.regions.length == polyOut.regions.length);
    assert(newPolygon.regions.length == 1);

    for(int i=0; i<newPolygon.regions[0].length; i++){
      assert(newPolygon.regions[0][i].x == polyOut.regions[0][i].x);
      assert(newPolygon.regions[0][i].y == polyOut.regions[0][i].y);
    }

    int a = 0;

  });

  test('polygonContainsCoordTest', () async {

    Polygon polyOut = Polygon(regions: [
      [
        Coordinate(10, 10),
        Coordinate(10, 0),
        Coordinate(0, 0),
        Coordinate(0, 10),
      ]
    ]);

    Polygon polyIn = Polygon(regions: [
      [
        Coordinate(9, 9),
        Coordinate(9, 1),
        Coordinate(1, 1),
        Coordinate(1, 9),
      ]
    ]);

    Polygon polySquareWithHole = polyOut.copy().difference(polyIn);

    assert(polyOut.contains(5, 5));
    assert(!polySquareWithHole.contains(5, 5));

  });

  test('polygonUnionOnEmptyTest', () async {

    Polygon polyEmpty = Polygon(regions: []);

    Polygon polySomething = Polygon(regions: [
      [
        Coordinate(9, 9),
        Coordinate(9, 1),
        Coordinate(1, 1),
        Coordinate(1, 9),
      ]
    ]);

    Polygon polyResult = polyEmpty.union(polySomething);

    assert(polyResult.regions.length == polySomething.regions.length);

  });


  test('polygonContainsPoly', () async {

      Polygon polyOut = Polygon(regions: [
        [
          Coordinate(10, 10),
          Coordinate(10, 0),
          Coordinate(0, 0),
          Coordinate(0, 10),
        ]
      ]);

      Polygon polyIn = Polygon(regions: [
        [
          Coordinate(9, 9),
          Coordinate(9, 1),
          Coordinate(1, 1),
          Coordinate(1, 9),
        ]
      ]);

      assert(polyOut.containsPoly(polyIn));

  });

  test('polygonContainsPoly_Pertruding', () async {

    Polygon polyOut = Polygon(regions: [
      [
        Coordinate(10, 10),
        Coordinate(10, 0),
        Coordinate(0, 0),
        Coordinate(0, 10),
      ]
    ]);

    Polygon polyIn = Polygon(regions: [
      [
        Coordinate(9, 9),
        Coordinate(9, -1),
        Coordinate(1, -1),
        Coordinate(1, 9),
      ]
    ]);

    assert(!polyOut.containsPoly(polyIn));

  });

  test('polygonContainsPoly_Self', () async {

    Polygon poly = Polygon(regions: [
      [
        Coordinate(10, 10),
        Coordinate(10, 0),
        Coordinate(0, 0),
        Coordinate(0, 10),
      ]
    ]);

    assert(poly.containsPoly(poly));

  });

}
