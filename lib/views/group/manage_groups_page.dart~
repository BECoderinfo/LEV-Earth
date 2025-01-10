import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lvb_earth_admin/controllers/group/manage_group_controller.dart';
import 'package:lvb_earth_admin/routes/app_routes.dart';
import 'package:lvb_earth_admin/views/group/add_group_page.dart';

class ManageGroupsPage extends StatelessWidget {
  const ManageGroupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ManageGroupsController controller = Get.put(ManageGroupsController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Groups'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          if (controller.groups.isEmpty) {
            return const Center(
              child: Text(
                'No groups available.',
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          return ListView.builder(
            itemCount: controller.groups.length,
            itemBuilder: (context, index) {
              final group = controller.groups[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 10),
                elevation: 5,
                child: ListTile(
                  title: Text(group.groupName),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Leader: ${group.leader}'),
                      Text('Members: ${group.members.length}'),
                    ],
                  ),
                  trailing: PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'edit') {
                        controller.editGroup(group);
                      } else if (value == 'delete') {
                        controller.deleteGroup(index);
                      }
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'edit',
                        child: Text('Edit'),
                      ),
                      const PopupMenuItem(
                        value: 'delete',
                        child: Text('Delete'),
                      ),
                    ],
                  ),
                  onTap: () {
                    // Navigate to detailed group view if needed
                    Get.toNamed(AppRoutes.groupDetails);
                  },
                ),
              );
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const AddGroupPage());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
