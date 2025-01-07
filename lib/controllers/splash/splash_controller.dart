import 'package:get/get.dart';
import 'package:lvb_earth_admin/routes/app_routes.dart';
import 'package:lvb_earth_admin/services/logger_service.dart';

class SplashController extends GetxController {
  final LoggerService _logger = LoggerService();

  @override
  void onInit() {
    super.onInit();
    _logger.logInfo('Splash Screen Initialized');
    _navigateToLogin();
  }

  void _navigateToUserHome() async {
    await Future.delayed(const Duration(seconds: 5)); // Simulate loading
    _logger.logInfo('Navigating to User Home Page');
    Get.offNamed(AppRoutes.userHome); // Navigate to Home Page
  }

  void _navigateToAdminHome() async {
    await Future.delayed(const Duration(seconds: 5)); // Simulate loading
    _logger.logInfo('Navigating to Admin Home Page');
    Get.offNamed(AppRoutes.dashboard); // Navigate to Home Page
  }

  void _navigateToLeaderHome() async {
    await Future.delayed(const Duration(seconds: 5)); // Simulate loading
    _logger.logInfo('Navigating to Leader Home Page');
    Get.offNamed(AppRoutes.manageGroup); // Navigate to Home Page
  }

  void _navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 5)); // Simulate loading
    _logger.logInfo('Navigating to Login Page');
    Get.offNamed(AppRoutes.login); // Navigate to Login Page
  }
}
