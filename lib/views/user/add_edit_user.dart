import 'package:lvb_earth_admin/imports/imports.dart';

class EditUserPage extends StatelessWidget {
  final bool isEditing;
  final User? user;

  const EditUserPage({super.key, required this.isEditing, this.user});

  @override
  Widget build(BuildContext context) {
    final ManageUsersController controller = Get.find();
    final TextEditingController nameController =
        TextEditingController(text: isEditing ? user?.name : '');
    final TextEditingController emailController =
        TextEditingController(text: isEditing ? user?.email : '');
    final TextEditingController roleController =
        TextEditingController(text: isEditing ? user?.role : '');

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit User' : 'Add User'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Name Field
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Email Field
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Role Field
            TextField(
              controller: roleController,
              decoration: const InputDecoration(
                labelText: 'Role',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),

            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final updatedUser = User(
                    name: nameController.text,
                    email: emailController.text,
                    role: roleController.text,
                  );

                  if (isEditing) {
                    // Update user details
                    final index = controller.users.indexOf(user!);
                    if (index != -1) {
                      controller.users[index] = updatedUser;
                      controller.users.refresh();
                    }
                  } else {
                    // Add new user
                    controller.users.add(updatedUser);
                  }

                  Get.back();
                  Get.snackbar(
                    isEditing ? 'User Updated' : 'User Added',
                    '${updatedUser.name} has been successfully ${isEditing ? 'updated' : 'added'}.',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
