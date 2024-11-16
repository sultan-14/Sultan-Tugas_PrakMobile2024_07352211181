import 'package:flutter/material.dart';

void main() {
  runApp(const ECommerceApp());
}

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: const Text("E-Commerce"),
        centerTitle: true,
        actions: const [
          Icon(Icons.notifications, size: 24),
          SizedBox(width: 16),
          Icon(Icons.shopping_cart, size: 24),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchBar(),
            const DealSection(),
            SectionTitle(title: "Top Rated Freelancers", onViewAll: () {}),
            FreelancerList(),
            SectionTitle(title: "Top Services", onViewAll: () {}),
            const ServiceList(),
            // Tambahkan komponen BestBookingSection di sini
            SectionTitle(title: "Best Booking", onViewAll: () {}),
            const BestBooking(),
            const BestBooking2(),
            SectionTitle(title: "Recommended Workshops", onViewAll: () {}),
            RecommendedWorkshopsPage(),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search here",
                prefixIcon:
                    const Icon(Icons.search, size: 20, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 40, // Adjust width as needed
            height: 40, // Adjust height as needed
            decoration: BoxDecoration(
              color: Colors.white, // Change color as needed
              borderRadius: BorderRadius.circular(
                  8), // Adjust border radius for rounded corners
              border: Border.all(
                  color: Colors.black, width: 1), // Black border with width 2
            ),
          ),
        ],
      ),
    );
  }
}

class DealSection extends StatelessWidget {
  const DealSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        gradient: const LinearGradient(
          colors: [Color(0xFFE0EAFC), Color(0xFFCFDEF3)],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hanya Hari Ini",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "50% OFF",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Dapatkan diskon spesial sebesar 50% dengan cara belanja sekarang.",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: const Text("BUY IT NOW",
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "assets/images/model1.png",
              width: 100,
              height: 200,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback onViewAll;

  const SectionTitle({super.key, required this.title, required this.onViewAll});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        TextButton(
          onPressed: onViewAll,
          child: const Text(
            "View All",
            style: TextStyle(color: Color.fromARGB(255, 64, 131, 186)),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class FreelancerCard extends StatelessWidget {
  final String name;
  final String profession;
  final double rating;
  final String assetImage;

  const FreelancerCard({
    super.key,
    required this.name,
    required this.profession,
    required this.rating,
    required this.assetImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(assetImage),
            radius: 30,
          ),
          const SizedBox(height: 5),
          Text(name,
              style:
                  const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
          Text(profession,
              style: const TextStyle(fontSize: 10, color: Colors.grey)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star,
                  color: Color.fromARGB(255, 143, 7, 255), size: 16),
              Text(rating.toString(), style: const TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}

class FreelancerList extends StatelessWidget {
  final List<Map<String, dynamic>> freelancers = [
    {
      "name": "Billie Elish",
      "profession": "Beautician",
      "rating": 4.9,
      "image": "assets/images/billi.jpeg"
    },
    {
      "name": "Billie Elish",
      "profession": "Beautician",
      "rating": 4.9,
      "image": "assets/images/billi.jpeg"
    },
    {
      "name": "Billie Elish",
      "profession": "Beautician",
      "rating": 4.9,
      "image": "assets/images/billi.jpeg"
    },
    {
      "name": "Billie Elish",
      "profession": "Beautician",
      "rating": 4.9,
      "image": "assets/images/billi.jpeg"
    },
  ];

  FreelancerList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: freelancers.length,
        itemBuilder: (context, index) {
          final freelancer = freelancers[index];
          return FreelancerCard(
            name: freelancer["name"],
            profession: freelancer["profession"],
            rating: freelancer["rating"],
            assetImage: freelancer["image"],
          );
        },
      ),
    );
  }
}

// top service class
class ServiceList extends StatelessWidget {
  const ServiceList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        ServiceCard(
          imageUrl: 'assets/images/billi.jpeg',
          name: 'Miss Zachary Will',
          role: 'Beautician',
          description: 'Doloribus saepe aut necessitatibus qui.',
          rating: 4.9,
        ),
        ServiceCard(
          imageUrl: 'assets/images/billi.jpeg',
          name: 'Miss Zachary Will',
          role: 'Beautician',
          description: 'Doloribus saepe aut necessitatibus qui.',
          rating: 4.9,
        ),
        ServiceCard(
          imageUrl: 'assets/images/billi.jpeg',
          name: 'Miss Zachary Will',
          role: 'Beautician',
          description: 'Doloribus saepe aut necessitatibus qui.',
          rating: 4.9,
        ),
      ],
    );
  }
}

// class servicecard
class ServiceCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String role;
  final String description;
  final double rating;

  const ServiceCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.role,
    required this.description,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Layer bawah: gambar besar
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              imageUrl,
              width: 220,
              height: 220,
              fit: BoxFit.fill,
            ),
          ),
          // Layer atas: card informasi
          Positioned(
            left: 90,
            bottom: 25, // untuk membuat card informasi terlihat menumpuk
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(color: Colors.black26, blurRadius: 4)
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(imageUrl),
                    radius: 20,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          role,
                          style: const TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star,
                                color: Color.fromARGB(255, 111, 106, 244),
                                size: 20),
                            const SizedBox(width: 4),
                            Text(
                              rating.toString(),
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 119, 132, 232),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Book Now",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//best booking class
class BestBooking extends StatelessWidget {
  const BestBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        gradient: const LinearGradient(
          colors: [Color(0xFFE0EAFC), Color(0xFFCFDEF3)],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Deall Of The Day",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Flat 60% OFF",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Dapatkan diskon spesial sebesar 60% dengan cara belanja sekarang. ",
                  style: TextStyle(fontSize: 16),
                ),
                const Text(
                  "06 : 34 : 15",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: const Text("Shop Now",
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "assets/images/model1.png",
              width: 100,
              height: 200,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}

//bestbooking2
class BestBooking2 extends StatelessWidget {
  const BestBooking2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BestBookingCard(
          imageUrl: 'assets/images/Picture3.png',
          profileUrl: 'assets/images/rafi.jpeg',
          name: 'Miss Zachary Will',
          role: 'Beautician',
          description: 'Occaecati aut nam beatae quo non deserunt consequatur.',
          rating: 4.9,
        ),
        SizedBox(height: 16.0),
        BestBookingCard(
          imageUrl: 'assets/images/Picture3.png',
          profileUrl: 'assets/images/lufy.png',
          name: 'Miss Zachary Will',
          role: 'Beautician',
          description: 'Occaecati aut nam beatae quo non deserunt consequatur.',
          rating: 4.9,
        ),
      ],
    );
  }
}

class BestBookingCard extends StatelessWidget {
  final String imageUrl;
  final String profileUrl;
  final String name;
  final String role;
  final String description;
  final double rating;

  const BestBookingCard({
    super.key,
    required this.imageUrl,
    required this.profileUrl,
    required this.name,
    required this.role,
    required this.description,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(profileUrl),
                  radius: 24,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        role,
                        style: TextStyle(
                          fontSize: 14,
                          color: const Color.fromARGB(255, 57, 106, 220),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.purple[50],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.star,
                          color: const Color.fromARGB(255, 56, 104, 216),
                          size: 16),
                      SizedBox(width: 4),
                      Text(
                        rating.toString(),
                        style: TextStyle(
                          color: const Color.fromARGB(255, 91, 77, 250),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class Recomended Workshop
class RecommendedWorkshopsPage extends StatelessWidget {
  const RecommendedWorkshopsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.5,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return buildWorkshopCard(context);
              },
            ),
          ],
        ),
      ],
    );
    // );
  }

  /// Fungsi untuk membuat kartu workshop
  Widget buildWorkshopCard(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.asset(
                    'assets/images/Picture3.png', // Ganti dengan path gambar Anda
                    height: 230,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star,
                            color: const Color.fromARGB(255, 75, 88, 232),
                            size: 16),
                        SizedBox(width: 4),
                        Text(
                          "4.9",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Miss Zachary Will",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Beautician",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 49, 111, 235),
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Occaecati aut nam beatae quo non deserunt consequat.",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 73, 81, 250),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Book Workshop",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
