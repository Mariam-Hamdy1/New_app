import 'package:flutter/material.dart';

void main() => runApp(FurnitureApp());

class FurnitureApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final Color primaryColor = Color(0xFFFFD54F); // yellow background

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                    radius: 24,
                  ),
                  Icon(Icons.menu, color: Colors.white),
                ],
              ),
            ),

            // Greeting
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello , Mariam",
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text("What do you want to buy?",
                      style: TextStyle(fontSize: 18)),
                  SizedBox(height: 16),
                ],
              ),
            ),

            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.yellow[800]),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Categories
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CategoryIcon(icon: Icons.weekend, label: "Sofas"),
                  CategoryIcon(icon: Icons.inventory_2, label: "Wardrobe"),
                  CategoryIcon(icon: Icons.desktop_windows, label: "Desk"),
                  CategoryIcon(icon: Icons.chair_alt, label: "Dresser"),
                ],
              ),
            ),

            // Products
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    ProductCard(
                      name: "FinnNavian",
                      description:
                      "Scandinavian small sized double sofa imported full leather / Dale Italia oil wax leather black",
                      price: 248,
                      imagePath: "assets/images/sofa.png",
                      isFavorited: true,
                    ),
                    SizedBox(height: 16),
                    ProductCard(
                      name: "FinnNavian",
                      description: "Scandinavian small sized...",
                      price: 199,
                      imagePath: "assets/images/chair.png",
                      isFavorited: false,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.yellow[800],
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.chair), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.access_time), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }
}

class CategoryIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 30),
        SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String description;
  final double price;
  final String imagePath;
  final bool isFavorited;

  const ProductCard({
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
    this.isFavorited = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset(imagePath, width: 100, height: 100, fit: BoxFit.cover),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                SizedBox(height: 6),
                Text(description,
                    maxLines: 2, overflow: TextOverflow.ellipsis),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$$price",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange)),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow[700]),
                      onPressed: () {},
                      child: Text("Add to cart",
                          style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 8),
          Icon(isFavorited ? Icons.favorite : Icons.favorite_border,
              color: Colors.red),
        ],
      ),
    );
  }
}
