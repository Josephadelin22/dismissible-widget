import 'package:flutter/material.dart';

void main() => runApp(const TodoApp());

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  // Real-world dummy data list
  final List<String> _todoTasks = [
    'Buy ingredients for dinner',
    'Review Flutter documentation',
    'Finish Mobile App assignment',
    'Push code to GitHub repository',
    'Prepare presentation slides',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Demo: Dismissible'),
        centerTitle: true,
      ),
      body: _todoTasks.isEmpty
          ? const Center(child: Text('All tasks completed! '))
          : ListView.builder(
              itemCount: _todoTasks.length,
              itemBuilder: (context, index) {
                final task = _todoTasks[index];

                // 1. Wrap your item inside the Dismissible widget
                return Dismissible(
                  // PROPERTY 1: Mandatory unique key linked to the data object
                  key: Key(task),

                  // PROPERTY 2: Swipe right background (Green / Archive)
                  background: Container(
                    color: Colors.green,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: const Icon(Icons.check, color: Colors.white),
                  ),

                  // PROPERTY 3: Swipe left background (Red / Delete)
                  secondaryBackground: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),

                  // PROPERTY 4: Action logic executed when swipe completes
                  onDismissed: (DismissDirection direction) {
                    setState(() {
                      // Remove item from our local list state
                      _todoTasks.removeAt(index);
                    });

                    // Quick visual feedback notification at the bottom
                    String action = direction == DismissDirection.endToStart
                        ? 'deleted'
                        : 'archived';
                        
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Task $action successfully')),
                    );
                  },

                  // The actual item layout on screen
                  child: Card(
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: ListTile(
                      leading: const Icon(Icons.assignment_turned_in),
                      title: Text(task),
                      subtitle: const Text('Swipe left to delete, right to archive'),
                    ),
                  ),
                );
              },
            ),
    );
  }
}