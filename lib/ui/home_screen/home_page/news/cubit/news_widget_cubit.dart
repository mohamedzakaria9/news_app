import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_app/api/ApiManager.dart';
import 'package:new_app/models/NewsResponse.dart';

part 'news_widget_state.dart';

class NewsWidgetCubit extends Cubit<NewsWidgetState> {
  NewsWidgetCubit() : super(NewsWidgetInitial());

  List<News> _articles = [];
  int _currentPage = 1;
  bool _hasReachedMax = false;
  String _currentSourceId = "";
  static const int _pageSize = 10;

  List<News> get articles => _articles;
  bool get hasReachedMax => _hasReachedMax;

  // Load initial news for a source
  Future<void> loadNews(String sourceId) async {
    if (_currentSourceId != sourceId) {
      // Reset pagination when switching sources
      _resetPagination();
      _currentSourceId = sourceId;
    }

    emit(NewsWidgetLoading());

    try {
      final newsResponse = await ApiManager.getNewsBySourceId(
        sourceId,
        page: _currentPage,
        pageSize: _pageSize,
      );

      if (newsResponse.status == "ok") {
        final newArticles = newsResponse.articles ?? [];

        if (newArticles.isEmpty) {
          _hasReachedMax = true;
          emit(NewsWidgetLoaded(_articles, hasReachedMax: true));
        } else {
          _articles.addAll(newArticles);
          _currentPage++;

          // Check if we got fewer articles than requested (last page)
          if (newArticles.length < _pageSize) {
            _hasReachedMax = true;
          }

          emit(NewsWidgetLoaded(_articles, hasReachedMax: _hasReachedMax));
        }
      } else {
        emit(NewsWidgetError(newsResponse.message ?? "Unknown error occurred"));
      }
    } catch (e) {
      emit(NewsWidgetError(e.toString()));
    }
  }

  // Load more news for pagination
  Future<void> loadMoreNews() async {
    if (_hasReachedMax || state is NewsWidgetLoadingMore) return;

    emit(NewsWidgetLoadingMore(_articles));

    try {
      final newsResponse = await ApiManager.getNewsBySourceId(
        _currentSourceId,
        page: _currentPage,
        pageSize: _pageSize,
      );

      if (newsResponse.status == "ok") {
        final newArticles = newsResponse.articles ?? [];

        if (newArticles.isEmpty) {
          _hasReachedMax = true;
          emit(NewsWidgetLoaded(_articles, hasReachedMax: true));
        } else {
          _articles.addAll(newArticles);
          _currentPage++;

          // Check if we got fewer articles than requested (last page)
          if (newArticles.length < _pageSize) {
            _hasReachedMax = true;
          }

          emit(NewsWidgetLoaded(_articles, hasReachedMax: _hasReachedMax));
        }
      } else {
        emit(NewsWidgetError(newsResponse.message ?? "Failed to load more news"));
      }
    } catch (e) {
      emit(NewsWidgetError("Failed to load more news: ${e.toString()}"));
    }
  }

  // Reset pagination state
  void _resetPagination() {
    _articles.clear();
    _currentPage = 1;
    _hasReachedMax = false;
  }

  // Refresh news (pull-to-refresh)
  Future<void> refreshNews() async {
    _resetPagination();
    await loadNews(_currentSourceId);
  }
}