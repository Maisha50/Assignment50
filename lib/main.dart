import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductDetailsPage(),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products',
          style: TextStyle(
            color: Colors.white,
            fontSize: 45.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Beba',
            letterSpacing: 2.0,
          ),
        ),
        backgroundColor: Colors.purple[600],
        centerTitle: true,
      ),
      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildProductCard('Casio Mtp 38', '2500 bdt', 'A watch to end all watches', 'p1', context),
            _buildProductCard('Ray-Ban Aviator Glass', '3999 bdt', 'Fly like a GD(P)', 'p2', context),



          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildProductCard(String productName, String productPrice, String productDescription, String image, BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      color: Colors.purple[100],

      child: Column(
        children: [
          Text(
            productName,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Image.asset('assets/$image.jpg',
            width: 100.0,
          ),
          SizedBox(height: 11),
          Text(
            productPrice,
            style: TextStyle(fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            productDescription,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BuyNowPage()),
              );
            },
            child: Text('Buy Now',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.grey[600]),
            ),

          ),
        ],
      ),
    );
  }
}


class BuyNowPage extends StatefulWidget {
  @override
  _BuyNowPageState createState() => _BuyNowPageState();
}

class _BuyNowPageState extends State<BuyNowPage> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Methods',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
          ),
        ),
        backgroundColor: Colors.purple[600],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildPaymentButton('BKash', 'assets/p3.png'),
                _buildPaymentButton('Rocket', 'assets/p4.png'),
                _buildPaymentButton('Visa', 'assets/p5.png'),


              ],
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              items: [
                DropdownMenuItem(
                  value: 'Home Delivery',
                  child: Text('Home Delivery'),
                ),
                DropdownMenuItem(
                  value: 'Self Pickup',
                  child: Text('Self Pickup'),
                ),
              ],
              onChanged: (String? value) {
                setState(() {
                  _selectedOption = value;
                });
              },
              hint: Text('Select Option'),
              value: _selectedOption,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey[900]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentButton(String label, String imagePath) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {

          },
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(label,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}