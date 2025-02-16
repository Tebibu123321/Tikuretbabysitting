import 'package:flutter/material.dart';

class MyFavorites extends StatelessWidget {
  const MyFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> favoriteSitters = [
      {"name": "Weyeneshet Worqu", "rating": "4.8/500 reviews", "location": "22 Golagul", "image": "img/istockphoto-478803372-612x612.jpg"},
      {"name": "Lidya Roman", "rating": "4.8/500 reviews", "location": "22 Golagul", "image": "img/SAKARA.jpg"},
      {"name": "Solome Addis", "rating": "4.8/500 reviews", "location": "22 Golagul", "image": "img/1000_F_72306359_lEjz2CAqkZQVGbZSjSG5mmKDeTbEqRER.jpg"},
      {"name": "Bamlack Feseha", "rating": "4.8/500 reviews", "location": "22 Golagul", "image": "img/1000_F_413554591_BQzOaigFwRTgpoXU8WLY6hhQZYzijQek.jpg"},
      {"name": "Bamlack Feseha", "rating": "4.8/500 reviews", "location": "22 Golagul", "image": "img/1000_F_72306359_lEjz2CAqkZQVGbZSjSG5mmKDeTbEqRER.jpg"},
      {"name": "Bamlack Feseha", "rating": "4.8/500 reviews", "location": "22 Golagul", "image": "img/SAKARA.jpg"},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8E8F3), // Light pink background
      appBar: AppBar(
        title: const Text(
          "My Favorites",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: favoriteSitters.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(favoriteSitters[index]["image"]),
                  radius: 30,
                ),
                title: Text(
                  favoriteSitters[index]["name"],
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(favoriteSitters[index]["rating"], style: const TextStyle(fontSize: 12)),
                    Row(
                      children: [
                        const Icon(Icons.location_on, size: 14, color: Colors.blue),
                        const SizedBox(width: 4),
                        Text(favoriteSitters[index]["location"], style: const TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
                trailing: const Icon(Icons.favorite, color: Colors.red, size: 28),
              ),
            );
          },
        ),
      ),
    );
  }
}
