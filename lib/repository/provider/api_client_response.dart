import 'package:dio/dio.dart';
import 'package:test_flutter/repository/dio_logging.dart';
import 'package:test_flutter/repository/model/movie.dart';

class ApiClientResponse {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://imdb8.p.rapidapi.com/',
      sendTimeout: 30000,
      connectTimeout: 30000,
    ),
  )..interceptors.add(Logging());

  Future<List<ResultResponse>?> fetchMovie() async {
    List<ResultResponse>? datas;
    try {
      Response response = await _dio.get('title/find',
          queryParameters: {
            'q': 'game of thr',
          },
          options: Options(headers: {
            'x-rapidapi-host': 'imdb8.p.rapidapi.com',
            'x-rapidapi-key':
                'bd106a0bbbmshb05e2e1a0591fecp1c9c66jsnd61e7c9d2c63'
          }));

      List<ResultResponse>? resultData =
          MovieResponse.fromJson(response.data).results;
      return datas = resultData;
    } on DioError catch (e) {
      e.toString();
    }
    return datas;
  }

  Future<ImageResponse?> detailMovie({required String? id}) async {
    try {
      Response response = await _dio.get(
        'title/get-details?tconst=tt13391176',
        queryParameters: {
          'tconst': id,
        },
        options: Options(
          headers: {
            'x-rapidapi-host': 'imdb8.p.rapidapi.com',
            'x-rapidapi-key':
                'bd106a0bbbmshb05e2e1a0591fecp1c9c66jsnd61e7c9d2c63'
          },
        ),
      );

      ImageResponse? resultData = ImageResponse.fromJson(response.data);
      return resultData;
    } on DioError catch (e) {
      e.toString();
    }
    return null;
  }
}
