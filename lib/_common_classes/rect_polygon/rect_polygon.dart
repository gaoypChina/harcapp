// import 'dart:math';
//
// class Atomic {
//   final Bound left;
//   final double lower;
//   final double upper;
//   final Bound right;
//
//   Atomic(this.left, this.lower, this.upper, this.right);
// }
//
// class Interval {
//   late List<Atomic> _intervals;
//
//   Interval([List<Interval> intervals = const []]) {
//     _intervals = [];
//
//     for (var interval in intervals)
//       if (!interval.isEmpty)
//         _intervals.addAll(interval._intervals);
//
//     if (_intervals.isEmpty) {
//       // So we have at least one (empty) interval
//       _intervals.add(Atomic(Bound.OPEN, double.infinity, double.negativeInfinity, Bound.OPEN));
//     } else {
//       // Sort intervals by lower bound, closed first.
//       _intervals.sort((i1, i2) => i1.lower == i2.lower ? (i1.left == Bound.CLOSED ? -1 : 1) : i1.lower.compareTo(i2.lower));
//
//       int i = 0;
//       // Try to merge consecutive intervals
//       while (i < _intervals.length - 1) {
//         var current = _intervals[i];
//         var successor = _intervals[i + 1];
//
//         if (_mergeable(current, successor)) {
//           var lower = current.lower == successor.lower ? current.lower : current.lower < successor.lower ? current.lower : successor.lower;
//           var left = current.left == Bound.CLOSED ? current.left : successor.left;
//           var upper = current.upper == successor.upper ? current.upper : current.upper > successor.upper ? current.upper : successor.upper;
//           var right = current.right == Bound.CLOSED ? current.right : successor.right;
//           var union = Atomic(left, lower, upper, right);
//           _intervals.removeAt(i); // pop current
//           _intervals.removeAt(i); // pop successor
//           _intervals.insert(i, union);
//         } else {
//           i++;
//         }
//       }
//     }
//   }
//
//   bool get isEmpty => _intervals.isEmpty;
//
//   static bool _mergeable(Atomic a, Atomic b) {
//     return a.upper >= b.lower && b.upper >= a.lower;
//   }
//
//   static fromAtomic(Bound left, double lower, double upper, Bound right) {
//     Interval instance = Interval();
//     if(lower != inf && lower != -inf)
//       left = left;
//     else
//       left = Bound.OPEN;
//     var atomic = Atomic(left, lower, upper, right);
//     return Interval([Interval.empty(), Interval([atomic]), Interval.empty()]);
//   }
//
//   // @classmethod
//   // def from_atomic(cls, left, lower, upper, right):
//   // """
//   //       Create an Interval instance containing a single atomic interval.
//   //
//   //       :param left: either CLOSED or OPEN.
//   //       :param lower: value of the lower bound.
//   //       :param upper: value of the upper bound.
//   //       :param right: either CLOSED or OPEN.
//   //       """
//   // instance = cls()
//   // left = left if lower not in [inf, -inf] else Bound.OPEN
//   // right = right if upper not in [inf, -inf] else Bound.OPEN
//   //
//   // instance._intervals = [Atomic(left, lower, upper, right)]
//   // if instance.empty:
//   // return cls()
//   //
//   // return instance
//
//   static Interval open(double lower, double upper) {
//     return Interval.fromAtomic(Bound.OPEN, lower, upper, Bound.OPEN);
//   }
//
//   static Interval closed(double lower, double upper) {
//     return Interval.fromAtomic(Bound.CLOSED, lower, upper, Bound.CLOSED);
//   }
//
//   static Interval openclosed(double lower, double upper) {
//     return Interval.fromAtomic(Bound.OPEN, lower, upper, Bound.CLOSED);
//   }
//
//   static Interval closedopen(double lower, double upper) {
//     return Interval.fromAtomic(Bound.CLOSED, lower, upper, Bound.OPEN);
//   }
//
//   static Interval singleton(double value) {
//     return Interval.fromAtomic(Bound.CLOSED, value, value, Bound.CLOSED);
//   }
//
//   static Interval empty() {
//     return Interval([Interval.empty()]);
//   }
// }
//
// enum Bound { OPEN, CLOSED }
//
// class RBoundary {
//   double val;
//   BType btype;
//
//   RBoundary(this.val, this.btype) {
//     if (this.val == double.infinity || this.val == -double.infinity) {
//       this.btype = BType.OPEN;
//     }
//   }
//
//   bool operator ==(Object other) {
//     if (other is RBoundary) {
//       return this.val == other.val && this.btype == other.btype;
//     }
//     return false;
//   }
//
//   bool operator <(RBoundary other) {
//     if (this.val != other.val) {
//       return this.val < other.val;
//     } else if (this.btype == BType.OPEN) {
//       return other.btype == BType.CLOSED;
//     } else {
//       return false;
//     }
//   }
//
//   bool operator <=(RBoundary other) {
//     if (this.val != other.val) {
//       return this.val <= other.val;
//     } else if (this.btype == BType.OPEN) {
//       return true;
//     } else {
//       return other.btype == BType.CLOSED;
//     }
//   }
//
//   bool operator >(RBoundary other) {
//     if (this.val != other.val) {
//       return this.val > other.val;
//     } else if (other.btype == BType.OPEN) {
//       return this.btype == BType.CLOSED;
//     } else {
//       return false;
//     }
//   }
//
//   bool operator >=(RBoundary other) {
//     if (this.val != other.val) {
//       return this.val >= other.val;
//     } else if (this.btype == BType.OPEN) {
//       return other.btype == BType.OPEN;
//     } else {
//       return true;
//     }
//   }
//
//   @override
//   int get hashCode => val.hashCode ^ btype.hashCode;
//
//   @override
//   String toString() => "($val, $btype)";
// }
//
// enum BType {
//   OPEN,
//   CLOSED,
// }
//
// class RectPolygon{
//
//   /*
//   This class represents an orthogonal Polygon.
//
//   An orthogonal polygon is a union of rectangles. A rectangle is represented by two
//   intervals of the `portion`-library.
//   */
//
// }