import 'package:flutter/material.dart';
import 'package:my_first_app/card.dart';
import 'package:my_first_app/character_call.dart';
import 'package:my_first_app/character_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CharacterProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Products Grid',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ProductGridScreen(),
    );
  }
}

class ProductGridScreen extends StatefulWidget {
  @override
  _ProductGridScreenState createState() => _ProductGridScreenState();
}

class _ProductGridScreenState extends State<ProductGridScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CharacterProvider>(context, listen: false).fetchCharacter();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Access the provider
    final characterProvider = Provider.of<CharacterProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: characterProvider.isLoading
          ? Center(child: CircularProgressIndicator()) // Show loading indicator
          : characterProvider.characters.isEmpty
              ? Center(child: Text('No products found!')) // Show empty message
              : Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: characterProvider.characters.length,
                    itemBuilder: (context, index) {
                      return itemCard(item: characterProvider.characters[index]);
                    },
                  ),
                ),
    );
  }
}
