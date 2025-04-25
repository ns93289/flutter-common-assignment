import 'api_base_helper.dart';
import 'api_constant.dart';

///Repository class for movies
class MovieRepo {
  final ApiBaseHelper _apiBaseHelper = ApiBaseHelper(baseUrl: BaseUrl.tmdbUrl);

  dynamic getMovieList(int page) async {
    dynamic response = await _apiBaseHelper.get(
      api: EndPoint.movieList,
      queryParameters: {ApiParams.page: page, ApiParams.apiKey: "15b22726208b83af311f7513f00379d1", ApiParams.language: "en-US"},
    );

    return response;
  }

  dynamic getMovieDetails(int movieId) async {
    dynamic response = await _apiBaseHelper.get(
      api: "${EndPoint.movieDetails}/$movieId",
      queryParameters: {ApiParams.apiKey: "15b22726208b83af311f7513f00379d1", ApiParams.language: "en-US"},
    );

    return response;
  }
}

///Repository class for users
class UserRepo {
  final ApiBaseHelper _apiBaseHelper = ApiBaseHelper();

  dynamic getUserList(int page) async {
    dynamic response = await _apiBaseHelper.get(api: EndPoint.userList, queryParameters: {ApiParams.page: page});

    return response;
  }

  dynamic addUserRecord({String name = "", String job = ""}) async {
    dynamic response = await _apiBaseHelper.post(api: EndPoint.userList, queryParameters: {ApiParams.name: name, ApiParams.job: job});

    return response;
  }
}
