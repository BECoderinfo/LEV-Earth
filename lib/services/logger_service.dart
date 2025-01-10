import 'package:lvb_earth_admin/imports/imports.dart';

class LoggerService {
  // Singleton pattern
  static final LoggerService _instance = LoggerService._internal();

  factory LoggerService() {
    return _instance;
  }

  LoggerService._internal(); // Private constructor

  final Logger logger = Logger(); // Logger instance

  // You can add custom log methods here if needed
  void logInfo(String message) {
    logger.i(message);
  }

  void logError(String message) {
    logger.e(message);
  }

  void logDebug(String message) {
    logger.d(message);
  }

  void logWarning(String message) {
    logger.w(message);
  }
}
