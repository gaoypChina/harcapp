import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_new/api/_api.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_image_data.dart';
import 'package:harcapp/_new/cat_page_home/community/community_publishable.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:provider/provider.dart';

import 'forum.dart';

class PostProvider extends ChangeNotifier{

  void notify() => notifyListeners();
}

class PostListProvider extends ChangeNotifier{
  static PostListProvider of(BuildContext context) => Provider.of<PostListProvider>(context, listen: false);
  static notify_(BuildContext context) => of(context).notify();
  void notify() => notifyListeners();
}

class Post extends CommunityPublishable{

  static Map<String, Post>? _allMap;

  static Map<String, Post>? get allMap => _allMap;

  static forget(){
    _allMap = null;
  }

  static silentInit(List<Post> posts){
    _allMap ??= {};
    _allMap!.clear();
    _allMap = {for (Post p in posts) p.key: p};
  }

  static init(List<Post> posts, {BuildContext? context}){

    silentInit(posts);

    if(context == null) return;
    Provider.of<PostProvider>(context, listen: false).notify();
    Provider.of<PostListProvider>(context, listen: false).notify();
  }

  static addToAll(Post p, {BuildContext? context}){
    _allMap ??= {};
    _allMap![p.key] = p;

    if(context == null) return;

    Provider.of<PostProvider>(context, listen: false).notify();
    Provider.of<PostListProvider>(context, listen: false).notify();
  }

  static addListToAll(List<Post> posts, {BuildContext? context}){
    _allMap ??= {};
    for(Post p in posts)
      _allMap![p.key] = p;

    if(context == null) return;

    Provider.of<PostProvider>(context, listen: false).notify();
    Provider.of<PostListProvider>(context, listen: false).notify();
  }

  static updateInAll(Post p, {BuildContext? context}){
    Post? oldPost = _allMap![p.key];
    if(oldPost == null){
      addToAll(p, context: context);
      return;
    }

    _allMap![p.key] = p;

    if(context == null) return;

    Provider.of<PostProvider>(context, listen: false).notify();
    Provider.of<PostListProvider>(context, listen: false).notify();
  }

  static void removeFromAll(Post p, {BuildContext? context}){
    if(_allMap == null)
      return;

    _allMap!.remove(p.key);

    if(context == null) return;

    Provider.of<PostProvider>(context, listen: false).notify();
    Provider.of<PostListProvider>(context, listen: false).notify();
  }

  static clear(){
    if(_allMap == null)
      return;
    _allMap!.clear();
  }

  final Forum forum;

  @override
  CommunityBasicData get community => forum.community;

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
    urlToPreview = other.urlToPreview;
    author = other.author;
    coverImage = other.coverImage;
    text = other.text;
  }

  static Post fromMap(Map resp, Forum forum, {String? key}) => Post(
    key: key??resp['_key']??(throw InvalidResponseError('_key')),
    title: resp['title'],
    publishTime: DateTime.tryParse(resp['publishTimeStr']??(throw InvalidResponseError('publishTimeStr')))??(throw InvalidResponseError('post_time_str')),
    lastUpdateTime: DateTime.tryParse(resp['lastUpdateTimeStr']??''),
    coverImage: resp['coverImage'] == null? null: CommunityCoverImageData.from(resp['coverImage']),
    urlToPreview: resp['urlToPreview'],
    author: resp.containsKey('author')?UserData.fromMap(resp['author']):null,
    text: resp['text']??(throw InvalidResponseError('text')),

    forum: forum,
  );

}