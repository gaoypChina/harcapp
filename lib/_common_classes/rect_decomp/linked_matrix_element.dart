
class LinkedMatrixElement {

	// Position of the element in the matrix
	int x, y;

	// Pointers to the next elements
	LinkedMatrixElement? previousLeft, nextRight, previousUp, nextDown;

	// Value of the element
	bool value;

	LinkedMatrixElement(this.x, this.y, this.value);

	bool isNextElementDownConsecutive() {
		if (nextDown == null)
			return false;

		return nextDown!.value
				&& nextDown!.x == x + 1
				&& nextDown!.y == y;
	}

	bool isNextElementRightConsecutive() {
		if (nextRight == null)
			return false;

		return nextRight!.value
				&& nextRight!.x == x
				&& nextRight!.y == y + 1;
	}

	bool isNextElementDownConsecutiveNoValue() {
		if (nextDown == null)
			return false;

		return nextDown!.x == x + 1
				&& nextDown!.y == y;
	}

	bool isNextElementRightConsecutiveNoValue() {
		if (nextRight == null)
			return false;

		return nextRight!.x == x
				&& nextRight!.y == y + 1;
	}

	bool isNull() {
		return (nextDown == null) && (nextRight == null)
				&& (previousLeft == null) && (previousUp == null);
	}

	bool isNextElementUpConsecutive() {
		if (previousUp == null)
			return false;

		return previousUp!.x == x - 1
				&& previousUp!.y == y;
	}

	bool isPreviousElementLeftConsecutive() {
		if (previousLeft == null)
			return false;

		return previousLeft!.x == x
				&& previousLeft!.y == y - 1;
	}
}
