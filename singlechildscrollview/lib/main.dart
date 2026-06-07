import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Available Products',     
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ScrollDirectionDemo(),
    );
  }
}

class ScrollDirectionDemo extends StatefulWidget {
  const ScrollDirectionDemo({super.key});

  @override
  State<ScrollDirectionDemo> createState() => _ScrollDirectionDemoState();
}

class _ScrollDirectionDemoState extends State<ScrollDirectionDemo> {
  Axis scrollAxis = Axis.vertical;

  final List<String> products = [
    'iPhone 17 Pro',
    'MacBook Air',
    'Samsung Galaxy S26',
    'Sony Headphones',
    'Apple Watch',
    'iPad Pro',
    'Gaming Laptop',
    'Bluetooth Speaker',
    'Smart TV',
    'Canon Camera',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Products'),

        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  scrollAxis = scrollAxis == Axis.vertical
                      ? Axis.horizontal
                      : Axis.vertical;
                });
              },
              child: Text(
                scrollAxis == Axis.vertical
                    ? 'Switch to Horizontal'
                    : 'Switch to Vertical',
              ),
            ),
          ),

          const SizedBox(height: 20),

          const SizedBox(height: 20),

          Expanded(
            child: SingleChildScrollView(
              scrollDirection: scrollAxis,
              padding: const EdgeInsets.all(16),
              child: scrollAxis == Axis.vertical
                  ? Column(
                      children: products.map((product) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade100,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              product,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    )
                  : Row(
                      children: products.map((product) {
                        return Container(
                          margin: const EdgeInsets.only(right: 12),
                          width: 220,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade100,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Text(
                                product,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}