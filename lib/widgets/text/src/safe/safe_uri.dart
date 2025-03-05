extension SafeUri on Uri {
  static Uri? parse(String uriString, [int start = 0, int? end]) {
    Uri? safeParsedUri;
    try {
      safeParsedUri = Uri.parse(uriString, start, end);
    } on Exception catch (_) {
      safeParsedUri = null;
    }
    return safeParsedUri;
  }
}
