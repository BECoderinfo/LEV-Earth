import 'package:lvb_earth_admin/imports/imports.dart';

class MeetingListController extends GetxController {
  RxList<Meeting> meetingList = <Meeting>[].obs;

  @override
  void onInit() {
    super.onInit();
    getMeetingList();
  }

  getMeetingList() async {
    meetingList.value = [
      Meeting(
        meetingId: '3',
        meetingName: 'Meeting 1',
        meetingDate: '2025-01-19',
        meetingTime: '3:00 PM',
        meetingLocation: 'Location 1',
        meetingDescription: 'meetingDescription',
        meetingHost: 'Host 1',
        meetingAttendees: [],
        meetingStatus: 'Upcoming',
      ),
      Meeting(
        meetingId: '2',
        meetingName: 'Meeting 2',
        meetingDate: '2025-01-19',
        meetingTime: '3:00 PM',
        meetingLocation: 'Location 2',
        meetingDescription: 'meetingDescription',
        meetingHost: 'Host 2',
        meetingAttendees: [],
        meetingStatus: 'Upcoming',
      ),
      Meeting(
        meetingId: '1',
        meetingName: 'Meeting 3',
        meetingDate: '2025-01-19',
        meetingTime: '3:00 PM',
        meetingLocation: 'Location 3',
        meetingDescription: 'meetingDescription',
        meetingHost: 'Host 3',
        meetingAttendees: [],
        meetingStatus: 'completed',
      ),
    ];
  }
}
