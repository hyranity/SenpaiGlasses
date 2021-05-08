class DurationFormat {
  static String getDurationLeft(Duration duration) {
    return duration.inMinutes < 60
        ? '${(duration.inMinutes).floor()} mins ago'
        : duration.inHours < 24
            ? '${(duration.inHours).floor()} hours ago'
            : duration.inDays < 24
                ? '${(duration.inDays).floor()} days ago'
                : duration.inDays / 7 < 4
                    ? '${(duration.inDays / 7).floor()} weeks ago'
                    : (duration.inDays / 7) / 4 < 12
                        ? '${((duration.inDays / 7) / 4).floor()} months ago'
                        : '${((duration.inDays / 7) / 4 / 12).floor()} years ago';
  }
}
