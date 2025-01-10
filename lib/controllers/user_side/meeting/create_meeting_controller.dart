import 'package:lvb_earth_admin/imports/imports.dart';

class CreateMeetingController extends GetxController {
  final meetingNameController = TextEditingController();
  final meetingDateController = TextEditingController();
  final meetingTimeController = TextEditingController();
  final meetingLocationController = TextEditingController();
  final meetingDescriptionController = TextEditingController();
  final meetingHostController = TextEditingController();
  final meetingAttendeesController = TextEditingController();

  // RxList<String> attendeesList = <String>[].obs;

  // void addAttendee(String attendee) {
  //   if (attendee.isNotEmpty) {
  //     attendeesList.add(attendee);
  //     meetingAttendeesController.clear();
  //   }
  // }

  void createMeeting() {
    if (meetingNameController.text.isEmpty ||
        meetingDateController.text.isEmpty ||
        meetingTimeController.text.isEmpty ||
        meetingLocationController.text.isEmpty ||
        meetingDescriptionController.text.isEmpty ||
        meetingHostController.text.isEmpty) {
      Get.snackbar("Error", "Please fill all required fields.");
      return;
    }

    // Handle meeting creation logic here.
    Get.snackbar("Success", "Meeting created successfully!");
    Get.back();
  }
}
