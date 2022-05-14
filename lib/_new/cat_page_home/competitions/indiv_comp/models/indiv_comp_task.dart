import 'package:flutter/cupertino.dart';
import 'package:harcapp/_new/api/_api.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';

class IndivCompTask{

  static const int MAX_LEN_TITLE = 64;
  static const int MAX_LEN_DESC = 240;

  final String? key;
  final String title;
  final String? description;
  final int points;
  final int position;
  final TaskState state;

  const IndivCompTask({
    required this.key,
    required this.title,
    this.description,
    required this.points,
    required this.position,
    required this.state,
  });

  static IndivCompTask fromMap(String key, Map map) => IndivCompTask(
    key: key,
    title: map['title']??(throw InvalidResponseError('title')),
    description: map['description']??(throw InvalidResponseError('description')),
    points: map['points']??(throw InvalidResponseError('points')),
    position: map['position']??(throw InvalidResponseError('position')),
    // TODO: wywalić TaskState.OPEN.
    state: strToTaskState[map['state']]??TaskState.OPEN//(throw InvalidResponseError('state'))
  );

  IndivTaskBody toTaskBody() => IndivTaskBody(
    key: key,
    title: title,
    desc: description,
    points: points,
    position: position,
    state: state
  );

  static IndivCompTask empty(int position) => IndivCompTask(
    key: null,
    title: '',
    description: '',
    points: 1,
    position: position,
    state: TaskState.OPEN
  );

}