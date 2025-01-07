import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lvb_earth_admin/routes/app_routes.dart';
import 'package:lvb_earth_admin/services/logger_service.dart';

class LoginController extends GetxController {
  final LoggerService _logger = LoggerService();

  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void login() {
    // _navigateToUserHome();
    // _navigateToAdminHome();
    _navigateToLeaderHome();
  }

  void _navigateToUserHome() async {
    // await Future.delayed(const Duration(seconds: 5)); // Simulate loading
    _logger.logInfo('Navigating to User Home Page');
    Get.offNamed(AppRoutes.userHome); // Navigate to Home Page
  }

  void _navigateToAdminHome() async {
    // await Future.delayed(const Duration(seconds: 5)); // Simulate loading
    _logger.logInfo('Navigating to Admin Home Page');
    Get.offNamed(AppRoutes.dashboard); // Navigate to Home Page
  }

  void _navigateToLeaderHome() async {
    // await Future.delayed(const Duration(seconds: 5)); // Simulate loading
    _logger.logInfo('Navigating to Leader Home Page');
    Get.offNamed(AppRoutes.groupDetails); // Navigate to Home Page
  }
}