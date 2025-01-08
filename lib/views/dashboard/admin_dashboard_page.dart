import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lvb_earth_admin/controllers/dashboard/admin_controller.dart';
import 'package:lvb_earth_admin/routes/app_routes.dart';
import 'package:lvb_earth_admin/utils/app_colors.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController =
        Get.put(DashboardController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        // centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              dashboardController.logout();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Statistics Section
              const Text(
                'Statistics',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: dashboardController.stats.length,
                itemBuilder: (context, index) {
                  var stat = dashboardController.stats[index];
                  return GestureDetector(
                    onTap: () {
                      print('Navigating to ${stat['page']}');
                      Get.toNamed('${stat['page']}');
                    },
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              stat['title'].toString(),
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${stat['value']}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),

              // add Group
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.addGroup);
                },
                child: Container(
                  height: 130,
                  width: 200,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Add Group',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
