import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_new/api/_api.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_image_data.dart';
import 'package:harcapp/_new/cat_page_home/community/community_publishable.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'forum.dart';

class PostProvider extends ChangeNotifier{
  void notify() => notifyListeners();
}

class PostListProvider extends ChangeNotifier{
  void notify() => notifyListeners();
}

class Post extends CommunityPublishable{

  static const IconData icon = MdiIcons.bullhorn;

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

  final Forum forum;

  @override
  Community get community => forum.community;

  Post({
    required super.key,
    required super.title,
    required super.publishTime,
    super.lastUpdateTime,
    required super.urlToPreview,
    required super.author,
    super.coverImage,
    required super.text,

    required this.forum,
  });

  void update(Post other){
    title = other.title;
    publishTime = other.publishTime;
    lastUpdateTime = other.lastUpdateTime;
    author = other.author;
    coverImage = other.coverImage;
    text = other.text;
  }

  static Post fromMap(Map resp, Forum forum, {String? key}) => Post(
    key: key??resp['_key']??(throw InvalidResponseError('_key')),
    title: resp['title']??(throw InvalidResponseError('title')),
    publishTime: DateTime.tryParse(resp['publishTimeStr']??(throw InvalidResponseError('publishTimeStr')))??(throw InvalidResponseError('post_time_str')),
    lastUpdateTime: resp['lastUpdateTimeStr'] == null? null: DateTime.tryParse(resp['lastUpdateTimeStr']),
    coverImage: resp['coverImageUrl'] == null? null: CommunityCoverImageData.from(resp['coverImageUrl']),
    urlToPreview: resp['urlToPreview'],
    author: resp.containsKey('author')?UserData.fromMap(resp['author']):null,
    text: resp['text'],

    forum: forum,
  );

}