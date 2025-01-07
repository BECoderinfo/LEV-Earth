import 'package:get/get.dart';
import 'package:lvb_earth_admin/model/group.dart';

class ManageGroupsController extends GetxController {
  // List of groups (fake data for now)
  var groups = <Group>[
    Group(
      groupName: 'Alpha',
      leader: 'John',
      members: ['Alice', 'Bob'],
    ),
    Group(
      groupName: 'Beta',
      leader: 'Sarah',
      members: ['Tom', 'Jerry'],
    ),
  ].obs;

  // Function to edit a group
  void editGroup(Group group) {
    // Implement navigation to edit group page (or popup)
    Get.snackbar('Edit Group', 'Editing group: ${group.groupName}');
  }

  // Function to delete a group
  void deleteGroup(int index) {
    groups.removeAt(index);
    Get.snackbar('Group Deleted', 'Group removed successfully.');
  }
}
