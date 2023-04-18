import 'package:flutter/material.dart';
import 'package:flutter_crud_sederhana/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyLogin(),
    );
  }
}


// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     final ButtonStyle style =
//         ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
//
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text("judul"),
//         ),
//         body: Column(
//           children: <Widget>[
//             ElevatedButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 style: style,
//                 child: const Text("bak to hom page ")),
//             const ElevatedButton(
//                 onPressed: null, child: Text("This a Second Button")),
//             const ElevatedButton(
//                 onPressed: null, child: Text("This a Third Button")),
//             const Image(
//               height: 200,
//               width: 200,
//               image: NetworkImage(
//                   "https://api.duniagames.co.id/api/content/upload/file/11070838571638523823.png"),
//             ),
//             const Image(
//                 height: 200,
//                 width: 200,
//                 image: AssetImage("assets/images/computer_user.png"))
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ListViews extends StatefulWidget {
//   const ListViews({Key? key}) : super(key: key);
//
//   @override
//   State<ListViews> createState() => _MyAppState();
//
// }
//
// class _MyAppState extends State<ListViews> {
//
//   List<Widget> widgets = [];
//   int value = 1;
//
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   // tambahkan widget ke dalam daftar widgets
//   //   for (int i = 0; i < 20; i++) {
//   //     widgets.add(ListTile(
//   //       title: Text('Item $i'),
//   //     ));
//   //   }
//   // }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text("List and ListView"),
//         ),
//         // body: Column( jangan pakai column kalau buat list karena akan error dan tidak dapat di scroll
//         body: ListView(
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: <Widget>[
//                 ElevatedButton(child: const Text("Add"), onPressed: (){
//                   setState(() {
//                     widgets.add(Text("data ke : $value"));
//                     value++;
//                   });
//                 }),
//                 ElevatedButton(child: const Text("Delete"), onPressed: (){
//                   setState(() {
//                     widgets.removeLast();
//                     value--;
//                   });
//                 }),
//               ],
//             ),
//             Column(
//               children: widgets,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MyButton extends StatefulWidget {
//   const MyButton({Key? key}) : super(key: key);
//
//   @override
//   State<MyButton> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyButton> {
//   int number = 0;
//
//   void tambahData() {
//     setState(() {
//       number = number + 1;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text("My Stateful Widget"),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               const Text("data"),
//               Text(number.toString()),
//               ElevatedButton(
//                 onPressed: tambahData,
//                 child: const Text(
//                   "Tambahkan",
//                   style: TextStyle(
//                       fontFamily: "rubik_light",
//                       fontSize: 20,
//                       fontStyle: FontStyle.italic),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class MarginAndPadding extends StatelessWidget {
  const MarginAndPadding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Ini Toolbar"),
        ),
        body: Container(
          color: Colors.red,
          // margin: const EdgeInsets.all(10),
          margin: const EdgeInsets.fromLTRB(20, 20, 5, 5),
          padding: const EdgeInsets.only(bottom: 5),
          // padding: const EdgeInsets.all(10),
          child: Container(
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}

class ColumnAndRow extends StatelessWidget {
  const ColumnAndRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("penggunaan Column"),
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center, // seperti gravity
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text("colom pertama"),
            const Text("Colom kedua"),
            Row(
              children: const <Widget>[Text("ini row 1"), Text("Ini row 2")],
            )
          ],
        ),
      ),
    );
  }
}

class Containers extends StatelessWidget {
  const Containers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("data"),
        ),
        body: Center(
            child: Container(
                color: Colors.blue,
                width: 150,
                height: 50,
                child: const Text(
                  "ini adalah body yang sedang saya kerjakan saat ini ",
                  maxLines: 2,
                  style: TextStyle(
                      color: Colors.red,
                      fontStyle: FontStyle.normal,
                      fontSize: 21),
                  overflow: TextOverflow.ellipsis,
                ))),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
