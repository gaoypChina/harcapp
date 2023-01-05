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

  static ForumManagersProvider of(BuildContext context) => Provider.of<ForumManagersProvider>(context, listen: false);
  static void notify_(BuildContext context) => of(context).notify();

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

class ForumFollowersProvider extends ChangeNotifier{

  static ForumFollowersProvider of(BuildContext context) => Provider.of<ForumFollowersProvider>(context, listen: false);
  static void notify_(BuildContext context) => of(context).notify();

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

class ForumLikesProvider extends ChangeNotifier{

  static ForumLikesProvider of(BuildContext context) => Provider.of<ForumLikesProvider>(context, listen: false);
  static void notify_(BuildContext context) => of(context).notify();

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

  static ForumBasicData fromRespMap(Map respMap, CommunityBasicData community) => ForumBasicData(
    key: respMap['_key']??(throw InvalidResponseError('_key')),
    community: community,
    coverImage: CommunityCoverImageData.fromRespMap(respMap['coverImage']??(throw InvalidResponseError('coverImage'))),
    description: respMap['description']??(throw InvalidResponseError('description')),
    liked: respMap['liked']??(throw InvalidResponseError('liked')),
    likeCnt: respMap['likeCount']??(throw InvalidResponseError('likeCount')),
    followed: respMap['followed']??(throw InvalidResponseError('followed')),
    followersCnt: respMap['followersCount']??(throw InvalidResponseError('followersCount')),
  );

}

class Forum extends ForumBasicData{

  static const IconData icon = MdiIcons.earth;
  static const IconData iconOff = MdiIcons.earthOff;

  static const int maxLenDescription = 320;
  static const int maxLenCoverImageUrl = 200;
  static const int maxLenColorsKey = 42;

  static const int postPageSize = 10;
  static const int followerPageSize = 10;
  static const int likePageSize = 10;
  static const int managerPageSize = 10;

  String colorsKey;

  final List<UserData> _loadedFollowers;
  final Map<String, UserData> _loadedFollowersMap;
  List<UserData> get loadedFollowers => _loadedFollowers;
  Map<String, UserData> get loadedFollowersMap => _loadedFollowersMap;

  final List<UserData> _loadedLikes;
  final Map<String, UserData> _loadedLikesMap;
  List<UserData> get loadedLikes => _loadedLikes;
  Map<String, UserData> get loadedLikesMap => _loadedLikesMap;

  final List<ForumManager> _loadedManagers;
  final Map<String, ForumManager> _loadedManagersMap;
  List<ForumManager> get loadedManagers => _loadedManagers;
  Map<String, ForumManager> get loadedManagersMap => _loadedManagersMap;
  int? managerCount;

  bool get hasDescription => description != null && description!.isNotEmpty;

  void update(Forum updatedForum){
    description = updatedForum.description;
    coverImage = updatedForum.coverImage;
    colorsKey = updatedForum.colorsKey;

    liked = updatedForum.liked;
    likeCnt = updatedForum.likeCnt;

    followed = updatedForum.followed;
    followersCnt = updatedForum.followersCnt;

    managerCount = updatedForum.managerCount;
  }

  void addLikes(List<UserData> newLikes, {BuildContext? context}){

    for(UserData user in newLikes) {
      if(_loadedLikesMap.containsKey(user.key)) continue;
      _loadedLikes.add(user);
      _loadedLikesMap[user.key] = user;
    }

    if(context == null) return;
    ForumLikesProvider.notify_(context);
    ForumProvider.notify_(context);

  }

  void setAllLoadedLikes(List<UserData> allLikes, {BuildContext? context}){
    _loadedLikes.clear();
    _loadedLikesMap.clear();
    _loadedLikes.addAll(allLikes);
    _loadedLikesMap.addAll({for (UserData? user in allLikes) user!.key: user});

    if(context == null) return;
    ForumLikesProvider.notify_(context);
    ForumProvider.notify_(context);
  }

  void updateLoadedLikes(List<UserData> newLikes, {BuildContext? context}){

    for(UserData user in newLikes) {
      int index = _loadedLikes.indexWhere((userIter) => userIter.key == user.key);
      _loadedLikes.removeAt(index);
      _loadedLikes.insert(index, user);
      _loadedLikesMap[user.key] = user;
    }

    if(context == null) return;
    ForumLikesProvider.notify_(context);
    ForumProvider.notify_(context);
  }

  void removeLoadedLikesByKey(List<String> likeKeys, {bool shrinkTotalCount=true, BuildContext? context}){

    _loadedLikes.removeWhere((user) => likeKeys.contains(user.key));
    for(String likesKey in likeKeys){
      UserData? removed = _loadedLikesMap.remove(likesKey);
      if(removed != null && shrinkTotalCount)
        managerCount = managerCount! - 1;
    }

    if(context == null) return;
    ForumLikesProvider.notify_(context);
    ForumProvider.notify_(context);
  }

  void removeLoadedLike(UserData likes, {bool shrinkTotalCount=true}){
    bool success = _loadedLikes.remove(likes);
    UserData? removed = _loadedLikesMap.remove(likes.key);

    if(success != (removed != null))
      logger.d("A dangerous inconsistency between the objectList and the objectKeyMap occurred!");

    if(success && removed != null && shrinkTotalCount)
      managerCount = managerCount! - 1;
  }


  void addLoadedFollowers(List<UserData> newFollowers, {BuildContext? context}){

    for(UserData user in newFollowers) {
      if(_loadedFollowersMap.containsKey(user.key)) continue;
      _loadedFollowers.add(user);
      _loadedFollowersMap[user.key] = user;
    }

    if(context == null) return;
    ForumFollowersProvider.notify_(context);
    ForumProvider.notify_(context);

  }

  void setAllLoadedFollowers(List<UserData> allFollowers, {BuildContext? context}){
    _loadedFollowers.clear();
    _loadedFollowersMap.clear();
    _loadedFollowers.addAll(allFollowers);
    _loadedFollowersMap.addAll({for (UserData? user in allFollowers) user!.key: user});

    if(context == null) return;
    ForumFollowersProvider.notify_(context);
    ForumProvider.notify_(context);
  }

  void updateLoadedFollowers(List<UserData> newFollowers, {BuildContext? context}){

    for(UserData user in newFollowers) {
      int index = _loadedFollowers.indexWhere((userIter) => userIter.key == user.key);
      _loadedFollowers.removeAt(index);
      _loadedFollowers.insert(index, user);
      _loadedFollowersMap[user.key] = user;
    }

    if(context == null) return;
    ForumFollowersProvider.notify_(context);
    ForumProvider.notify_(context);
  }

  void removeLoadedFollowersByKey(List<String> followerKeys, {bool shrinkTotalCount=true, BuildContext? context}){

    _loadedFollowers.removeWhere((user) => followerKeys.contains(user.key));
    for(String followerKey in followerKeys){
      UserData? removed = _loadedFollowersMap.remove(followerKey);
      if(removed != null && shrinkTotalCount)
        managerCount = managerCount! - 1;
    }

    if(context == null) return;
    ForumFollowersProvider.notify_(context);
    ForumProvider.notify_(context);
  }

  void removeLoadedFollower(UserData follower, {bool shrinkTotalCount=true}){
    bool success = _loadedFollowers.remove(follower);
    UserData? removed = _loadedFollowersMap.remove(follower.key);

    if(success != (removed != null))
      logger.d("A dangerous inconsistency between the objectList and the objectKeyMap occurred!");

    if(success && removed != null && shrinkTotalCount)
      managerCount = managerCount! - 1;
  }


  void addLoadedManagers(List<ForumManager> newManagers, {BuildContext? context}){

    for(ForumManager manager in newManagers) {
      if(_loadedManagersMap.containsKey(manager.key)) continue;
      _loadedManagers.add(manager);
      _loadedManagersMap[manager.key] = manager;
    }

    if(context == null) return;
    ForumManagersProvider.notify_(context);
    ForumProvider.notify_(context);

  }

  void setAllLoadedManagers(List<ForumManager> allManagers, {BuildContext? context}){
    _loadedManagers.clear();
    _loadedManagersMap.clear();
    _loadedManagers.addAll(allManagers);
    _loadedManagersMap.addAll({for (ForumManager? manager in allManagers) manager!.key: manager});

    if(context == null) return;
    ForumManagersProvider.notify_(context);
    ForumProvider.notify_(context);
  }

  void updateLoadedManagers(List<ForumManager> newManagers, {BuildContext? context}){

    for(ForumManager manager in newManagers) {
      int index = _loadedManagers.indexWhere((managerIter) => managerIter.key == manager.key);
      _loadedManagers.removeAt(index);
      _loadedManagers.insert(index, manager);
      _loadedManagersMap[manager.key] = manager;
    }

    if(context == null) return;
    ForumManagersProvider.notify_(context);
    ForumProvider.notify_(context);
  }

  void removeLoadedManagersByKey(List<String> managerKeys, {bool shrinkTotalCount=true, BuildContext? context}){

    _loadedManagers.removeWhere((manager) => managerKeys.contains(manager.key));
    for(String managerKey in managerKeys){
      ForumManager? removed = _loadedManagersMap.remove(managerKey);
      if(removed != null && shrinkTotalCount)
        managerCount = managerCount! - 1;
    }

    if(context == null) return;
    ForumManagersProvider.notify_(context);
    ForumProvider.notify_(context);
  }

  void removeLoadedManager(ForumManager manager, {bool shrinkTotalCount=true}){
    bool success = _loadedManagers.remove(manager);
    ForumManager? removed = _loadedManagersMap.remove(manager.key);

    if(success != (removed != null))
      logger.d("A dangerous inconsistency between the objectList and the objectKeyMap occurred!");

    if(success && removed != null && shrinkTotalCount)
      managerCount = managerCount! - 1;
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
    ForumManager? me = _loadedManagersMap[accKey];

    return me?.role;
  }

  Forum({
    required super.key,
    super.description,
    required super.coverImage,
    required this.colorsKey,

    required super.liked,
    required List<UserData> likes,
    required super.likeCnt,

    required super.followed,
    required List<UserData> followers,
    required super.followersCnt,

    required List<ForumManager> managers,
    required this.managerCount,

    required List<Post> allPosts,

    required super.community,

  }): _loadedLikes = likes,
      _loadedLikesMap = {for (UserData user in likes) user.key: user},

      _loadedFollowers = followers,
      _loadedFollowersMap = {for (UserData user in followers) user.key: user},

      _loadedManagers = managers,
      _loadedManagersMap = {for (ForumManager manager in managers) manager.key: manager},
      _allPosts = allPosts
  {
    _loadedManagers.sort((m1, m2) => m1.name.compareTo(m2.name));
    _postsMap = {for (Post post in _allPosts) post.key: post};
    _allPosts.sort((ann1, ann2) => ann1.publishTime.compareTo(ann2.publishTime));
  }

  static Forum fromRespMap(Map respMap, CommunityBasicData community){

    List<UserData> likes = (respMap['likes']??[]).map<UserData>((data) => UserData.fromRespMap(data)).toList();
    List<UserData> followers = (respMap['followers']??[]).map<UserData>((data) => UserData.fromRespMap(data)).toList();

    Forum forum = Forum(
      key: respMap['_key']??(throw InvalidResponseError('_key')),
      description: respMap['description'],
      coverImage: CommunityCoverImageData.fromRespMap(respMap['coverImage']),
      colorsKey: respMap['colorsKey']??(throw InvalidResponseError('colorsKey')),

      liked: respMap['liked']??(throw InvalidResponseError('liked')),
      likes: likes,
      likeCnt: respMap['likeCount']??(throw InvalidResponseError('likeCount')),

      followed: respMap['followed']??(throw InvalidResponseError('followed')),
      followers: followers,
      followersCnt: respMap['followersCount']??(throw InvalidResponseError('followersCount')),

      managers: (respMap['managers']??[]).map<ForumManager>((data) => ForumManager.fromRespMap(data)).toList(),
      managerCount: respMap['managerCount'],

      allPosts: [],

      community: community

    );

    Map postsResps = respMap['posts']??(throw InvalidResponseError('posts'));

    for(String postKey in postsResps.keys as Iterable<String>){
      Map postRespData = postsResps[postKey];

      Post post = Post.fromRespMap(postRespData, forum, key: postKey);

      forum.addAllPost(post, sort: false);
      forum._allPosts.sort((ann1, ann2) => ann2.publishTime.compareTo(ann1.publishTime));
    }

    return forum;
  }

}