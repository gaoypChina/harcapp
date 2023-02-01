import 'dart:core';

class SortableRectangle implements Comparable<SortableRectangle> {

	int row;
	int col;
	int width;
	int height;
	int area;

	SortableRectangle(this.row, this.col, this.width, this.height):
		area = width * height;

	// Descending order
	// Returns:
	// the value 0 if x == y; a value less than 0 if x < y; and a value greater than 0 if x > y
	@override
  int compareTo(SortableRectangle rect) {
		return rect.area - area;
	}

	bool merged(SortableRectangle sortableRectangle) {
		if (isSimplyVerticallyMergeable(sortableRectangle)) {
			height += sortableRectangle.height;

			return true;
		} else if (isSimplyHorizontallyMergeable(sortableRectangle)) {
			width += sortableRectangle.width;
			return true;
		}
		return false;
	}

	bool isSimplyVerticallyMergeable(
			SortableRectangle sortableRectangle) {
		return (width == sortableRectangle.width
				&& col == sortableRectangle.col && (row + height) == sortableRectangle.row);

	}

	bool isSimplyHorizontallyMergeable(
			SortableRectangle sortableRectangle) {
		return (height == sortableRectangle.height
				&& row == sortableRectangle.row && (col + width) == sortableRectangle.col);
	}

	bool intersects(SortableRectangle r) {
		int tw = width;
		int th = height;
		int rw = r.width;
		int rh = r.height;
		if (rw <= 0 || rh <= 0 || tw <= 0 || th <= 0) {
			return false;
		}
		int tx = row;
		int ty = col;
		int rx = r.row;
		int ry = r.col;
		rw += rx;
		rh += ry;
		tw += tx;
		th += ty;
		//      overflow || intersect
		return ((rw < rx || rw > tx) &&
				(rh < ry || rh > ty) &&
				(tw < tx || tw > rx) &&
				(th < ty || th > ry));
	}

}
