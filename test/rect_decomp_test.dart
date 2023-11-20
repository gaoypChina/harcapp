import 'dart:io';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/rect_decomp/binary_matrix.dart';
import 'package:harcapp/_common_classes/rect_decomp/decomposition_result.dart';
import 'package:harcapp/_common_classes/rect_decomp/rectilinear_decomposer.dart';

import 'package:flutter_test/flutter_test.dart';


void main() {

  test('computeDecomposition1', () async {

    List<List<bool>> data = [
      [0, 0, 0, 1, 1, 1, 1, 1, 0, 0].map((val) => val==1).toList(),
      [0, 0, 0, 1, 1, 1, 1, 1, 0, 0].map((val) => val==1).toList(),
      [0, 0, 0, 1, 1, 1, 1, 1, 0, 0].map((val) => val==1).toList(),
      [1, 1, 1, 1, 1, 1, 1, 1, 0, 0].map((val) => val==1).toList(),
      [1, 1, 1, 1, 1, 1, 1, 1, 0, 0].map((val) => val==1).toList(),
      [1, 1, 1, 1, 1, 1, 1, 1, 0, 0].map((val) => val==1).toList(),
      [0, 1, 1, 1, 1, 1, 1, 1, 0, 0].map((val) => val==1).toList(),
      [0, 1, 1, 1, 1, 1, 1, 1, 1, 1].map((val) => val==1).toList(),
      [0, 1, 1, 1, 1, 1, 1, 1, 1, 1].map((val) => val==1).toList(),
      [0, 1, 1, 1, 1, 1, 1, 1, 1, 1].map((val) => val==1).toList(),
    ];

    DecompositionResult result = RectilinearDecomposer(data).run(1);

    assert(result.rectangles[0].row == 0);
    assert(result.rectangles[0].col == 3);
    assert(result.rectangles[0].height == 10);
    assert(result.rectangles[0].width == 5);
    assert(result.rectangles[0].area == 50);

  });

  test('computeDecomposition2', () async {

    List<List<bool>> data = [
      [1, 0, 1, 0, 1, 1, 0].map((val) => val==1).toList(),
      [1, 1, 1, 1, 1, 1, 1].map((val) => val==1).toList(),
      [1, 1, 0, 0, 1, 0, 1].map((val) => val==1).toList(),
      [0, 1, 1, 1, 1, 0, 1].map((val) => val==1).toList(),
      [1, 1, 1, 1, 1, 0, 1].map((val) => val==1).toList(),
      [1, 1, 1, 1, 1, 0, 0].map((val) => val==1).toList(),
      [0, 1, 1, 0, 0, 1, 1].map((val) => val==1).toList(),
    ];

    DecompositionResult result = RectilinearDecomposer(data).run(1);

    assert(result.rectangles[0].row == 1);
    assert(result.rectangles[0].col == 0);
    assert(result.rectangles[0].height == 1);
    assert(result.rectangles[0].width == 7);
    assert(result.rectangles[0].area == 7);

  });

  test('computeDecompositionFindBugsOptim', () async {

    // If this test works, it never ends.

    int resArea = 0;
    int matrixArea = 0;
    late BinaryMatrix matrix;
    try{
      do {
        matrix = BinaryMatrix.random(row: 7, col: 7,  ratio: .7);
        matrixArea = matrix.numberOfOnes;
        RectilinearDecomposer optim1 = RectilinearDecomposer(matrix.matrix);
        DecompositionResult result = optim1.run(1);
        resArea = result.totalArea();
      } while (resArea == matrixArea);
    } finally {
      File file = File('computeDecompositionFindBugsOptim.txt');
      IOSink sink = file.openWrite();
      for(int i=0; i<matrix.row; i++) {
        sink.write('${matrix.matrix[i].join(" ")}\n');
        debugPrint(matrix.matrix[i].map((v) => v?1:0).join(" "));
      }
      sink.close();

      assert(false);
    }

  });

}
