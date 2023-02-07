import 'linked_matrix_element.dart';

class TemporaryRectangle {

	int _height, _width, _area; // rectangle values
	LinkedMatrixElement upperLeftCorner;
	LinkedMatrixElement currentPosition;
	LinkedMatrixElement? restartingPoint;
	LinkedMatrixElement lastLineFirstElement;
	bool? hasUpdatedWidth;
	int? previousLargestArea;
	int potentialSecondArea = -1;// Potential area after cut
	bool validated = false;

	TemporaryRectangle(int height, int width, int area,
			this.upperLeftCorner,
			this.currentPosition,
			this.restartingPoint
	): _height = height,
				_width = width,
				_area = area,
				lastLineFirstElement = upperLeftCorner;

	void updateWidth(int newWidth) {
		hasUpdatedWidth = true;
		previousLargestArea = _area;
		_width = newWidth;
		_area = height * width;
	}

	int get height => _height;

	set height(int value) {
		_height = value;
		_area = _height * _width;
	}

	int get width => _width;

	set width(int value){
		_width = value;
		_area = height * width;
	}

	int get area => _area;

	set area(int value) {
		if (value == 0)
			throw Exception("Area cannot be set to 0");
		_area = value;
	}

	void updateWithLastGoodPoint() {
		_height = currentPosition.row - upperLeftCorner.row + 1;
		_width = currentPosition.col - upperLeftCorner.col + 1;
		_area = height * width;
	}

}
