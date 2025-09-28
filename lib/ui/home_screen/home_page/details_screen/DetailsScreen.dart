import 'package:flutter/material.dart';
import 'package:new_app/customWidgits/CustomElevatedButton.dart';
import 'package:new_app/models/NewsResponse.dart';
import 'package:new_app/utiles/AppFonts.dart';
import 'package:new_app/utiles/AppImages.dart';
import 'package:new_app/utiles/TimeUtiles.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = "details";

  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)!.settings.arguments as News;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              ///todo: will share the article via another application
            },
            icon: Image.asset(AppImages.shareIcon),
          ),
          IconButton(
            onPressed: () {
              ///todo: will open more options
            },
            icon: Image.asset(AppImages.moreIcon),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.source?.name ?? "No Source",
              style: AppFonts.bold16Black,
            ),
            const SizedBox(height: 5),
            Text(article.author ?? "No Author", style: AppFonts.bold16Black),
            const SizedBox(height: 5),
            Text(
              TimeUtils.formatTimeAgo(article.publishedAt),
              style: AppFonts.medium16GreyScale,
            ),
            const SizedBox(height: 15),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                article.urlToImage ?? "",
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.image_not_supported,
                      color: Colors.grey,
                      size: 50,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 15),
            Text(
              article.title ?? "No Title",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              article.description ?? "No Description",
              style: const TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              article.content ?? "No content",
              style: const TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            CustomElevatedButton(
              buttonText: "Open Full Article",
              onPressed: () async {
                if (article.url != null && article.url!.isNotEmpty) {
                  try {
                    final Uri url = Uri.parse(article.url!);

                    // Check if the URL can be launched
                    if (await canLaunchUrl(url)) {
                      // Launch URL in external browser
                      await launchUrl(
                        url,
                        mode: LaunchMode.externalApplication,
                      );
                    } else {
                      throw 'Could not launch ${article.url}';
                    }
                  } catch (e) {
                    // Show error message
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Could not open article: $e"),
                          backgroundColor: Colors.red,
                          duration: const Duration(seconds: 3),
                        ),
                      );
                    }
                  }
                } else {
                  // Show error if no URL available
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Article URL not available"),
                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 3),
                    ),
                  );
                }
              },
              buttonTextStyle: AppFonts.medium16White,
            ),
          ],
        ),
      ),
    );
  }
}