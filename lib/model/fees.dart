class Fee {
  final String meetingName;
  final double amount;
  String status;
  final String date;
  final String description;

  Fee({
    required this.meetingName,
    required this.amount,
    required this.status,
    required this.date,
    required this.description,
  });
}
