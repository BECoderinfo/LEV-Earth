import 'package:lvb_earth_admin/imports/imports.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('LVB Earth'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              homeController.logout();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Slider at the top
            CarouselSlider(
              carouselController: homeController.carouselController,
              items: [
                Container(
                  decoration: BoxDecoration(
                    // color: Colors.green,
                    gradient: LinearGradient(
                      colors: [AppColors.primaryColor, AppColors.surfaceColor],
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Center(
                    child: Text(
                      'Slide 1',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    // color: Colors.green,
                    gradient: LinearGradient(
                      colors: [AppColors.primaryColor, AppColors.surfaceColor],
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Center(
                    child: Text(
                      'Slide 2',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    // color: Colors.green,
                    gradient: LinearGradient(
                      colors: [AppColors.primaryColor, AppColors.surfaceColor],
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Center(
                    child: Text(
                      'Slide 3',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
              options: CarouselOptions(
                viewportFraction: 1,
                enlargeCenterPage: true,
                autoPlay: false,
                height: 120,
                onPageChanged: (index, reason) {
                  homeController.currentIndex.value = index;
                },
              ),
            ),
            SizedBox(height: 5),
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(),
                child: Row(
                  children: [1, 2, 3].map((element) {
                    int index = [1, 2, 3].indexOf(element);
                    return CustomIndicator(
                      currentIndex: homeController.currentIndex.value,
                      index: index,
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // User business details
            const Text(
              'Business Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Business Name: Demo Business',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              spacing: 10.0,
              children: [
                Expanded(
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Total Members',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '10',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(
                        AppRoutes.groupDetails,
                        arguments: Group(
                          groupName: "Group 1",
                          leader: "John Doe",
                          members: ["John Doe", "Jane Doe", "Joh Doe"],
                        ),
                      );
                    },
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Name',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            Text(
                              '3',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // ListView to display members
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Member ${index + 1}'),
                    onTap: () {
                      Get.toNamed(
                        AppRoutes.userDetails,
                        arguments: Member(
                            name: "Josefa Steuber Sr.",
                            email: "Willis.Sauer@hotmail.com",
                            profileImage:
                                "https://neural.love/cdn/thumbnails/1eed0c19-a24d-63c2-930d-7d3a05af8b96/4cd987cb-fb79-5055-be45-b8542dd47073.webp?Expires=1798761599&Signature=6R~ioRVogC8rd-rF7MXety7bz4oxzIkxppHpj6Uz2X34T0gXwycbEeCkS5t13w2KRF4o9BuNPsDdaiqw4Er7Np5HesFdlKeGWjOcCV58rFFhUF53iqAllAqtHW2jPC0Ku4-nswf09BH3nsE4Gg7p8tv9IvOULRGm8HAVTzGzAG55mDxOEhg4d5s~Ub7Mh49QU5Xcl0BYl7Mbbc~v0kVs~vI5yDNKiyBqiR7cIpHSRnbdWZV3m6rDfwb~yD2k3PsB8RLtQxWbMWI0oTt-3R7Af3igTTvlzSTsv4MPC6N3a6EgIpKAbLe~Hp3Bu4kimEU-FHaT6-tsUK4l0bprpnNRBg__&Key-Pair-Id=K2RFTOXRBNSROX",
                            points: 1000,
                            groupName: "Helene Hackett",
                            groupLeader: "Edwin Beahan DDS",
                            groupMembersCount: 6),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomIndicator extends StatelessWidget {
  final int currentIndex;
  final int index;

  const CustomIndicator(
      {super.key, required this.currentIndex, required this.index});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: currentIndex == index ? 80 : 30,
      height: 5,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: currentIndex == index ? AppColors.secondaryColor : Colors.grey,
      ),
    );
  }
}
