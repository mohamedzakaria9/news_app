class TimeUtils {
  static String formatTimeAgo(String? publishedAt) {
    if (publishedAt == null || publishedAt.isEmpty) return "";

    try {
      final publishedDate = DateTime.parse(publishedAt).toLocal();
      final now = DateTime.now();
      final diff = now.difference(publishedDate);

      if (diff.inSeconds < 60) {
        return "${diff.inSeconds}s ago";
      } else if (diff.inMinutes < 60) {
        return "${diff.inMinutes}m ago";
      } else if (diff.inHours < 24) {
        return "${diff.inHours}h ago";
      } else if (diff.inDays < 7) {
        return "${diff.inDays}d ago";
      } else {
        return "${(diff.inDays / 7).floor()}w ago";
      }
    } catch (e) {
      return "";
    }
  }
}
