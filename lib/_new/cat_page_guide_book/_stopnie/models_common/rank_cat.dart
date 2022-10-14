
import 'package:flutter/widgets.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_group.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_task.dart';

class RankCatData{

  final String? title;
  final IconData? icon;
  final List<RankGroupData>? groupData;

  static RankCatData fromItems(String title, IconData icon, List<RankTaskData> items) => RankCatData(
      icon: icon,
      groupData: [
        RankGroupData(title: title, taskData: items)
      ]
  );

  const RankCatData({this.title, this.icon, required this.groupData});

  RankCat build(Rank rank, int index){

    RankCat cat = RankCat(this, rank, null, index);

    List<RankGroup> groups = [];
    for(int i=0; i<groupData!.length; i++)
      groups.add(groupData![i].build(cat, i));

    cat.groups = groups;

    return cat;
  }

  RankCat buildUnregistered(Rank rank){

    RankCat cat = RankCat(this, rank, null, 0);

    List<RankGroup> groups = [];
    for(int i=0; i<groupData!.length; i++)
      groups.add(groupData![i].build(cat, i));

    cat.groups = groups;

    return cat;
  }

}

class RankCat{

  RankCatData data;

  String? get title => data.title;
  IconData? get icon => data.icon;

  Rank? rank;
  List<RankGroup>? _groups;
  List<RankGroup>? get groups => _groups;
  set groups(List<RankGroup>? value){
    _groups = value;
    _groupsMap = {for (RankGroup group in _groups??[]) group.index: group};
  }
  Map<int?, RankGroup> get groupsMap => _groupsMap;
  Map<int?, RankGroup> _groupsMap;

  int? index;

  RankCat(this.data, this.rank, this._groups, this.index)
      :_groupsMap = {for (RankGroup group in _groups??[]) group.index: group};

}