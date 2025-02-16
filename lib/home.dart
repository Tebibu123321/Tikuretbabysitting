import 'package:flutter/material.dart'; 
import 'parent_profile_page.dart';
import 'favorite.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8E8F3), // Light pink background
      bottomNavigationBar: _buildBottomNavigationBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildSearchBar(),
            _buildSitterList(),
          ],
        ),
      ),
    );
  }

  // Header section with baby image and text
  Widget _buildHeader() {
    List<Map<String, String>> articles = [
      {
        "title": "Responsible",
        "description": "Babysitters ensure children's safety and well-being. This includes supervision, meal prep, and a clean environment.",
        "image": "img/newborn.jpg"
      },
      {
        "title": "Caring",
        "description": "A good babysitter is compassionate, ensuring emotional support and happiness for children.",
        "image": "img/la maison.jpg"
      },
      {
        "title": "Patient",
        "description": "Patience is key when dealing with children, helping them learn and grow in a stress-free environment.",
        "image": "img/school.jpg"
      }
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 220,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                left: index == 0 ? 16.0 : 8.0, 
                right: index == articles.length - 1 ? 16.0 : 8.0
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Image.asset(
                      articles[index]["image"]!,
                      fit: BoxFit.cover,
                      width: 320,
                      height: 220,
                    ),
                    Container(
                      width: 320,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.7),
                            Colors.black.withOpacity(0.3),
                            Colors.transparent,
                          ],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            articles[index]["title"]!,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            articles[index]["description"]!,
                            style: const TextStyle(fontSize: 14, color: Colors.white70),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () { 
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text("Babysitter Responsibilities"),
                                    content: const Text(
                                      "Babysitters are responsible for ensuring the safety and well-being of children under their care. "
                                      "This includes supervising them at all times, preparing and serving meals or snacks, and maintaining a clean and safe environment. "
                                      "They also engage children in fun and educational activities, provide emotional support, and follow parents’ instructions carefully."
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text("Close"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink.shade300,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text("Read article"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Search bar widget
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: const Icon(Icons.search, color: Colors.pink),
          hintText: "Search favorite sitter...",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  // Babysitter list
  Widget _buildSitterList() {
    List<Map<String, dynamic>> sitters = [
      {"name": "Sarah", "rating": 4.8, "image": "img/istockphoto-478803372-612x612.jpg"},
      {"name": "Sophia", "rating": 4.7, "image": "img/SAKARA.jpg"},
      {"name": "Lina", "rating": 4.9, "image": "img/1000_F_413554591_BQzOaigFwRTgpoXU8WLY6hhQZYzijQek.jpg"},
      {"name": "Mia", "rating": 4.6, "image": "img/1000_F_72306359_lEjz2CAqkZQVGbZSjSG5mmKDeTbEqRER.jpg"},
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: sitters.map((sitter) => _buildSitterCard(sitter)).toList(),
      ),
    );
  }

  // Sitter profile card
  Widget _buildSitterCard(Map<String, dynamic> sitter) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(sitter["image"]),
              radius: 30,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sitter["name"],
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const Text(
                    "Experienced babysitter available.",
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "⭐ ${sitter["rating"]}   •   230 birr/hr",
                    style: const TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink.shade300,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text("View Profile"),
            ),
          ],
        ),
      ),
    );
  }

  // Bottom Navigation Bar
  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.pink,
      unselectedItemColor: Colors.black54,
      currentIndex: 0,
      onTap: (index) {

        if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyFavorites()),
          );
        }
        if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ParentProfilePage()),
          );
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "BookSitter"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notification"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}
