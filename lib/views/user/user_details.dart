import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lvb_earth_admin/controllers/user/member_detail_controller.dart';
import 'package:lvb_earth_admin/utils/app_colors.dart';

class MemberDetailsPage extends StatelessWidget {
  const MemberDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var member = Get.arguments;

    final MemberDetailsController controller =
        Get.put(MemberDetailsController(member));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Member Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(controller.member.profileImage),
              ),
            ),
            const SizedBox(height: 20),

            // Member Name
            Center(
              child: Text(
                controller.member.name,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 10),

            // Member Email
            Center(
              child: Text(
                controller.member.email,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 20),

            // Points
            Card(
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Points:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${controller.member.points}',
                      style: const TextStyle(
                        fontSize: 18,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Group Details
            const Text(
              'Group Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 4.0,
              child: ListTile(
                title: Text(controller.member.groupName),
                subtitle: Text('Leader: ${controller.member.groupLeader}'),
                trailing:
                    Text('${controller.member.groupMembersCount} Members'),
              ),
            ),
            const SizedBox(height: 20),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    controller.editMemberDetails();
                  },
                  child: const Text('Edit Details'),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.removeMember();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text('Remove Member'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
