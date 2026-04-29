import 'package:flutter/material.dart';
import 'listview.dart';
import 'gridview.dart';
import 'sharedpreferences.dart';
import 'asynchronou.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final exercises = [
      {
        'title': 'Danh sách liên hệ',
        'color': Colors.lightBlueAccent,
        'screen': const ListViewScreen(),
      },
      {
        'title': 'Thư viện',
        'color': Colors.lightBlueAccent,
        'screen': const GridViewScreen(),
      },
      {
        'title': 'Lưu dữ liệu',
        'color': Colors.lightBlueAccent,
        'screen': const SharedPrefScreen(),
      },
      {
        'title': 'Lập trình bất đồng bộ',
        'color': Colors.lightBlueAccent,
        'screen': const AsyncScreen(),
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Exercise_week_4',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: exercises.length,
          itemBuilder: (context, index) {
            final item = exercises[index];

            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              color: item['color'] as Color,
              elevation: 6,
              shadowColor: Colors.black26,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                title: Text(
                  item['title'] as String,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 16,
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => item['screen'] as Widget),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
