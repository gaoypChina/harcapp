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

class ForumFollowersProvider extends ChangeNotifier{

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

  final List<UserData> _followers;
  final Map<String, UserData> _followersMap;
  List<UserData> get followers => _followers;
  Map<String, UserData> get followersMap => _followersMap;

  final List<UserData> _likes;
  final Map<String, UserData> _likesMap;
  List<UserData> get likes => _likes;
  Map<String, UserData> get likesMap => _likesMap;

  final List<ForumManager> _managers;
  final Map<String, ForumManager> _managersMap;
  List<ForumManager> get managers => _managers;
  Map<String, ForumManager> get managersMap => _managersMap;
  int managerCount;

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
      if(_likesMap.containsKey(user.key)) continue;
      _likes.add(user);
      _likesMap[user.key] = user;
    }

    if(context == null) return;
    Provider.of<ForumLikesProvider>(context, listen: false).notify();
    Provider.of<ForumProvider>(context, listen: false).notify();

  }

  void setAllLikes(List<UserData> allLikes, {BuildContext? context}){
    _likes.clear();
    _likesMap.clear();
    _likes.addAll(allLikes);
    _likesMap.addAll({for (UserData? user in allLikes) user!.key: user});

    if(context == null) return;
    Provider.of<ForumLikesProvider>(context, listen: false).notify();
    Provider.of<ForumProvider>(context, listen: false).notify();
  }

  void updateLikes(List<UserData> newLikes, {BuildContext? context}){

    for(UserData user in newLikes) {
      int index = _likes.indexWhere((userIter) => userIter.key == user.key);
      _likes.removeAt(index);
      _likes.insert(index, user);
      _likesMap[user.key] = user;
    }

    if(context == null) return;
    Provider.of<ForumLikesProvider>(context, listen: false).notify();
    Provider.of<ForumProvider>(context, listen: false).notify();
  }

  void removeLikesByKey(List<String> likeKeys, {BuildContext? context}){

    _likes.removeWhere((user) => likeKeys.contains(user.key));
    for(String likesKey in likeKeys) _likesMap.remove(likesKey);

    if(context == null) return;
    Provider.of<ForumLikesProvider>(context, listen: false).notify();
    Provider.of<ForumProvider>(context, listen: false).notify();
  }

  void removeLike(UserData likes){
    _likes.remove(likes);
    _likesMap.remove(likes.key);
  }


  void addFollowers(List<UserData> newFollowers, {BuildContext? context}){

    for(UserData user in newFollowers) {
      if(_followersMap.containsKey(user.key)) continue;
      _followers.add(user);
      _followersMap[user.key] = user;
    }

    if(context == null) return;
    Provider.of<ForumFollowersProvider>(context, listen: false).notify();
    Provider.of<ForumProvider>(context, listen: false).notify();

  }

  void setAllFollowers(List<UserData> allFollowers, {BuildContext? context}){
    _followers.clear();
    _followersMap.clear();
    _followers.addAll(allFollowers);
    _followersMap.addAll({for (UserData? user in allFollowers) user!.key: user});

    if(context == null) return;
    Provider.of<ForumFollowersProvider>(context, listen: false).notify();
    Provider.of<ForumProvider>(context, listen: false).notify();
  }

  void updateFollowers(List<UserData> newFollowers, {BuildContext? context}){

    for(UserData user in newFollowers) {
      int index = _followers.indexWhere((userIter) => userIter.key == user.key);
      _followers.removeAt(index);
      _followers.insert(index, user);
      _followersMap[user.key] = user;
    }

    if(context == null) return;
    Provider.of<ForumFollowersProvider>(context, listen: false).notify();
    Provider.of<ForumProvider>(context, listen: false).notify();
  }

  void removeFollowersByKey(List<String> followerKeys, {BuildContext? context}){

    _followers.removeWhere((user) => followerKeys.contains(user.key));
    for(String followerKey in followerKeys) _followersMap.remove(followerKey);

    if(context == null) return;
    Provider.of<ForumFollowersProvider>(context, listen: false).notify();
    Provider.of<ForumProvider>(context, listen: false).notify();
  }

  void removeFollower(UserData follower){
    _followers.remove(follower);
    _followersMap.remove(follower.key);
  }


  void addManagers(List<ForumManager> newManagers, {BuildContext? context}){

    for(ForumManager manager in newManagers) {
      if(_managersMap.containsKey(manager.key)) continue;
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

    _managers.removeWhere((manager) => managerKeys.contains(manager.key));
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
    required List<UserData> likes,
    required super.likeCnt,

    required super.followed,
    required List<UserData> followers,
    required super.followersCnt,

    required List<ForumManager> managers,
    required this.managerCount,

    required List<Post> allPosts,

    required super.community,

  }): _likes = likes,
      _likesMap = {for (UserData user in likes) user.key: user},

      _followers = followers,
      _followersMap = {for (UserData user in followers) user.key: user},

      _managers = managers,
      _managersMap = {for (ForumManager manager in managers) manager.key: manager},
      _allPosts = allPosts
  {
    _managers.sort((m1, m2) => m1.name.compareTo(m2.name));
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
      managerCount: respMap['managerCount']??(throw InvalidResponseError('managerCount')),

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