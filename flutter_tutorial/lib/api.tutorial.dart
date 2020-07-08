import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api.tutorial.g.dart';

@RestApi(baseUrl: "http://binvitstudio.com/poapper/v1/tutorial")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  static RestClient create() {
    final dio = Dio();
    return RestClient(dio);
  }

  @GET("/feeds")
  Future<List<Feed>> getFeeds();
}

@JsonSerializable()
class Feed {
  int id;
  String title;
  String content;

  Feed({this.id, this.title, this.content});

  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);
  Map<String, dynamic> toJson() => _$FeedToJson(this);
}
