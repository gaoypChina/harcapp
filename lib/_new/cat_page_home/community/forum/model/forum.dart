import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_new/api/_api.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_image_data.dart';
import 'package:harcapp/_new/cat_page_home/community/forum/model/post.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/logger.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../forum_role.dart';
import 'forum_manager.dart';

class ForumProvider extends ChangeNotifier{

  static ForumProvider of(BuildContext context) => Provider.of<ForumProvider>(context, listen: false);
  static void notify_(BuildContext context) => of(context).notify();

  void notify() => notifyListeners();
}

class ForumManagersProvider extends ChangeNotifier{

  static final List<void Function()> _listeners = [];

  static void addOnNotifyListener(void Function() listener){
    _listeners.add(listener);
  }

  static void removeOnNotifyListener(void Function() listener){
    _listeners.remove(listener);
  }

  void notify(){
    for(void Function() listener in _listeners)
      listener.call();
    notifyListeners();
  }

}

class ForumBasicData{

  String key;
  CommunityBasicData community;
  CommunityCoverImageData coverImage;
  String? description;
  bool liked;
  int likeCnt;
  bool followed;
  int followersCnt;

  String get name => community.name;
  String get iconKey => community.iconKey;

  ForumBasicData({
    required this.key,
    required this.community,
    required this.coverImage,
    required this.description,
    required this.liked,
    required this.likeCnt,
    required this.followed,
    required this.followersCnt,
  });

  static ForumBasicData fromForum(Forum forum) => ForumBasicData(
    key: forum.key,
    community: forum.community,
    coverImage: forum.coverImage,
    description: forum.description,
    liked: forum.liked,
    likeCnt: forum.likeCnt,
    followed: forum.followed,
    followersCnt: forum.followersCnt,
  );

  static ForumBasicData fromResponse(Map resp, CommunityBasicData community) => ForumBasicData(
    key: resp['_key']??(throw InvalidResponseError('_key')),
    community: community,
    coverImage: CommunityCoverImageData.from(resp['coverImage']??(throw InvalidResponseError('coverImage'))),
    description: resp['description']??(throw InvalidResponseError('description')),
    liked: resp['liked']??(throw InvalidResponseError('liked')),
    likeCnt: resp['likeCount']??(throw InvalidResponseError('likeCount')),
    followed: resp['followed']??(throw InvalidResponseError('followed')),
    followersCnt: resp['followersCount']??(throw InvalidResponseError('followersCount')),
  );

}

class Forum extends ForumBasicData{

  static const IconData icon = MdiIcons.earth;
  static const IconData iconOff = MdiIcons.earthOff;

  static const int maxLenDescription = 320;
  static const int maxLenCoverImageUrl = 200;
  static const int maxLenColorsKey = 42;

  static const int postPageSize = 10;

  String colorsKey;

  List<UserData> followers;

  final List<ForumManager> _managers;
  final Map<String, ForumManager> _managersMap;
  List<ForumManager> get managers => _managers;
  Map<String, ForumManager> get managersMap => _managersMap;

  bool get hasDescription => description != null && description!.isNotEmpty;

  void addManager(List<ForumManager> newManagers, {BuildContext? context}){

    for(ForumManager manager in newManagers) {
      _managers.add(manager);
      _managersMap[manager.key] = manager;
    }

    if(context == null) return;
    Provider.of<ForumManagersProvider>(context, listen: false).notify();
    Provider.of<ForumProvider>(context, listen: false).notify();

  }

  void setAllManagers(List<ForumManager> allManagers, {BuildContext? context}){
    _managers.clear();
    _managersMap.clear();
    _managers.addAll(allManagers);
    _managers.sort((m1, m2) => m1.name.compareTo(m2.name));
    _managersMap.addAll({for (ForumManager? manager in allManagers) manager!.key: manager});

    if(context == null) return;
    Provider.of<ForumManagersProvider>(context, listen: false).notify();
    Provider.of<ForumProvider>(context, listen: false).notify();
  }

  void updateManagers(List<ForumManager> newManagers, {BuildContext? context}){

    for(ForumManager manager in newManagers) {
      int index = _managers.indexWhere((managerIter) => managerIter.key == manager.key);
      _managers.removeAt(index);
      _managers.insert(index, manager);
      _managersMap[manager.key] = manager;
    }

    if(context == null) return;
    Provider.of<ForumManagersProvider>(context, listen: false).notify();
    Provider.of<ForumProvider>(context, listen: false).notify();
  }

  void removeManagersByKey(List<String> managerKeys, {BuildContext? context}){

    _managers.removeWhere((particip) => managerKeys.contains(particip.key));
    for(String managerKey in managerKeys) _managersMap.remove(managerKey);

    if(context == null) return;
    Provider.of<ForumManagersProvider>(context, listen: false).notify();
    Provider.of<ForumProvider>(context, listen: false).notify();
  }

  void removeManager(ForumManager manager){
    _managers.remove(manager);
    _managersMap.remove(manager.key);
  }

  late Map<String, Post> _postsMap;
  Map<String, Post> get postsMap => _postsMap;

  void removePost(Post post){
    Post.removeFromAll(post);
    _allPosts.remove(post);
    _postsMap.remove(post.key);
  }

  List<Post> _allPosts;
  List<Post> get allPosts => _allPosts;

  void resetPosts(List<Post> allPosts){
    _allPosts.clear();
    _postsMap.clear();

    _allPosts.addAll(allPosts);
    _allPosts.sort((ann1, ann2) => ann2.publishTime.compareTo(ann1.publishTime));

    _postsMap = {for (Post post in _allPosts) post.key: post};
  }

  void addAllPost(Post post, {bool sort = true}){
    Post.addToAll(post);
    _allPosts.add(post);
    if(sort) _allPosts.sort((ann1, ann2) => ann2.publishTime.compareTo(ann1.publishTime));
    _postsMap[post.key] = post;
  }

  void addAllPosts(List<Post> posts, {bool sort = true}){
    Post.addListToAll(posts);
    _allPosts.addAll(posts);
    if(sort) _allPosts.sort((ann1, ann2) => ann2.publishTime.compareTo(ann1.publishTime));
    for(Post post in posts)
      _postsMap[post.key] = post;
  }

  ForumRole? get myRole{
    String? accKey = AccountData.key;
    if(accKey == null){
      logger.w('Value of saved account data key is null. Are you logged in?');
      return null;
    }
    ForumManager? me = _managersMap[accKey];

    return me?.role;
  }

  Forum({
    required super.key,
    super.description,
    required super.coverImage,
    required this.colorsKey,
    required super.liked,
    required super.likeCnt,
    required super.followed,
    required this.followers,
    required super.followersCnt,

    required List<ForumManager> managers,
    required List<Post> allPosts,

    required super.community,

  }): _managers = managers,
      _managersMap = {for (ForumManager manager in managers) manager.key: manager},
      _allPosts = allPosts
  {
    _managers.sort((m1, m2) => m1.name.compareTo(m2.name));
    _postsMap = {for (Post post in _allPosts) post.key: post};
    _allPosts.sort((ann1, ann2) => ann1.publishTime.compareTo(ann2.publishTime));
  }

  static Forum fromResponse(Map resp, CommunityBasicData community){

    List<ForumManager> managers = [];

    if(resp.containsKey('managers')) {
      Map managerResps = resp['managers'];
      for (String userKey in managerResps.keys as Iterable<String>) {
        Map managerResp = managerResps[userKey];
        ForumManager managerData = ForumManager.fromMap(
            managerResp, key: userKey);
        managers.add(managerData);
      }
    }

    List<UserData> followers = [];
    Map followersResps = resp['followers']??(throw InvalidResponseError('followers'));
    for(String userKey in followersResps.keys as Iterable<String>){
      Map followersResp = followersResps[userKey];
      UserData followerData = UserData.fromMap(followersResp, key: userKey);
      followers.add(followerData);
    }

    Forum forum = Forum(
      key: resp['_key']??(throw InvalidResponseError('_key')),
      description: resp['description'],
      coverImage: CommunityCoverImageData.from(resp['coverImage']),
      colorsKey: resp['colorsKey']??(throw InvalidResponseError('colorsKey')),
      liked: resp['liked']??(throw InvalidResponseError('liked')),
      likeCnt: resp['likeCount']??(throw InvalidResponseError('likeCount')),
      followed: resp['followed']??(throw InvalidResponseError('followed')),
      followers: followers,
      followersCnt: resp['followersCount']??(throw InvalidResponseError('followersCount')),
      managers: managers,
      allPosts: [],

      community: community

    );

    Map postsResps = resp['posts']??(throw InvalidResponseError('posts'));

    for(String postKey in postsResps.keys as Iterable<String>){
      Map postRespData = postsResps[postKey];

      Post post = Post.fromMap(postRespData, forum, key: postKey);

      forum.addAllPost(post, sort: false);
      forum._allPosts.sort((ann1, ann2) => ann2.publishTime.compareTo(ann1.publishTime));
    }

    return forum;
  }

}