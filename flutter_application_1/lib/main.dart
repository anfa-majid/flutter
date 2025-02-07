import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.blue[100],
            appBar: AppBar(
              backgroundColor: Colors.blue[900],
              title: Text(
                "Flutter Banking Wallet",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  
              ),
              elevation: 0,
              centerTitle: true,
              // leading: Icon(
              //   Icons.menu,
              //   color: Colors.white,
              // ),
              // actions: [
              //   IconButton(
              //       onPressed: () {},
              //       icon: Icon(
              //         Icons.logout,
              //         color: Colors.white,
              //       ))
              // ],
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.blue[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                      width: 500,
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Current Balance',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '\$12,540.75',
                            style: TextStyle(color: Colors.white, fontSize: 32),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            RawMaterialButton(
                              onPressed: () {},
                              elevation: 2.0,
                              fillColor: Colors.blue[300],
                              constraints: BoxConstraints(minWidth: 0.0),
                              padding: EdgeInsets.all(15.0),
                              shape: CircleBorder(),
                              child: Icon(
                                Icons.send,
                                size: 35.0,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Send',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            RawMaterialButton(
                              onPressed: () {},
                              elevation: 2.0,
                              fillColor: Colors.blue[300],
                              constraints: BoxConstraints(minWidth: 0.0),
                              padding: EdgeInsets.all(15.0),
                              shape: CircleBorder(),
                              child: Icon(
                                Icons.request_page,
                                size: 35.0,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Request',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            RawMaterialButton(
                              onPressed: () {},
                              elevation: 2.0,
                              fillColor: Colors.blue[300],
                              constraints: BoxConstraints(minWidth: 0.0),
                              padding: EdgeInsets.all(15.0),
                              shape: CircleBorder(),
                              child: Icon(
                                Icons.wallet_giftcard,
                                size: 35.0,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Top-up',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                    
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  //write a title recent transactions
                  child: ListTile(
                  title: Text(
                    'Recent Transactions',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
                ),
                SizedBox(height: 5),

                  SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.15,
                          child: ListView.builder(
                            itemCount: 1,
                            itemBuilder: (context, i) {
                              return Card(
                                elevation: 2,
                                child: ListTile(
                                  leading: const Icon(Icons.money),
                                  title: const Text("Payment"),
                                  trailing: const Text("Rs. 100"),
                                
                                ),
                              
                              );
                            },
                          ),
                        ),
                        

                  
              ],
            )));
  }
}