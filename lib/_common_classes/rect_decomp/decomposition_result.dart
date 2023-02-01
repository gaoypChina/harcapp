
import 'dart:core';

import 'package:harcapp/_common_classes/rect_decomp/sortable_rectangle.dart';

import 'binary_matrix.dart';

class DecompositionResult {

	List<SortableRectangle> rectangle;
	int numberOfOnes;

	DecompositionResult(this.rectangle, this.numberOfOnes);

	double quality() {
		int total = 0;
		for (SortableRectangle rect in rectangle)
			total += rect.area;
		return total.toDouble() / (rectangle.length);
	}

	int totalArea() {
		int total = 0;
		for (SortableRectangle rect in rectangle)
			total += rect.area;
		return total;
	}

	BinaryMatrix reconstructMatrix(int height, int width) {
		List<List<bool>> matrix = List.generate(height, (_) => List.filled(width, false));
		for (SortableRectangle rect in rectangle)
			addRectangle(rect, matrix);

		return BinaryMatrix(matrix, height, width);
	}

	void addRectangle(SortableRectangle rect, List<List<bool>> matrix) {
		int startX = rect.row;
		int startY = rect.col;
		int width = rect.width;
		int height = rect.height;
		for (int i = 0; i < height; i++)
			for (int j = 0; j < width; j++)
				matrix[startX + i][startY + j] = true;

	}

	List<SortableRectangle> overlappingRectangles() {
		List<SortableRectangle> result = [];
		List<SortableRectangle> array1 = List.of(rectangle);
		for (int i = 0; i < array1.length; i++)
			for (int j = i + 1; j < array1.length; j++) {
				if (array1[i].intersects(array1[j])) {
					result.add(array1[i]);
					result.add(array1[j]);
				}
			}

		return result;
	}

}
