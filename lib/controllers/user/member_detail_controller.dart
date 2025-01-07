import 'package:get/get.dart';

class MemberDetailsController extends GetxController {
  // Member object containing details
  final Member member;

  MemberDetailsController(this.member);

  // Method to edit member details
  void editMemberDetails() {
    // Logic to edit member details
    print("Editing details for ${member.name}");
  }

  // Method to remove member
  void removeMember() {
    // Logic to remove member
    print("Removing member ${member.name}");
  }
}

class Member {
  final String name;
  final String email;
  final String profileImage;
  final int points;
  final String groupName;
  final String groupLeader;
  final int groupMembersCount;

  Member({
    required this.name,
    required this.email,
    required this.profileImage,
    required this.points,
    required this.groupName,
    required this.groupLeader,
    required this.groupMembersCount,
  });

  // Factory method to create a Member instance from a map (useful for API responses)
  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      name: json['name'],
      email: json['email'],
      profileImage: json['profileImage'],
      points: json['points'],
      groupName: json['groupName'],
      groupLeader: json['groupLeader'],
      groupMembersCount: json['groupMembersCount'],
    );
  }

  // Method to convert a Member instance to a map (useful for API requests)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'profileImage': profileImage,
      'points': points,
      'groupName': groupName,
      'groupLeader': groupLeader,
      'groupMembersCount': groupMembersCount,
    };
  }
}
