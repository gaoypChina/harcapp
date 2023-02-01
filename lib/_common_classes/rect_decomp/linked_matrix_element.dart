
class LinkedMatrixElement {

	// Position of the element in the matrix
	int row, col;

	// Pointers to the next elements
	LinkedMatrixElement? previousLeft, nextRight, previousUp, nextDown;

	// Value of the element
	bool value;

	LinkedMatrixElement(this.row, this.col, this.value);

	bool isNextElementDownConsecutive() {
		if (nextDown == null)
			return false;

		return nextDown!.value
				&& nextDown!.row == row + 1
				&& nextDown!.col == col;
	}

	bool isNextElementRightConsecutive() {
		if (nextRight == null)
			return false;

		return nextRight!.value
				&& nextRight!.row == row
				&& nextRight!.col == col + 1;
	}

	bool isNextElementDownConsecutiveNoValue() {
		if (nextDown == null)
			return false;

		return nextDown!.row == row + 1
				&& nextDown!.col == col;
	}

	bool isNextElementRightConsecutiveNoValue() {
		if (nextRight == null)
			return false;

		return nextRight!.row == row
				&& nextRight!.col == col + 1;
	}

	bool isNull() {
		return (nextDown == null) && (nextRight == null)
				&& (previousLeft == null) && (previousUp == null);
	}

	bool isNextElementUpConsecutive() {
		if (previousUp == null)
			return false;

		return previousUp!.row == row - 1
				&& previousUp!.col == col;
	}

	bool isPreviousElementLeftConsecutive() {
		if (previousLeft == null)
			return false;

		return previousLeft!.row == row
				&& previousLeft!.col == col - 1;
	}
}
