import 'dart:core';

import '../temporary_rectangle.dart';
import 'custom_deque.dart';

class RectangleDeque {

	int width;
	int height;

	late CustomDeque<TemporaryRectangle> queue;

	RectangleDeque(this.width, this.height) {
		queue = CustomDeque((width * height / 2).floor());
	}

	bool isSimplyHorizontallyMergeable() {
		if (queue.length >= 2) {

			TemporaryRectangle last = queue.peek()!;
			TemporaryRectangle secondLast = queue.peekSecondLast()!;

			if (last.height > 1 && last.currentPosition.row > secondLast.currentPosition.row)
				return false;
			return (last.height == secondLast.height && (last.upperLeftCorner.row == secondLast.upperLeftCorner.row));
		} else
			return false;
	}

	bool isHorizontallyMergeable() {
		if (queue.length >= 2) {

			TemporaryRectangle last = queue.peek()!;
			TemporaryRectangle secondLast = queue.peekSecondLast()!;

			if (last.height > 1 && last.currentPosition.row > secondLast.currentPosition.row)
				return false;
			return (last.height == secondLast.height && (last.upperLeftCorner.row == secondLast.upperLeftCorner.row)
					&& last.upperLeftCorner.isPreviousElementLeftConsecutive() && secondLast.currentPosition.isNextElementRightConsecutive());
		} else
			return false;
	}

	bool isSimplyVerticallyMergeable() {
		if (queue.length >= 2) {
			TemporaryRectangle last = queue.peek()!;
			TemporaryRectangle secondLast = queue.peekSecondLast()!;
			return ((last.width == secondLast.width) && (last.upperLeftCorner.col == secondLast.upperLeftCorner.col));
		} else {
			return false;
		}
	}

	bool isVerticallyMergeable() {
		if (queue.length >= 2) {
			TemporaryRectangle last = queue.peek()!;
			TemporaryRectangle secondLast = queue.peekSecondLast()!;
			return ((last.width == secondLast.width) && (last.upperLeftCorner.col == secondLast.upperLeftCorner.col)
					&& last.upperLeftCorner.isNextElementUpConsecutive() && secondLast.lastLineFirstElement.isNextElementDownConsecutive());
		} else {
			return false;
		}
	}

	TemporaryRectangle? secondPeek() => queue.peekSecondLast();

	void add(TemporaryRectangle rect) => queue.add(rect);

	int get length => queue.length;

	TemporaryRectangle? peek() => queue.peek();

	TemporaryRectangle? poll() => queue.poll();

}
