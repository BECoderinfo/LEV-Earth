import 'package:lvb_earth_admin/imports/imports.dart';

class MemberDetailsPage extends StatelessWidget {
  const MemberDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final member = Get.arguments;
    final MemberDetailsController controller =
        Get.put(MemberDetailsController(member));

    final isAdmin = AppVariables.box.read(StorageKeys.role) == 'admin';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Member Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(controller.member.profileImage),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  controller.member.name,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  controller.member.email,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const SizedBox(height: 20),
              if (isAdmin) ...[
                const Text(
                  'Fee Details',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.fees.length,
                    itemBuilder: (context, index) {
                      final fee = controller.fees[index];
                      return Card(
                        child: ListTile(
                          title: Text(fee.meetingName),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Amount: \$${fee.amount.toStringAsFixed(2)}'),
                              Text('Date: ${fee.date}'),
                              Text('Description: ${fee.description}'),
                              Text('Status: ${fee.status}'),
                            ],
                          ),
                          trailing: fee.status == "Pending"
                              ? ElevatedButton(
                                  onPressed: () => controller.updateFeeStatus(
                                    fee,
                                    "Paid",
                                  ),
                                  child: const Text('Mark as Paid'),
                                )
                              : const Icon(Icons.check, color: Colors.green),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
