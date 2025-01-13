import 'package:lvb_earth_admin/imports/imports.dart';

class FeesPage extends StatelessWidget {
  const FeesPage({super.key});

  @override
  Widget build(BuildContext context) {
    FeesController controller = Get.put(FeesController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meeting Fees'),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.feesList.isEmpty) {
            return const Center(
              child: Text(
                'No fees available.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          final unpaidFees =
              controller.feesList.where((fee) => fee.status != 'Paid').toList();
          final paidFees =
              controller.feesList.where((fee) => fee.status == 'Paid').toList();

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                // Unpaid Fees Section
                if (unpaidFees.isNotEmpty) ...[
                  Text(
                    'Unpaid Fees',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  ...unpaidFees
                      .map((fee) => buildFeeCard(context, fee))
                      .toList(),
                  const Divider(thickness: 2),
                ],

                // Paid Fees Section
                if (paidFees.isNotEmpty) ...[
                  Text(
                    'Paid Fees',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  ...paidFees.map((fee) => buildFeeCard(context, fee)).toList(),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}

Widget buildFeeCard(BuildContext context, Fee fee) {
  return Card(
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    margin: const EdgeInsets.symmetric(vertical: 8),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Meeting Name
          Text(
            fee.meetingName,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),

          // Fee Details
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Amount: \$${fee.amount.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 16),
              ),
              Chip(
                label: Text(
                  fee.status,
                  style: TextStyle(
                    color: fee.status == 'Paid' ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: fee.status == 'Paid'
                    ? Colors.green.shade100
                    : Colors.red.shade100,
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Date and Description
          Text(
            'Date: ${fee.date}',
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 4),
          Text(
            fee.description,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    ),
  );
}
