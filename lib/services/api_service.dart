import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoon_app/models/webtoon_detail_model.dart';
import 'package:webtoon_app/models/webtoon_episode_model.dart';
import 'package:webtoon_app/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebToonModel>> getTodaysToons() async {
    List<WebToonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        final toon = WebToonModel.fromJson(webtoon);
        webtoonInstances.add(toon);
      }
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebToonDetailModel> getToonsDetail(String id) async {
    late final dynamic json;
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      json = jsonDecode(response.body);
      final detail = WebToonDetailModel.fromJson(json);
      return detail;
    }
    throw Error();
  }

  static Future<List<WebToonEpisodeModel>> getDatestEpisodesById(
      String id) async {
    List<WebToonEpisodeModel> episodesInstances = [];
    late final dynamic list;
    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      list = jsonDecode(response.body);
      for (var ele in list) {
        final episode = WebToonEpisodeModel.fromJson(ele);
        episodesInstances.add(episode);
      }
      return episodesInstances;
    }
    throw Error();
  }
}
