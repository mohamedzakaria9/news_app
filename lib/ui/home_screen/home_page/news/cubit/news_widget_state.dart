part of 'news_widget_cubit.dart';

@immutable
sealed class NewsWidgetState {}

final class NewsWidgetInitial extends NewsWidgetState {}

final class NewsWidgetLoading extends NewsWidgetState {}

final class NewsWidgetLoaded extends NewsWidgetState {
  final List<News> articles;
  final bool hasReachedMax;

  NewsWidgetLoaded(this.articles, {this.hasReachedMax = false});
}

final class NewsWidgetLoadingMore extends NewsWidgetState {
  final List<News> articles;

  NewsWidgetLoadingMore(this.articles);
}

final class NewsWidgetError extends NewsWidgetState {
  final String message;

  NewsWidgetError(this.message);
}