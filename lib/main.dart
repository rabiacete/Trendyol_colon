import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Marka, ürün veya kategori ara',
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.orange),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Kategoriler Sekmesi
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _categoryButton('=Kategoriler', false),
                  _categoryButton('Kadın', true),
                  _categoryButton('Erkek', false),
                  _categoryButton('Moda', false),
                ],
              ),
            ),

            // Slider
            Container(
              height: 150,
              child: PageView(
                children: [
                  _sliderItem('Paylaşma Günü\'nde Sepette İyilik ile', Colors.red),
                  _sliderItem('Yeni İndirimler Başladı!', Colors.blue),
                  _sliderItem('Kampanya Ürünleri', Colors.green),
                ],
              ),
            ),

            // Hizmetlerimizi Keşfet
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                'Hizmetlerimizi Keşfet',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Tümünü Gör'),
              ),
            ),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _serviceItem(Icons.fastfood, 'Yemek'),
                  _serviceItem(Icons.local_grocery_store, '   Market'),
                  _serviceItem(Icons.local_mall, '  Dolap'),
                  _serviceItem(Icons.live_tv, '   Canlı Yayınlar'),
                ],
              ),
            ),

            // Sana Özel Ürünler
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sana Özel Ürünler',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('Tümünü Gör'),
                  ),
                ],
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              children: [
                _productItem('Oversize Örme Triko', '700 TL'),
                _productItem('Kadın Siyah Peluş Mont', '1500 TL'),
                _productItem('Dedektiflik Oyunu', '108.46 TL'),
                _productItem('Başka Bir Ürün', '200.00 TL'),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Anasayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Trendyol Go',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorilerim',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Sepetim',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Hesabım',
          ),
        ],
      ),
    );
  }

  Widget _categoryButton(String title, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.orange : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _sliderItem(String text, Color color) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _serviceItem(IconData icon, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          child: Icon(icon, color: Colors.white),
          backgroundColor: Colors.orange,
        ),
        SizedBox(height: 5),
        Text(title),
      ],
    );
  }

  Widget _productItem(String name, String price) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: Center(child: Icon(Icons.image, size: 50)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              price,
              style: TextStyle(color: Colors.orange),
            ),
          ),
        ],
      ),
    );
  }
}