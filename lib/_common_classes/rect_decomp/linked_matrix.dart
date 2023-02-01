import 'linked_matrix_element.dart';

class LinkedMatrix {

	late LinkedMatrixElement root;
	late int height;
	late int width;
	LinkedMatrixElement? largestRectangle;

	LinkedMatrix(List<List<bool>> matrix, {int x = -1, int y = -1}) {

		root = LinkedMatrixElement(-1, -1, false);
		height = matrix.length;
		width = matrix[height - 1].length;

		LinkedMatrixElement? current = null;
		LinkedMatrixElement? previous = null;
		LinkedMatrixElement? currentRequiringNextDown = null;
		bool startedSettingNextDownUp = false; // Used to saved void hits,
													// since setting is
													// guaranteed
													// to be done after
													// insertion of
													// the first line
		for (int i = 0; i < height; i++) {
			for (int j = 0; j < width; j++) {
				previous = current;
				current = LinkedMatrixElement(i, j, matrix[i][j]);
				if (i == 0 && j == 0) {
					if (x == i && j == y)
						largestRectangle = current;
					root.nextRight = current;
					current.previousLeft = root;
					currentRequiringNextDown = current;
				} else {
					if (x == i && j == y)
						largestRectangle = current;
					previous!.nextRight = current;
					current.previousLeft = previous;
					// Check for setting the next down Pointer of the current
					// element
					if (!startedSettingNextDownUp) {
						if (currentRequiringNextDown!.x == i - 1 && currentRequiringNextDown.y == j)
							startedSettingNextDownUp = true;
					}

					if (startedSettingNextDownUp) {
						currentRequiringNextDown!.nextDown = current;
						current.previousUp = currentRequiringNextDown;
						currentRequiringNextDown = currentRequiringNextDown.nextRight;
					}
				}
			}
		}
	}

	void removeRectangle(
			LinkedMatrixElement origin,
			int rectangleHeight,
			int rectangleWidth
	) {
		if (rectangleHeight == 1 && rectangleWidth == 1)
			deleteElement(origin);
		else {
			LinkedMatrixElement? current = origin;
			// Remove length elements for each line
			for (int i = 0; i < rectangleHeight; i++) {
				LinkedMatrixElement? next = current;
				if (!current!.isNextElementDownConsecutiveNoValue() && !(i == (rectangleHeight - 1))) {
					// System.exit(0);
					return;
				}
				current = current.nextDown;
				for (int j = 0; j < rectangleWidth; j++) {
					if (!next!.isNextElementRightConsecutiveNoValue() && !(j == (rectangleWidth - 1))) {
						// System.exit(0);
						return;
					}
					next = deleteElement(next);
				}
				// Go down a line
			}
		}

	}

	LinkedMatrixElement? deleteElement(LinkedMatrixElement current) {
		// Update the pointers
		if (current.nextDown != null)
			current.nextDown!.previousUp = current.previousUp;
		if (current.previousLeft != null)
			current.previousLeft!.nextRight = current.nextRight;
		if (current.previousUp != null)
			current.previousUp!.nextDown = current.nextDown;
		if (current.nextRight != null)
			current.nextRight!.previousLeft = current.previousLeft;

		LinkedMatrixElement? res = current.nextRight;
		current.nextDown = null;
		current.nextRight = null;
		current.previousLeft = null;
		current.previousUp = null;
		// current = null;
		return res;
	}

	LinkedMatrixElement? deleteZero(LinkedMatrixElement current) {
		// Update the pointers
		if (current.nextDown != null)
			current.nextDown!.previousUp = current.previousUp;
		if (current.previousLeft != null)
			current.previousLeft!.nextRight = current.nextRight;
		if (current.previousUp != null)
			current.previousUp!.nextDown = current.nextDown;
		if (current.nextRight != null) {
			current.nextRight!.previousLeft = current.previousLeft;
		}
		LinkedMatrixElement? res = current.previousLeft;
		current.nextDown = null;
		current.nextRight = null;
		current.previousLeft = null;
		current.previousUp = null;
		// current = null;
		return res;
	}

	LinkedMatrixElement getCurrentRoot() => root;

	LinkedMatrixElement? getFirstElement() => root.nextRight;

	bool isEmpty() => root.nextRight == null;

	int countElements() {
		LinkedMatrixElement? _tmp = getFirstElement();
		if (_tmp == null)
			return 0;
		int count = 1;
		while (_tmp != null) {
			count++;
			_tmp = _tmp.nextRight;
		}
		return count;
	}

}
