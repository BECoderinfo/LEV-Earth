import 'package:lvb_earth_admin/imports/imports.dart';

class CreateMeetingPage extends StatelessWidget {
  const CreateMeetingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreateMeetingController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Meeting"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Meeting Name
            TextField(
              controller: controller.meetingNameController,
              decoration: const InputDecoration(labelText: "Meeting Name"),
            ),
            const SizedBox(height: 16),

            // Meeting Date
            TextField(
              controller: controller.meetingDateController,
              decoration: const InputDecoration(labelText: "Meeting Date"),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  controller.meetingDateController.text =
                      pickedDate.toLocal().toString().split(' ')[0];
                }
              },
            ),
            const SizedBox(height: 16),

            // Meeting Time
            TextField(
              controller: controller.meetingTimeController,
              decoration: const InputDecoration(labelText: "Meeting Time"),
              readOnly: true,
              onTap: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (pickedTime != null) {
                  controller.meetingTimeController.text =
                      pickedTime.format(context);
                }
              },
            ),
            const SizedBox(height: 16),

            // Meeting Location
            TextField(
              controller: controller.meetingLocationController,
              decoration: const InputDecoration(labelText: "Meeting Location"),
            ),
            const SizedBox(height: 16),

            // Meeting Description
            TextField(
              controller: controller.meetingDescriptionController,
              decoration: const InputDecoration(
                labelText: "Meeting Description",
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),

            // Meeting Host
            TextField(
              controller: controller.meetingHostController,
              decoration: const InputDecoration(labelText: "Meeting Host"),
            ),
            // const SizedBox(height: 16),

            // Obx(() => Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: controller.attendeesList
            //           .map((attendee) => ListTile(
            //                 leading: const Icon(Icons.person),
            //                 title: Text(attendee),
            //                 trailing: IconButton(
            //                   icon: const Icon(Icons.remove_circle),
            //                   onPressed: () {
            //                     controller.attendeesList.remove(attendee);
            //                   },
            //                 ),
            //               ))
            //           .toList(),
            //     )),
            const SizedBox(height: 24),

            // Create Meeting Button
            Center(
              child: ElevatedButton(
                onPressed: controller.createMeeting,
                child: const Text("Create Meeting"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
