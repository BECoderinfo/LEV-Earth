import 'package:lvb_earth_admin/imports/imports.dart';

class AddGroupController extends GetxController {
  // Form fields
  var groupName = ''.obs;
  var leaderName = ''.obs;
  var members = <String>[].obs;

  // Function to add a member to the group
  void addMember(String member) {
    if (member.isNotEmpty) {
      members.add(member);
    }
  }

  // Function to remove a member
  void removeMember(int index) {
    members.removeAt(index);
  }

  // Function to handle group submission
  void submitGroup() {
    if (groupName.isEmpty || leaderName.isEmpty || members.isEmpty) {
      Get.snackbar(
          'Error', 'Please fill all fields and add at least one member.');
    } else {
      // Simulate sending data to API
      Get.snackbar(
          'Success', 'Group "${groupName.value}" created successfully!');
      // Reset fields after submission
      groupName.value = '';
      leaderName.value = '';
      members.clear();
    }
  }
}
