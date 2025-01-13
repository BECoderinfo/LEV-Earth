import 'package:lvb_earth_admin/imports/imports.dart';

class ManageUsersPage extends StatelessWidget {
  const ManageUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ManageUsersController controller = Get.put(ManageUsersController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Users'),
        centerTitle: true,
      ),
      body: Obx(
        () {
          return ListView.builder(
            itemCount: controller.users.length,
            itemBuilder: (context, index) {
              final user = controller.users[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Edit Button
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {
                          controller.editUser(user);
                        },
                      ),
                      // Delete Button
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          controller.deleteUser(user);
                        },
                      ),
                    ],
                  ),
                  onTap: () {
                    Get.toNamed(
                      AppRoutes.userDetails,
                      arguments: Member(
                          name: "Josefa Steuber Sr.",
                          email: "Willis.Sauer@hotmail.com",
                          profileImage:
                              "https://neural.love/cdn/thumbnails/1eed0c19-a24d-63c2-930d-7d3a05af8b96/4cd987cb-fb79-5055-be45-b8542dd47073.webp?Expires=1798761599&Signature=6R~ioRVogC8rd-rF7MXety7bz4oxzIkxppHpj6Uz2X34T0gXwycbEeCkS5t13w2KRF4o9BuNPsDdaiqw4Er7Np5HesFdlKeGWjOcCV58rFFhUF53iqAllAqtHW2jPC0Ku4-nswf09BH3nsE4Gg7p8tv9IvOULRGm8HAVTzGzAG55mDxOEhg4d5s~Ub7Mh49QU5Xcl0BYl7Mbbc~v0kVs~vI5yDNKiyBqiR7cIpHSRnbdWZV3m6rDfwb~yD2k3PsB8RLtQxWbMWI0oTt-3R7Af3igTTvlzSTsv4MPC6N3a6EgIpKAbLe~Hp3Bu4kimEU-FHaT6-tsUK4l0bprpnNRBg__&Key-Pair-Id=K2RFTOXRBNSROX",
                          points: 1000,
                          groupName: "Helene Hackett",
                          groupLeader: "Edwin Beahan DDS",
                          groupMembersCount: 6),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.addUser,
        child: const Icon(Icons.add),
      ),
    );
  }
}
