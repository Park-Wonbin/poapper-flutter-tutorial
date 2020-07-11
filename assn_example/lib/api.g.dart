// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feed _$FeedFromJson(Map<String, dynamic> json) {
  return Feed(
    id: json['id'] as int,
    title: json['title'] as String,
    content: json['content'] as String,
  );
}

Map<String, dynamic> _$FeedToJson(Feed instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
    };

CreateFeed _$CreateFeedFromJson(Map<String, dynamic> json) {
  return CreateFeed(
    title: json['title'] as String,
    content: json['content'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$CreateFeedToJson(CreateFeed instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'password': instance.password,
    };

DeleteFeed _$DeleteFeedFromJson(Map<String, dynamic> json) {
  return DeleteFeed(
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$DeleteFeedToJson(DeleteFeed instance) =>
    <String, dynamic>{
      'password': instance.password,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'http://binvitstudio.com/poapper/v1/tutorial';
  }

  final Dio _dio;

  String baseUrl;

  @override
  getFeeds() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('/feeds',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Feed.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  createFeed(feed) async {
    ArgumentError.checkNotNull(feed, 'feed');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(feed?.toJson() ?? <String, dynamic>{});
    await _dio.request<void>('/feeds',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    return null;
  }

  @override
  deleteFeed(id, feed) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(feed, 'feed');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(feed?.toJson() ?? <String, dynamic>{});
    await _dio.request<void>('/feeds/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    return null;
  }
}
