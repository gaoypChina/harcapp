import 'dart:core';
import 'dart:math';

class BinaryMatrix {

  List<List<bool>> matrix;

  late int row;
  late int col;

  int numberOfOnes = -1;

  BinaryMatrix(this.matrix) {
    numberOfOnes = 0;
    row = matrix.length;
    col = matrix[0].length;
    for (int i = 0; i < row; i++)
      for (int j = 0; j < col; j++)
        numberOfOnes += matrix[i][j] ? 1 : 0;
  }

  BinaryMatrix copy() {
    List<List<bool>> myCopy = [];
    for (int i = 0; i < row; i++)
      myCopy[i] = List.of(matrix[i]);

    return BinaryMatrix(myCopy);
  }

  BinaryMatrix difference(BinaryMatrix m) {

    List<List<bool>> newMatrix = List.generate(row, (_) => List.filled(col, false));

    for (int i = 0; i < row; i++)
      for (int j = 0; j < col; j++)
        newMatrix[i][j] = matrix[i][j] != m.matrix[i][j];

    return BinaryMatrix(newMatrix);
  }

  static BinaryMatrix random({
    required int row,
    required int col,
    required double ratio
  }) {
    List<List<bool>> matrix = List.generate(row, (_) => List.filled(col, false));
    Random r = Random();
    for (int i = 0; i < row; i++)
      for (int j = 0; j < col; j++)
        matrix[i][j] = r.nextDouble() < ratio;

    return BinaryMatrix(matrix);
  }

}
