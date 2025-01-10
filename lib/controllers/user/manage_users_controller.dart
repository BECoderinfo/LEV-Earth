import 'package:lvb_earth_admin/imports/imports.dart';

class ManageUsersController extends GetxController {
  var users = <User>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadUsers();
  }

  void loadUsers() {
    // Replace with API call or local data
    users.assignAll([
      User(name: "Alice", email: "alice@example.com", role: "Member"),
      User(name: "Bob", email: "bob@example.com", role: "Leader"),
      User(name: "Charlie", email: "charlie@example.com", role: "Admin"),
    ]);
  }

  void addUser() {
    // Navigate to Add User Page
    Get.to(() => EditUserPage(isEditing: false));
  }

  void editUser(User user) {
    // Navigate to Edit User Page with user data
    Get.to(() => EditUserPage(isEditing: true, user: user));
  }

  void deleteUser(User user) {
    // Confirm deletion
    Get.defaultDialog(
      title: 'Delete User',
      middleText: 'Are you sure you want to delete ${user.name}?',
      textConfirm: 'Yes',
      textCancel: 'No',
      onConfirm: () {
        users.remove(user);
        Get.back(); // Close dialog
        Get.snackbar(
          'User Deleted',
          '${user.name} has been removed successfully.',
          snackPosition: SnackPosition.BOTTOM,
        );
      },
    );
  }
}
