import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_list_1/memory_list.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
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
      home: const HomePage(),
    );
  }
}

class HomePage extends ConsumerStatefulWidget{
  const HomePage({super.key});
@override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _HomePageState();
  }
  
  
  
}

class _HomePageState extends ConsumerState<ConsumerStatefulWidget> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${ref.read(memoryListProvider.notifier).previousIndex}"),
            Text("${ref.watch(memoryListProvider)}"),
          ],
        )
      ),
  
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.plus_one),
            onPressed: () {
              count++;
              ref.read(memoryListProvider.notifier).addItemToRight(5);
            }
          ),
          FloatingActionButton(
            child: const Icon(Icons.minimize),
            onPressed: () {
              count--;
              ref.read(memoryListProvider.notifier).addItemToLeft(0);
            }
          ),
        ]
    ));
  }

}