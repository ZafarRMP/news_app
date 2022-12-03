import 'package:dart_rss/dart_rss.dart';
import 'package:http/http.dart' as http;

class NewsApi {
  // https://uzreport.news/feed/rss/en

  static Future<RssFeed?> getRss({String? lang}) async {
    try {
      final url = Uri.parse('https://uzreport.news/feed/rss/$lang');
      final response = await http.get(url);
      final data = RssFeed.parse(response.body);

      return data;
    } catch (e) {
      e;
    }
    return null;
  }
}
