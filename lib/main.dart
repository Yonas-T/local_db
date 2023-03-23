import 'package:flutter/material.dart';
import 'package:local_db/service.dart';
import 'package:local_db/user.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  final _service = Service();
  List<Map<String, dynamic>>? userData;

  final user =
      User(id: 8, email: 'user@test.com', firstName: 'Other', lastName: 'Test', roles: 'testable', details: 'none');

  @override
  void initState() {
    _service.readUser().then((value) => userData = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Data saved:',
            ),
            Text(
              userData?.last['first_name'] ?? '__',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              userData?.last['last_name'] ?? '__',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              userData?.last['email'] ?? '__',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            FloatingActionButton(
              onPressed: () {
                _service.saveUser(user);
                // _service.updateUser(user);
              },
              child: const Icon(Icons.save_alt),
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
