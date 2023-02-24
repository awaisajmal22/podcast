

import 'package:webfeed/domain/rss_feed.dart';
import 'package:http/http.dart' as http;


loadFeedService({required String feed}) async {
  try {
    final client = http.Client();
    final response = await client.get(Uri.parse(feed));
    return RssFeed.parse(response.body);
  } catch (e) {
    //
  }
}


