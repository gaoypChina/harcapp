// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read Lk_9_28b-36$text, and verify that the values of widget properties are correct.

import 'package:harcapp/_common_classes/rect_decomp/binary_matrix.dart';
import 'package:harcapp/_common_classes/rect_decomp/decomposition_result.dart';
import 'package:harcapp/_common_classes/rect_decomp/rectilinear_decomposer.dart';

import 'package:flutter_test/flutter_test.dart';


void main() {

  test('computeDecomposition', () async {
    TestWidgetsFlutterBinding.ensureInitialized(); // This is for enabling assets from tests.

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

    DecompositionResult result = RectilinearDecomposer(BinaryMatrix(data, 10, 10)).computeDecomposition(1);

    assert(result.rectangle[0].row == 0);
    assert(result.rectangle[0].col == 3);
    assert(result.rectangle[0].height == 10);
    assert(result.rectangle[0].width == 5);
    assert(result.rectangle[0].area == 50);

  });

}
