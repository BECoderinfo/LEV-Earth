import 'package:lvb_earth_admin/routes/app_routes.dart';
import 'package:lvb_earth_admin/imports/imports.dart';

class GroupDetailsPage extends StatelessWidget {
  const GroupDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GroupDetailsController controller = Get.put(GroupDetailsController());
    final Group group = Get.arguments ??
        Group(
          groupName: 'Test Group',
          leader: 'Me',
          members: ['Me', 'You', 'Them'],
        );
    return Scaffold(
      appBar: AppBar(
        title: Text(group.groupName),
        // centerTitle: true,
        actions: [
          Obx(
            () => (controller.isRemoving.value)
                ? IconButton(
                    onPressed: () {
                      controller.isRemoving.value = false;
                    },
                    icon: const Icon(Icons.check))
                : (AppVariables.box.read(StorageKeys.role) != 'user')
                    ? PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'Add Member') {
                            // create a BottomSheet to add a member
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              // To make the BottomSheet height dynamic
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20.0),
                                ),
                              ),
                              builder: (context) {
                                final TextEditingController nameController =
                                    TextEditingController();
                                return Padding(
                                  padding: EdgeInsets.only(
                                    left: 16.0,
                                    right: 16.0,
                                    top: 16.0,
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom, // Handle keyboard overlap
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Add Member',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall,
                                      ),
                                      const SizedBox(height: 10),
                                      TextField(
                                        controller: nameController,
                                        decoration: InputDecoration(
                                          labelText: 'Member Name',
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text('Cancel'),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              final newMember =
                                                  nameController.text.trim();
                                              if (newMember.isNotEmpty) {
                                                controller.addMember(
                                                    newMember); // Call your controller's method to add a member
                                                Navigator.pop(context);
                                              } else {
                                                Get.snackbar(
                                                  'Error',
                                                  'Member name cannot be empty.',
                                                  snackPosition:
                                                      SnackPosition.BOTTOM,
                                                );
                                              }
                                            },
                                            child: Text('Add'),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          } else if (value == 'Remove Member') {
                            controller.isRemoving.value = true;
                          } else if (value == 'Logout') {
                            controller.logout();
                          }
                        },
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'Add Member',
                            child: Text('Add Member'),
                          ),
                          const PopupMenuItem(
                            value: 'Remove Member',
                            child: Text('Remove Member'),
                          ),
                          if (AppVariables.box.read(StorageKeys.role) ==
                              'leader')
                            const PopupMenuItem(
                              value: 'Logout',
                              child: Text('Logout'),
                            ),
                        ],
                      )
                    : IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.exit_to_app),
                      ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            CarouselSlider(
              carouselController: controller.carouselController,
              items: [
                Container(
                  decoration: BoxDecoration(
                    // color: Colors.green,
                    gradient: LinearGradient(
                      colors: [AppColors.primaryColor, AppColors.surfaceColor],
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Center(
                    child: Text(
                      'Slide 1',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    // color: Colors.green,
                    gradient: LinearGradient(
                      colors: [AppColors.primaryColor, AppColors.surfaceColor],
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Center(
                    child: Text(
                      'Slide 2',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    // color: Colors.green,
                    gradient: LinearGradient(
                      colors: [AppColors.primaryColor, AppColors.surfaceColor],
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Center(
                    child: Text(
                      'Slide 3',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
              options: CarouselOptions(
                viewportFraction: 1,
                enlargeCenterPage: true,
                autoPlay: false,
                height: 120,
                onPageChanged: (index, reason) {
                  controller.currentIndex.value = index;
                },
              ),
            ),
            SizedBox(height: 5),
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(),
                child: Row(
                  children: [1, 2, 3].map((element) {
                    int index = [1, 2, 3].indexOf(element);
                    return CustomIndicator(
                      currentIndex: controller.currentIndex.value,
                      index: index,
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Group Leader
            Text(
              'Leader: ${group.leader}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),

            // Group Members
            Text(
              'Members: ${group.members.join(', ')}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),

            const SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: group.members.length,
              itemBuilder: (context, index) {
                final stat = group.members[index];
                return GestureDetector(
                  onTap: () {},
                  child: Card.outlined(
                    elevation: 5,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(),
                              Text(
                                stat,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                '100',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Obx(
                          () => (controller.isRemoving.value)
                              ? Positioned(
                                  top: 0,
                                  right: 0,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.delete,
                                      color: AppColors.errorColor,
                                    ),
                                  ),
                                )
                              : Container(),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
