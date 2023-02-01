import 'dart:core';

class BinaryMatrix {

  double ratio = 0.7;

  List<List<bool>> matrix;

  int row;
  int col;

  int numberOfOnes = -1;

  BinaryMatrix(this.matrix, this.row, this.col) {
    numberOfOnes = 0;
    for (int i = 0; i < row; i++)
      for (int j = 0; j < col; j++)
        numberOfOnes += matrix[i][j] ? 1 : 0;
  }

  BinaryMatrix copy() {
    List<List<bool>> myCopy = [];
    for (int i = 0; i < row; i++)
      myCopy[i] = List.of(matrix[i]);

    return BinaryMatrix(myCopy, row, col);
  }

  BinaryMatrix difference(BinaryMatrix m) {

    List<List<bool>> newMatrix = List.generate(row, (_) => List.filled(col, false));

    for (int i = 0; i < row; i++)
      for (int j = 0; j < col; j++)
        newMatrix[i][j] = matrix[i][j] != m.matrix[i][j];

    return BinaryMatrix(newMatrix, row, col);
  }

}
