part of 'movie_images_cubit.dart';

abstract class MovieImagesState {}

class MovieImagesInitial extends MovieImagesState {}

class MovieImagesLoading extends MovieImagesState {}

class MovieImagesSuccess extends MovieImagesState {}

class MovieImagesError extends MovieImagesState {
  final String message;
  MovieImagesError({required this.message});
}
