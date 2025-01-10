class Meeting {
  final String meetingId;
  final String meetingName;
  final String meetingDate;
  final String meetingTime;
  final String meetingLocation;
  final String meetingDescription;
  final String meetingHost;
  final List meetingAttendees;
  final String meetingStatus;

  Meeting({
    required this.meetingId,
    required this.meetingName,
    required this.meetingDate,
    required this.meetingTime,
    required this.meetingLocation,
    required this.meetingDescription,
    required this.meetingHost,
    required this.meetingAttendees,
    required this.meetingStatus,
  });
}
