import 'package:lvb_earth_admin/imports/imports.dart';

class FeesController extends GetxController {
  var feesList = <Fee>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchFees();
  }

  void fetchFees() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2)); // Simulated API call
    feesList.value = [
      Fee(
        meetingName: 'Annual General Meeting',
        amount: 120.0,
        status: 'Paid',
        date: '2025-01-05',
        description: 'Fees for attending the annual general meeting.',
      ),
      Fee(
        meetingName: 'Monthly Strategy Meeting',
        amount: 80.0,
        status: 'Unpaid',
        date: '2025-01-10',
        description: 'Fees for the monthly strategy session.',
      ),
      Fee(
        meetingName: 'Team-Building Workshop',
        amount: 100.0,
        status: 'Paid',
        date: '2025-01-15',
        description: 'Workshop participation fee.',
      ),
    ];
    isLoading.value = false;
  }
}
