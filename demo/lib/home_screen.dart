import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();

  List products = [];
  List original = [];

  void loadData() async {
    String jsonStr = await rootBundle.loadString('assets/products.json');
    var json = jsonDecode(jsonStr);
    products = json;
    original = json;
    setState(() {});
  }

  void search(String query) {
    if (query.isEmpty) {
      products = original;
      setState(() {});
      return;
    }

    query = query.toLowerCase();
    //print(query);
    List result = [];
    for (var p in products) {
      var name = p["p_name"].toString().toLowerCase();
      if (name.contains(query)) {
        result.add(p);
      }
    }

    products = result;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yebelo'),
      ),
      body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: controller,
                    onChanged: search,
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.text = '';
                          search(controller.text);
                        },
                        icon: const Icon(Icons.clear),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Filter'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _listView(products),
          ]),
    );
  }
}

Widget _listView(products) {
  return Expanded(
    child: ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        var product = products[index];
        var mediaQuery = MediaQuery.of(context);
        return SizedBox(
          height: mediaQuery.size.height * 0.1,
          child: ListTile(
            leading: Image.network(
              product['p_imageUrl'].toString(),
            ),
            title: Text(
              product['p_name'],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            subtitle: Text(
              "Cost: ₹${product['p_cost']}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        );
      },
    ),
  );
}
