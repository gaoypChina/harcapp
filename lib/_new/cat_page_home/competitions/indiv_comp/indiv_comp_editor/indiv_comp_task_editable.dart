import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_task.dart';

class IndivCompTaskEditable{

  String? editedTitle;
  String? editedDescription;
  int? editedPoints;
  int? editedPosition;
  TaskState? editedState;

  IndivCompTask task;

  bool get created => task.key != null;
  bool get frozen => task.state == TaskState.CLOSED_RETAINING;

  bool? remove;

  IndivCompTaskEditable(this.task){
    editedTitle = task.title;
    editedDescription = task.description;
    editedPoints = task.points;
    editedPosition = task.position;
    editedState = task.state;

    remove = false;
  }

  static IndivCompTaskEditable empty(int position, {bool created = false}) => IndivCompTaskEditable(IndivCompTask.empty(position));

  bool isEdited() =>
      task.title != editedTitle ||
      task.description != editedDescription ||
      task.points != editedPoints ||
      task.position != editedPosition ||
      task.state != editedState;

  IndivTaskBody toTaskBody() => IndivTaskBody(
      key: task.key,
      title: editedTitle,
      desc: editedDescription,
      points: editedPoints,
      position: editedPosition,
      state: editedState
  );

}