import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lvb_earth_admin/model/group.dart';

class HomeController extends GetxController {
  // User details
  var userName = 'John Doe'.obs;
  var userEmail = 'johndoe@example.com'.obs;

  CarouselSliderController? carouselController = CarouselSliderController();
  RxInt currentIndex = 0.obs;

  // List of groups the user is part of
  var groups = <Group>[
    Group(
      groupName: 'Team Alpha',
      leader: 'Alice',
      members: ['Alice', 'John Doe', 'Sarah'],
    ),
    Group(
      groupName: 'Team Beta',
      leader: 'Bob',
      members: ['Bob', 'John Doe', 'Mike'],
    ),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    // You can load groups dynamically from an API or a database if needed
  }
}
