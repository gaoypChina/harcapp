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

    DecompositionResult result = RectilinearDecomposer(data).run(1);

    assert(result.rectangles[0].row == 0);
    assert(result.rectangles[0].col == 3);
    assert(result.rectangles[0].height == 10);
    assert(result.rectangles[0].width == 5);
    assert(result.rectangles[0].area == 50);

  });

}
