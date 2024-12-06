import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final List<Map<String, dynamic>> products;

  const SearchPage({Key? key, required this.products}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Map<String, dynamic>> searchResults = [];
  String query = "";

  void _searchProducts(String searchQuery) {
    setState(() {
      query = searchQuery;
      if (searchQuery.isNotEmpty) {
        searchResults = widget.products
            .where((product) => product["title"]
            .toString()
            .toLowerCase()
            .contains(searchQuery.toLowerCase()))
            .toList();
      } else {
        searchResults = [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          decoration: const InputDecoration(
            hintText: "Ürün ara...",
            border: InputBorder.none,
          ),
          onChanged: _searchProducts,
        ),
      ),
      body: query.isEmpty
          ? const Center(
        child: Text(
          "Aramak için bir şey yazın",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      )
          : searchResults.isEmpty
          ? const Center(
        child: Text(
          "Arama sonuçları bulunamadı",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      )
          : ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          final product = searchResults[index];
          return ListTile(
            leading: Image.asset(
              product["imagePath"],
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(product["title"]),
            subtitle: Text("${product["price"]} TL"),
            onTap: () {
              // Ürün detay sayfasına yönlendirme
            },
          );
        },
      ),
    );
  }
}
