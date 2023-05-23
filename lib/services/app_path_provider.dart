import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path_provider/path_provider.dart' as pp;

class AppPathProvider {
  AppPathProvider._();

  static String? _path;

  static String get path {
    if (_path != null) {
      return _path!;
    } else {
      throw Exception('path not initialized');
    }
  }

  static Future<void> init() async {
    if (kIsWeb) {
      _path = '/';
      return;
    }

    final dir = await pp.getApplicationDocumentsDirectory();
    _path = dir.path;
  }
}
