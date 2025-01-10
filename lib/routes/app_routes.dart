import 'package:lvb_earth_admin/imports/imports.dart';

class AppRoutes {
  static const splash = '/splash';
  static const login = '/login';
  static const dashboard = '/dashboard';
  static const addGroup = '/add-group';
  static const manageGroup = '/manage-group';
  static const editGroup = '/edit-group';
  static const addUser = '/add-user';
  static const manageUser = '/manage-user';
  static const editUser = '/edit-user';
  static const userHome = '/user-home';
  static const userDetails = '/user-details';
  static const groupDetails = '/group-details';
  static const meetingList = '/meeting-list';

  static List<GetPage<dynamic>> routes = [
    GetPage(name: splash, page: () => SplashPage()),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: dashboard, page: () => AdminDashboardPage()),
    GetPage(name: addGroup, page: () => AddGroupPage()),
    GetPage(name: manageGroup, page: () => ManageGroupsPage()),
    // GetPage(name: editGroup, page: () => AddGroupPage()),
    GetPage(name: addUser, page: () => EditUserPage(isEditing: false)),
    GetPage(name: manageUser, page: () => ManageUsersPage()),
    GetPage(name: userHome, page: () => HomePage()),
    GetPage(name: userDetails, page: () => MemberDetailsPage()),
    GetPage(name: groupDetails, page: () => GroupDetailsPage()),
    GetPage(name: meetingList, page: () => MeetingList()),
    // GetPage(name: editUser, page: () => AddGroupPage()),
  ];
}
