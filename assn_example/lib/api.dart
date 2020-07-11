import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api.g.dart';

@RestApi(baseUrl: "http://binvitstudio.com/poapper/v1/tutorial")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  static RestClient create() {
    final dio = Dio();
    return RestClient(dio);
  }

  @GET("/feeds")
  Future<List<Feed>> getFeeds();

  @POST("/feeds")
  Future<void> createFeed(@Body() CreateFeed feed);

  @DELETE("/feeds/{id}")
  Future<void> deleteFeed(@Path() int id, @Body() DeleteFeed feed);
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

@JsonSerializable()
class CreateFeed{
  String title;
  String content;
  String password;

  CreateFeed({this.title, this.content, this.password});

  factory CreateFeed.fromJson(Map<String, dynamic> json) => _$CreateFeedFromJson(json);
  Map<String, dynamic> toJson() => _$CreateFeedToJson(this);
}

@JsonSerializable()
class DeleteFeed{
  String password;

  DeleteFeed({this.password});

  factory DeleteFeed.fromJson(Map<String, dynamic> json) => _$DeleteFeedFromJson(json);
  Map<String, dynamic> toJson() => _$DeleteFeedToJson(this);
}