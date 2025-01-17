import 'package:lvb_earth_admin/imports/imports.dart';

class AddGroupPage extends StatelessWidget {
  const AddGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AddGroupController controller = Get.put(AddGroupController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Group'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Group Name Input
            TextField(
              onChanged: (value) => controller.groupName.value = value,
              decoration: const InputDecoration(
                labelText: 'Group Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),

            // Leader Name Input
            TextField(
              onChanged: (value) => controller.leaderName.value = value,
              decoration: const InputDecoration(
                labelText: 'Leader Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),

            // Add Member Input
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                      labelText: 'Add Member',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (value) {
                      controller.addMember(value);
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    // Trigger member addition manually (for button action)
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Members List
            Obx(() => Expanded(
                  child: ListView.builder(
                    itemCount: controller.members.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(controller.members[index]),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove_circle),
                          onPressed: () {
                            controller.removeMember(index);
                          },
                        ),
                      );
                    },
                  ),
                )),

            // Submit Button
            Center(
              child: ElevatedButton(
                onPressed: controller.submitGroup,
                child: const Text('Create Group'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
