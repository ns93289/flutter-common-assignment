import 'package:first_app/bloc/bloc.dart';
import 'package:first_app/network/api_reponse.dart';
import 'package:first_app/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../network/api_repository.dart';
import 'movie_details_model.dart';

class MovieDetailsBloc extends Bloc {
  final BuildContext context;
  final int movieId;

  MovieDetailsBloc(this.context, this.movieId) {
    callMovieDetailsApi();
  }

  final _movieRepo = MovieRepo();

  final movieDetailsSubject = BehaviorSubject<ApiResponse<MovieDetailsModel>>();

  callMovieDetailsApi() async {
    try {
      movieDetailsSubject.add(ApiResponse.loading());
      final data = MovieDetailsModel.fromJson(await _movieRepo.getMovieDetails(movieId));

      movieDetailsSubject.add(ApiResponse.complete(data: data));
    } catch (e) {
      movieDetailsSubject.add(ApiResponse.error(message: e.toString()));
      logD("callMovieDetailsApi>>>", e.toString());
    }
  }

  @override
  void dispose() {
    movieDetailsSubject.close();
  }
}
