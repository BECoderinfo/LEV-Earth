import 'package:lvb_earth_admin/controllers/user_side/meeting/meeting_list_controller.dart';
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
    );
  }
}
