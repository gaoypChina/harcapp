import 'dart:core';

class SortableRectangle implements Comparable<SortableRectangle> {

	int x;
	int y;
	int width;
	int height;
	int area;

	SortableRectangle(this.x, this.y, this.width, this.height):
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
			this.height += sortableRectangle.height;

			return true;
		} else if (isSimplyHorizontallyMergeable(sortableRectangle)) {
			this.width += sortableRectangle.width;
			return true;
		}
		return false;
	}

	bool isSimplyVerticallyMergeable(
			SortableRectangle sortableRectangle) {
		return ((this.width == sortableRectangle.width)
				&& (this.y) == sortableRectangle.y && (this.x + this.height) == sortableRectangle.x);

	}

	bool isSimplyHorizontallyMergeable(
			SortableRectangle sortableRectangle) {
		return ((this.height == sortableRectangle.height)
				&& (this.x) == sortableRectangle.x && (this.y + this.width) == sortableRectangle.y);
	}

	bool intersects(SortableRectangle r) {
		int tw = width;
		int th = height;
		int rw = r.width;
		int rh = r.height;
		if (rw <= 0 || rh <= 0 || tw <= 0 || th <= 0) {
			return false;
		}
		int tx = x;
		int ty = y;
		int rx = r.x;
		int ry = r.y;
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
