import 'dart:async';
import 'package:flutter/material.dart';
import 'package:test/next_page.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'タイマー'),
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

  double _second = 0;
  int _minute = 0;
  Timer? _timer;
  bool _isRunning = false;
  //testing
  List<String> rapLists = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${_minute.toString().padLeft(2, '0')}:${_second.toStringAsFixed(2).padLeft(5,'0')}',
              style: const TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    toggleTimer();
                  },
                  child: Text(
                    _isRunning ? 'stop' : 'start',
                    style: TextStyle(
                      color: _isRunning ? Colors.red : Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    _isRunning? rapTimer() : resetTimer();
                  },
                  child: Text(
                    _isRunning ? 'rap' : 'reset',
                    style: TextStyle(
                      color: _isRunning ? Colors.pink : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
              ],
            ),
            //testing
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListView.builder(
                  itemCount: rapLists.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        rapLists[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void toggleTimer(){
    if (_isRunning) {
      _timer?.cancel();
    }
    else{
      _timer = Timer.periodic(
        const Duration(milliseconds: 10),
        (timer) { 
          setState(() {
            _second+=0.01;
            _second=double.parse(_second.toStringAsFixed(2));
          });
        if(_minute == 2){
          resetTimer();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NextPage()),
          );
        }
        if(_second == 60){
          //秒針のリセット
          setState(() {
            _second = 0;
            _minute++;
          });
        }
        if(_minute == 60){
          setState(() {
          _minute = 0;
          });
        }
        }
      );
    }
    setState(() {
      _isRunning = !_isRunning;
    });
  }
  void resetTimer(){
    _timer?.cancel();
    setState(() {
      _second = 0;
      _minute = 0;
      rapLists.clear();
      _isRunning = false;
    });
  }
  //testing
  void rapTimer() {
    setState(() {
      int newItemIndex = rapLists.length + 1;
      rapLists.add('${_minute.toString().padLeft(2, '0')}:${_second.toStringAsFixed(2).padLeft(5,'0')}');
    });
  }
}