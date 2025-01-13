import 'package:lvb_earth_admin/imports/imports.dart';

class MemberDetailsController extends GetxController {
  final Member member;

  MemberDetailsController(this.member);

  // Dummy list of unpaid fees
  final fees = <Fee>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Fetch fees for the member
    fetchFees();
  }

  void fetchFees() {
    // Mock data to simulate fetching fees (Replace this with an API call)
    fees.value = [
      Fee(
        meetingName: "Monthly Subscription",
        amount: 50.0,
        status: "Pending",
        date: "2025-01-10",
        description: "Subscription for January",
      ),
      Fee(
        meetingName: "Annual Membership",
        amount: 500.0,
        status: "Paid",
        date: "2024-12-01",
        description: "One-year membership fee",
      ),
    ];
  }

  void updateFeeStatus(Fee fee, String newStatus) {
    // Update the fee status (Replace this with an API call)
    fee.status = newStatus;
    fees.refresh();
    print("Updated fee status for '${fee.meetingName}' to '$newStatus'.");
  }

  void editMemberDetails() {
    print("Editing details for ${member.name}");
  }

  void removeMember() {
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

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        name: json['name'],
        email: json['email'],
        profileImage: json['profileImage'],
        points: json['points'],
        groupName: json['groupName'],
        groupLeader: json['groupLeader'],
        groupMembersCount: json['groupMembersCount'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'profileImage': profileImage,
        'points': points,
        'groupName': groupName,
        'groupLeader': groupLeader,
        'groupMembersCount': groupMembersCount,
      };
}

// class Fee {
//   final int id;
//   final String description;
//   final int amount;
//   bool isPaid;
//
//   Fee({
//     required this.id,
//     required this.description,
//     required this.amount,
//     this.isPaid = false,
//   });
// }
