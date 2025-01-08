import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:lvb_earth_admin/routes/app_routes.dart';

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
