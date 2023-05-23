import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';

import 'app_data_box.dart';
import 'app_path_provider.dart';



class ApiClient {
  /// Base URL should always end with a trailing slash


  static const rootUrl = 'https://rootUrl.com/';
  static const baseUrl = 'https://baseUrl.com/v1/';



  static Map<String, String> commonHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  // late String? accessToken;
  late Map<String, String> headers;
  late String appPath;

  final Dio client = Dio();

  final cacheOptions = CacheOptions(
    // A default store is required for interceptor.
    store: HiveCacheStore(AppPathProvider.path, hiveBoxName: '_network_cache'),

    // All subsequent fields are optional.

    // Default.
    policy: CachePolicy.request,
    // Returns a cached response on error but for statuses 401 & 403.
    // Also allows to return a cached response on network errors (e.g. offline usage).
    // Defaults to [null].
    hitCacheOnErrorExcept: [401, 403],
    // Overrides any HTTP directive to delete entry past this duration.
    // Useful only when origin server has no cache config or custom behavior is desired.
    // Defaults to [null].
    maxStale: const Duration(days: 3),
    // Default. Allows 3 cache sets and ease cleanup.
    priority: CachePriority.normal,
    // Default. Body and headers encryption with your own algorithm.
    cipher: null,
    // Default. Key builder to retrieve requests.
    keyBuilder: CacheOptions.defaultCacheKeyBuilder,
    // Default. Allows to cache POST requests.
    // Overriding [keyBuilder] is strongly recommended when [true].
    allowPostMethod: false,
  );

  /// The API Client is dependent on the Dio HTTP client.
  /// However, for authenticated users, it also depends on the auth token box.
  ApiClient() {
    // accessToken = useAppDataBox().get('accessToken');
    client
      ..options.baseUrl = rootUrl
      ..options.headers = commonHeaders
      ..interceptors.add(TokenInterceptor())
      ..interceptors.add(LogInterceptor())
      ..interceptors.add(LaravelRequestInterceptor())
      ..interceptors.add(DioCacheInterceptor(options: cacheOptions));
  }

  // HTTP client with minimal options
  static Dio http = Dio(BaseOptions(headers: commonHeaders));
}

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = useAppDataBox().get('accessToken');
    options.headers['Authorization'] = 'Bearer $accessToken';
    print('>>>>>>>>>>added accessToken from interceptor: $accessToken');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    handler.next(err);
  }
}

class LaravelRequestInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // print('laravel req interceptor>>>>>');
    // print(options.headers['X-Override-Method'] ?? 'nope>><<<nope');

    if (options.headers.containsKey('X-Override-Method')) {
      // print('>>>>> adding X-Override-Method to the body');
      options.data['_method'] = options.headers['X-Override-Method'];
      // print(options.data['_method']);
    }
    handler.next(options);
  }
}
