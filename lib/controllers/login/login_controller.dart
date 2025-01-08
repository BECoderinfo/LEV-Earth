import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lvb_earth_admin/routes/app_routes.dart';
import 'package:lvb_earth_admin/services/logger_service.dart';
import 'package:lvb_earth_admin/utils/app_variables.dart';
import 'package:lvb_earth_admin/utils/storage_keys.dart';

class LoginController extends GetxController {
  final LoggerService _logger = LoggerService();

  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String idError = '';

  final formKey = GlobalKey<FormState>();

  void login() {
    if (idController.text == 'admin') {
      AppVariables.box.write(StorageKeys.role, 'admin');
      _navigateToAdminHome();
    } else if (idController.text == 'leader') {
      AppVariables.box.write(StorageKeys.role, 'leader');
      _navigateToLeaderHome();
    } else {
      AppVariables.box.write(StorageKeys.role, 'user');
      _navigateToUserHome();
    }
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
