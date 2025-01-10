import 'package:lvb_earth_admin/imports/imports.dart';

class MeetingListController extends GetxController {
  RxList<Meeting> meetingList = <Meeting>[].obs;
  RxMap<String, Map<String, List<Meeting>>> groupedMeetings =
      <String, Map<String, List<Meeting>>>{}.obs;

  @override
  void onInit() {
    super.onInit();
    getMeetingList();
    groupMeetingsByMonthAndStatus();
  }

  getMeetingList() async {
    meetingList.value = [
      Meeting(
        meetingId: '1',
        meetingName: 'Meeting A',
        meetingDate: '2025-01-05',
        meetingTime: '10:00 AM',
        meetingLocation: 'Location A',
        meetingDescription: 'Description A',
        meetingHost: 'Host A',
        meetingAttendees: [],
        meetingStatus: 'Completed',
      ),
      Meeting(
        meetingId: '2',
        meetingName: 'Meeting B',
        meetingDate: '2025-01-10',
        meetingTime: '2:00 PM',
        meetingLocation: 'Location B',
        meetingDescription: 'Description B',
        meetingHost: 'Host B',
        meetingAttendees: [],
        meetingStatus: 'Upcoming',
      ),
      Meeting(
        meetingId: '3',
        meetingName: 'Meeting C',
        meetingDate: '2024-12-18',
        meetingTime: '1:00 PM',
        meetingLocation: 'Location C',
        meetingDescription: 'Description C',
        meetingHost: 'Host C',
        meetingAttendees: [],
        meetingStatus: 'Completed',
      ),
      Meeting(
        meetingId: '4',
        meetingName: 'Meeting D',
        meetingDate: '2024-12-25',
        meetingTime: '11:00 AM',
        meetingLocation: 'Location D',
        meetingDescription: 'Description D',
        meetingHost: 'Host D',
        meetingAttendees: [],
        meetingStatus: 'Completed',
      ),
      Meeting(
        meetingId: '5',
        meetingName: 'Meeting E',
        meetingDate: '2024-11-25',
        meetingTime: '11:00 AM',
        meetingLocation: 'Location E',
        meetingDescription: 'Description E',
        meetingHost: 'Host E',
        meetingAttendees: [],
        meetingStatus: 'Completed',
      ),
    ];
  }

  void groupMeetingsByMonthAndStatus() {
    groupedMeetings.value = {};
    for (var meeting in meetingList) {
      final date = DateTime.parse(meeting.meetingDate);
      final monthYear = "${date.year}-${date.month.toString().padLeft(2, '0')}";
      final status = meeting.meetingStatus;

      groupedMeetings[monthYear] ??= {"Upcoming": [], "Completed": []};
      groupedMeetings[monthYear]![status]?.add(meeting);
    }
  }
}
