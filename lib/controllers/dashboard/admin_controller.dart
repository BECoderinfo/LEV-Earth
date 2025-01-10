import 'package:lvb_earth_admin/imports/imports.dart';

class DashboardController extends GetxController {
  // Statistics data
  final stats = [
    {'title': 'Total Users', 'value': 10, 'page': AppRoutes.manageUser},
    {'title': 'Total Groups', 'value': 3, 'page': AppRoutes.manageGroup},
  ].obs;

  // Recent activities
  final recentActivities = [
    {
      'title': 'Group Created',
      'description': 'Admin created a new group: Flutter Enthusiasts',
    },
    {
      'title': 'User Joined',
      'description': 'John Doe joined the group: Dart Developers',
    },
    {
      'title': 'Points Updated',
      'description': 'Group leader assigned 50 points to Jane Doe.',
    },
  ].obs;

  // Methods to update data
  void addActivity(String title, String description) {
    recentActivities.add({'title': title, 'description': description});
  }

  void updateStat(String title, int newValue) {
    for (var stat in stats) {
      if (stat['title'] == title) {
        stat['value'] = newValue;
        stats.refresh();
        break;
      }
    }
  }

  void logout() {
    Get.offNamed(AppRoutes.login); // Navigate to Login Page
  }
}
