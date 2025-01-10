import 'package:lvb_earth_admin/imports/imports.dart';

class GroupDetailsController extends GetxController {
  CarouselSliderController? carouselController = CarouselSliderController();
  RxInt currentIndex = 0.obs;

  RxBool isRemoving = false.obs;

  void addMember(String memberName) {
    // Example: Update the group members list
    // group.members.add(memberName);
    update(); // Notify the UI of the change
  }

  void logout() {
    Get.offNamed(AppRoutes.login);
  }
}
