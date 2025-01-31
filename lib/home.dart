import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8E8F3), // Light pink background
      bottomNavigationBar: _buildBottomNavigationBar(),
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
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image.asset(
            'img/newborn.jpg', 
            fit: BoxFit.cover,
            width: double.infinity,
            height: 280,
          ),
          Container(
            width: double.infinity,
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
                const Text(
                  "Responsible",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Babysitters ensure children's safety and well-being. This includes supervision, meal prep, and a clean environment.",
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
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
          // Profile Picture
          CircleAvatar(
            backgroundImage: AssetImage(sitter["image"]),
            radius: 30,
          ),
          const SizedBox(width: 12),

          // Babysitter Details
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

          // View Profile Button
          ElevatedButton(
            onPressed: () {
              // Add navigation logic if needed
            },
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
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.pink,
      unselectedItemColor: Colors.black54,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "BookSitter"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notification"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}