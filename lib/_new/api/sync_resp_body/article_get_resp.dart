
import 'package:harcapp/_new/api/_api.dart';
import 'package:harcapp/_new/api/sync_resp_body/sync_entity_resp.dart';
import 'package:harcapp/_new/cat_page_harcthought/articles/article.dart';

class ArticleGetResp extends SyncGetResp {

  static const String collName = Article.syncClassId;

  static const String paramLiked = Article.paramLiked;
  final bool liked;

  static const String paramBookmarked = Article.paramBookmarked;
  final bool bookmarked;

  static const String paramSeen = Article.paramSeen;
  final bool seen;

  const ArticleGetResp({
    required this.liked,
    required this.bookmarked,
    required this.seen
  });

  static ArticleGetResp from(Map respData) => ArticleGetResp(
    liked: respData[paramLiked]??(throw InvalidResponseError(paramLiked)),
    bookmarked: respData[paramBookmarked]??(throw InvalidResponseError(paramBookmarked)),
    seen: respData[paramSeen]??(throw InvalidResponseError(paramSeen)),
  );

}