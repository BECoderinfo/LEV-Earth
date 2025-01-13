import 'package:lvb_earth_admin/imports/imports.dart';
import 'package:lvb_earth_admin/utils/show_toast.dart';

class MeetingDetails extends StatelessWidget {
  const MeetingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    MeetingDetailsController controller = Get.put(MeetingDetailsController());
    Meeting meeting = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Meeting Details"),
        actions: [
          (AppVariables.box.read(StorageKeys.role) == 'admin')
              ? IconButton(
                  onPressed: () {
                    if (meeting.meetingStatus == 'Completed') {
                      ShowToast.showFailedGfToast(
                          msg: "Meeting already completed", ctx: context);
                    } else if (DateTime.now()
                            .toString()
                            .split(" ")[0]
                            .compareTo(DateTime.parse(meeting.meetingDate)
                                .toString()
                                .split(" ")[0]) ==
                        0) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Center(
                            child: Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: AppColors.backgroundColor,
                                  borderRadius: BorderRadius.circular(10)),
                              padding: const EdgeInsets.all(16.0),
                              child: QrImageView(data: meeting.meetingId),
                            ),
                          );
                        },
                      );
                    } else {
                      ShowToast.showFailedGfToast(
                          msg: "Meeting not yet started", ctx: context);
                    }
                  },
                  icon: const Icon(Icons.qr_code))
              : Container(),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Meeting Name
            Text(
              meeting.meetingName,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 16),

            // Meeting Info
            MeetingInfoRow(
                icon: Icons.calendar_today,
                label: "Date",
                value: meeting.meetingDate),
            MeetingInfoRow(
                icon: Icons.access_time,
                label: "Time",
                value: meeting.meetingTime),
            MeetingInfoRow(
                icon: Icons.location_on,
                label: "Location",
                value: meeting.meetingLocation),
            MeetingInfoRow(
                icon: Icons.person, label: "Host", value: meeting.meetingHost),
            SizedBox(height: 16),

            // Meeting Description
            Text(
              "Description",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 8),
            Text(
              meeting.meetingDescription,
              style: Theme.of(context).textTheme.bodySmall,
            ),

            // Optional Actions
            SizedBox(height: 24),
            (meeting.meetingStatus == "Upcoming")
                ? (DateTime.now().toString().split(" ")[0].compareTo(
                            DateTime.parse(meeting.meetingDate)
                                .toString()
                                .split(" ")[0]) ==
                        0)
                    ? (AppVariables.box.read(StorageKeys.role) == 'admin')
                        ? Container()
                        : ElevatedButton(
                            onPressed: () async {
                              // Example Action
                              String barcodeScanRes =
                                  await FlutterBarcodeScanner.scanBarcode(
                                      '#ff0000', 'Cancel', true, ScanMode.QR);
                              Get.snackbar("Action", barcodeScanRes);
                            },
                            child: Text("Join Meeting"),
                          )
                    : Text('This meeting is not yet started')
                : Text('This meeting has already ended'),
            SizedBox(height: 16),

            // Attendees List
            if (meeting.meetingAttendees.isNotEmpty) ...[
              Text(
                "Attendees",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 8),
              ...meeting.meetingAttendees.map((attendee) => ListTile(
                    leading: Icon(Icons.person),
                    title: Text(attendee),
                  )),
            ] else ...[
              Text(
                "No attendees listed.",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class MeetingInfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const MeetingInfoRow({
    required this.icon,
    required this.label,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).primaryColor),
          SizedBox(width: 8),
          Text(
            "$label: ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
