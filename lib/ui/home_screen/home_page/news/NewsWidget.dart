import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/models/SourceResponse.dart';
import 'package:new_app/utiles/AppRoutes.dart';

import '../../../../utiles/AppColors.dart';
import '../../../../utiles/TimeUtiles.dart';
import 'cubit/news_widget_cubit.dart';

class NewsWidget extends StatefulWidget {
  NewsWidget({super.key, required this.source});

  Source source;

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  final ScrollController _scrollController = ScrollController();
  late NewsWidgetCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<NewsWidgetCubit>();
    _setupScrollController();
    _loadInitialData();
  }

  void _setupScrollController() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        // Load more when user is 200px from the bottom
        _cubit.loadMoreNews();
      }
    });
  }

  void _loadInitialData() {
    _cubit.loadNews(widget.source.id ?? "");
  }

  @override
  void didUpdateWidget(NewsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Load news when source changes
    if (oldWidget.source.id != widget.source.id) {
      _cubit.loadNews(widget.source.id ?? "");
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return BlocBuilder<NewsWidgetCubit, NewsWidgetState>(
      builder: (context, state) {
        switch (state) {
          case NewsWidgetInitial():
          case NewsWidgetLoading():
            return Center(
              child: CircularProgressIndicator(color: AppColors.greyScaleColor),
            );

          case NewsWidgetError():
            return Text("No Articles Found");

          case NewsWidgetLoaded():
          case NewsWidgetLoadingMore():
            final articles = state is NewsWidgetLoaded
                ? state.articles
                : (state as NewsWidgetLoadingMore).articles;

            if (articles.isEmpty) {
              return const Center(child: Text("No articles available"));
            }

            return ListView.builder(
              controller: _scrollController,
              itemCount: articles.length + 1, // +1 for loading indicator
              itemBuilder: (context, index) {
                print(articles.length);
                // Show loading indicator at the end
                if (index == articles.length) {
                  if (state is NewsWidgetLoadingMore) {
                    return const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else if (_cubit.hasReachedMax) {
                    return const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(
                        child: Text(
                          'No more articles',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                }

                final article = articles[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                  child: Card(
                    elevation: 0,
                    child: InkWell(
                      onTap: () {
                        print(article.url);
                        Navigator.pushNamed(
                          context,
                          AppRoutes.detailsScreen,
                          arguments: article,
                        );
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            child: Image.network(
                              article.urlToImage ?? "",
                              width: width * 0.3,
                              height: height * 0.13,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: width * 0.03),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: height * 0.01),
                                Text(
                                  article.source?.name ?? " ",
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: height * 0.005),
                                Text(
                                  article.title ?? " ",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: height * 0.005),
                                Text(
                                  TimeUtils.formatTimeAgo(article.publishedAt),
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );

          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}