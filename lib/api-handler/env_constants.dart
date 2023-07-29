/// Enum to define Application Environment instance
enum Environment { DEV, STAGING, PROD }

class EnvironmentConstants {
  static String? _config;
  static String base = "http://petsqtr.iclickerp.com/api/";
  static String imageurl =
      "http://petsqtr.iclickerp.com/public/uploadedimages/";
  static String brandimageurl =
      "http://petsqtr.iclickerp.com/public/brandimages/";
  static String bannerimageurl =
      "http://petsqtr.iclickerp.com/public/sliderimages/";

  static String shopifybaseurl =
      "https://b0a7db0f2b400c54215f2e9f6f43a509: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@alaseel-qatar.myshopify.com/admin/api/2020-10/";

  /// method to set environment
  static String setEnvironment(Environment env) {
    switch (env) {
      case Environment.DEV:
        _config = shopifybaseurl;
        break;
      case Environment.STAGING:
        _config = shopifybaseurl;

        break;
      case Environment.PROD:
        _config = shopifybaseurl;

        break;
    }
    return _config!;
  }
}
