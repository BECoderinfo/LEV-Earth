import 'package:lvb_earth_admin/imports/imports.dart';

class MeetingList extends StatelessWidget {
  const MeetingList({super.key});

  @override
  Widget build(BuildContext context) {
    MeetingListController controller = Get.put(MeetingListController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Meeting List"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          if (controller.groupedMeetings.isEmpty) {
            return Center(child: Text("No meetings available"));
          }

          return ListView.builder(
            itemCount: controller.groupedMeetings.keys.length,
            itemBuilder: (context, index) {
              final monthYear =
                  controller.groupedMeetings.keys.elementAt(index);
              final upcomingMeetings =
                  controller.groupedMeetings[monthYear]!["Upcoming"]!;
              final completedMeetings =
                  controller.groupedMeetings[monthYear]!["Completed"]!;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    monthYear,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  if (upcomingMeetings.isNotEmpty) ...[
                    Text("Upcoming Meetings",
                        style: Theme.of(context).textTheme.titleLarge),
                    ...upcomingMeetings
                        .map((meeting) => MeetingCard(meeting))
                        .toList(),
                  ],
                  if (completedMeetings.isNotEmpty) ...[
                    Text("Completed Meetings",
                        style: Theme.of(context).textTheme.titleLarge),
                    ...completedMeetings
                        .map((meeting) => MeetingCard(meeting))
                        .toList(),
                  ],
                  SizedBox(height: 20),
                ],
              );
            },
          );
        }),
      ),
      floatingActionButton: (AppVariables.box.read(StorageKeys.role) == 'admin')
          ? FloatingActionButton.extended(
              onPressed: () {
                Get.toNamed(AppRoutes.meetingCreate);
              },
              backgroundColor: AppColors.primaryColor,
              label: Text("Create Meeting"),
              icon: const Icon(Icons.add),
            )
          : null,
    );
  }
}

class MeetingCard extends StatelessWidget {
  final Meeting meeting;

  const MeetingCard(this.meeting, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        onTap: () {
          Get.toNamed(AppRoutes.meetingDetails, arguments: meeting);
        },
        title: Text(meeting.meetingName),
        subtitle: Text(
            "${meeting.meetingDate} at ${meeting.meetingTime}\nLocation: ${meeting.meetingLocation}"),
        trailing: Text(meeting.meetingStatus),
      ),
    );
  }
}
