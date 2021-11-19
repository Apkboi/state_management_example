import 'package:dio/dio.dart';

class ApiHelper {
  static Dio? _dio;
  static String apiKey = '3189670a5af406da03f513c311f29341';
  static String imageBaseUerl = 'https://image.tmdb.org/t/p/w500';

  static Dio get dio {
    BaseOptions options = BaseOptions(
        baseUrl: "https://api.themoviedb.org/3",
        connectTimeout: 5000,
        receiveTimeout: 3000);

    return _dio ??= Dio(options);
  }
}
