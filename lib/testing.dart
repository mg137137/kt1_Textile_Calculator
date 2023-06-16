import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dropdown Card Example'),
        ),
        body: Center(
          child: DropdownCard(
            items: [
              DropdownItem(title: 'Item 1', content: 'Content 1'),
              DropdownItem(title: 'Item 2', content: 'Content 2'),
              DropdownItem(title: 'Item 3', content: 'Content 3'),
            ],
          ),
        ),
      ),
    );
  }
}

class DropdownItem {
  final String title;
  final String content;

  DropdownItem({required this.title, required this.content});
}

class DropdownCard extends StatefulWidget {
  final List<DropdownItem> items;

  DropdownCard({required this.items});

  @override
  _DropdownCardState createState() => _DropdownCardState();
}

class _DropdownCardState extends State<DropdownCard> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Column(
          children: List.generate(widget.items.length, (index) {
            final item = widget.items[index];
            return Column(
              children: [
                ListTile(
                  title: Text(item.title),
                  trailing: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    child: Icon(
                      _selectedIndex == index
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                    ),
                  ),
                ),
                Visibility(
                  visible: _selectedIndex == index,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.content),
                        SizedBox(height: 10),
                        // Add your additional content here
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
