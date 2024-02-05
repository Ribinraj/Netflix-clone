import 'dart:convert';
 import 'package:http/http.dart' as http;

import 'package:netflix/core/constants.dart';
import 'package:netflix/model/movie.dart';


class Api {
  static const _trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constatnts.apiKey}';
      static const _topratedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constatnts.apiKey}';
      static const _upcoming='https://api.themoviedb.org/3/movie/upcoming?api_key=${Constatnts.apiKey}';
      static const _popularUrl= 'https://api.themoviedb.org/3/movie/popular?api_key=${Constatnts.apiKey}';
      static const _top10seriesUrl='https://api.themoviedb.org/3/trending/movie/day?api_key=${Constatnts.apiKey}';
  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something Happend');
    }
  }
    Future<List<Movie>> getTopratedMovies() async {
    final response = await http.get(Uri.parse(_topratedUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something Happend');
    }
  }
    Future<List<Movie>> getupcomingMovies() async {
    final response = await http.get(Uri.parse(_upcoming));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something Happend');
    }
  }
    Future<List<Movie>> getpopularMovies() async {
    final response = await http.get(Uri.parse(_popularUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something Happend');
    }
  }
    Future<List<Movie>> gettop10series() async {
    final response = await http.get(Uri.parse(_top10seriesUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something Happend');
    }
  }
}
