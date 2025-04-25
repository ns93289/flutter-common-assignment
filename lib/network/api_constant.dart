class BaseUrl {
  static const String url = "https://reqres.in";
  static const String tmdbUrl = "https://api.themoviedb.org";
  static const String apiUrl = "$url/api";
}

class EndPoint {
  static const String userList = "/users";

  ///Movie APIs
  static const String movieList = "/3/trending/movie/day";
  static const String movieDetails = "/3/movie";
}

class ApiParams {
  static const String id = "id";
  static const String page = "page";
  static const String apiKey = "api_key";
  static const String language = "language";
  static const String name = "name";
  static const String job = "job";
}
