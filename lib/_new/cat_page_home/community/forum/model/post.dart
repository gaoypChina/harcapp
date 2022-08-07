import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_new/api/_api.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_image_data.dart';
import 'package:harcapp/_new/cat_page_home/community/community_publishable.dart';
import 'package:provider/provider.dart';

import 'forum.dart';

class PostProvider extends ChangeNotifier{
  void notify() => notifyListeners();
}

class PostListProvider extends ChangeNotifier{
  void notify() => notifyListeners();
}

class Post extends CommunityPublishable{

  static const int feedPageSize = 10;

  static List<Post>? _all;
  static Map<String, Post>? _allMap;

  static List<Post>? get all => _all;
  static Map<String, Post>? get allMap => _allMap;

  static forget(){
    _all = null;
    _allMap = null;
  }

  static silentInit(List<Post> posts){
    if(_all == null){
      _all = [];
      _allMap = {};
    }

    _all!.clear();
    _allMap!.clear();

    _all!.addAll(posts);
    _allMap = {for (Post p in posts) p.key: p};

  }

  static init(List<Post> posts, {BuildContext? context}){

    silentInit(posts);

    if(context == null) return;
    Provider.of<PostProvider>(context, listen: false).notify();
    Provider.of<PostListProvider>(context, listen: false).notify();
  }

  static addToAll(BuildContext context, Post p){
    if(_all == null){
      _all = [];
      _allMap = {};
    }
    _all!.add(p);
    _allMap![p.key] = p;

    Provider.of<PostProvider>(context, listen: false).notify();
    Provider.of<PostListProvider>(context, listen: false).notify();
  }

  static addListToAll(List<Post> posts, {BuildContext? context}){
    if(_all == null){
      _all = [];
      _allMap = {};
    }
    for(Post p in posts) {
      _all!.add(p);
      _allMap![p.key] = p;
    }

    if(context == null) return;

    Provider.of<PostProvider>(context, listen: false).notify();
    Provider.of<PostListProvider>(context, listen: false).notify();
  }

  static updateInAll(BuildContext context, Post p){
    Post? oldPost = _allMap![p.key];
    if(oldPost == null){
      addToAll(context, p);
      return;
    }

    int index = _all!.indexOf(oldPost);
    _all!.removeAt(index);
    _all!.insert(index, p);
    _allMap![p.key] = p;

    Provider.of<PostProvider>(context, listen: false).notify();
    Provider.of<PostListProvider>(context, listen: false).notify();
  }

  static void removeFromAll(BuildContext context, Post p){
    if(_all == null)
      return;

    _all!.remove(p);
    _allMap!.remove(p.key);

    Provider.of<PostProvider>(context, listen: false).notify();
    Provider.of<PostListProvider>(context, listen: false).notify();
  }

  static clear(){
    if(_all == null)
      return;
    _all!.clear();
    _allMap!.clear();
  }

  String title;
  DateTime postTime;
  DateTime? lastUpdateTime;
  DateTime? startTime;
  DateTime? endTime;
  String? place;
  String? urlToPreview;
  UserData author;
  CommunityCoverImageData? coverImage;
  String text;

  final Forum? forum;

  Post({
    required super.key,
    required this.title,
    required this.postTime,
    this.lastUpdateTime,
    required this.startTime,
    required this.endTime,
    required this.place,
    required this.urlToPreview,
    required this.author,
    this.coverImage,
    required this.text,

    this.forum,
  });

  void update(Post other){
    title = other.title;
    postTime = other.postTime;
    lastUpdateTime = other.lastUpdateTime;
    startTime = other.startTime;
    endTime = other.endTime;
    place = other.place;
    author = other.author;
    coverImage = other.coverImage;
    text = other.text;
  }

  static Post fromMap(Map resp, Forum forum, {String? key}) => Post(
    key: key??resp['_key']??(throw InvalidResponseError('_key')),
    title: resp['title']??(throw InvalidResponseError('title')),
    postTime: DateTime.tryParse(resp['publishTimeStr']??(throw InvalidResponseError('publishTimeStr')))??(throw InvalidResponseError('post_time_str')),
    lastUpdateTime: resp['lastUpdateTimeStr'] == null? null: DateTime.tryParse(resp['lastUpdateTimeStr']),
    startTime: resp['startTimeStr'] == null? null: DateTime.tryParse(resp['startTimeStr']),
    endTime: resp['endTimeStr'] == null? null: DateTime.tryParse(resp['endTimeStr']),
    coverImage: resp['coverImageUrl'] == null? null: CommunityCoverImageData.from(resp['coverImageUrl']),
    place: resp['place'],
    urlToPreview: resp['urlToPreview'],
    author: UserData.fromMap(resp['author']),
    text: resp['text'],

    forum: forum,
  );

}