import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Yebelo'),
      ),
      body: Center(
        child: FutureBuilder(
          future:
              DefaultAssetBundle.of(context).loadString('assets/products.json'),
          builder: ((context, snapshot) {
            var items = json.decode(snapshot.data.toString());
            return ListView.builder(
              itemCount: items == null ? 0 : items.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 5, bottom: 5, left: 12, right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              items[index]['p_id'].toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(width: _mediaQuery.size.width * 0.05),
                            Container(
                              child: Image.network(
                                items[index]['p_imageUrl'].toString(),
                                height: _mediaQuery.size.height * 0.18,
                                width: _mediaQuery.size.width * 0.18,
                              ),
                            ),
                            SizedBox(width: _mediaQuery.size.width * 0.05),
                            Text(
                              items[index]['p_name'].toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(width: _mediaQuery.size.width * 0.05),
                            Text(
                              '₹' + items[index]['p_cost'].toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
