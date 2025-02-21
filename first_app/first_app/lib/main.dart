import 'package:flutter/material.dart';
import 'package:my_first_app/api_call.dart';
import 'package:my_first_app/character_call.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 21, 81, 211),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Banking Wallet'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  
        title: Text('item List'),
      ),
      body: FutureBuilder(future: fetchCharater(), builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());

        }
        else if (snapshot.hasError){
          return Center(child: Text('Error: ${snapshot.error}'),);
        }
        else {
          return GridView.builder(
            padding: EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index){
              final item = snapshot.data![index];
             return Card(
                    elevation: 5,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network(
                          item.imgUrl ?? 'https://via.placeholder.com/100',
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            item.name,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                          child: Text(
                            item.affiliation ?? 'No affiliation available',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       Text(
                        //         '\$${item.price}',  // Assume item has a price field
                        //         style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        //       ),
                        //       SizedBox(width: 10),  // Space between text and icon
                        //       Icon(Icons.remove_red_eye, color: Colors.grey),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  );
            },

          );
        
        }
      })
      
    );
  }
}
