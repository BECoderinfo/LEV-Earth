import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class GroupDetailsController extends GetxController {
  CarouselSliderController? carouselController = CarouselSliderController();
  RxInt currentIndex = 0.obs;

  RxBool isRemoving = false.obs;
}
