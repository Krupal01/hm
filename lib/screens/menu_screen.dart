import 'package:flutter/material.dart';
import 'package:hotel_management/widgets/custom_app_bar.dart';

import '../widgets/menu_item.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  bool favorite = false;
  final List<String> _filters = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Menu',
        isDrawerIcon: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Wrap(
              spacing: 5.0,
              children: ExerciseFilter.values.map((ExerciseFilter exercise) {
                return FilterChip(
                  label: Text(exercise.name),
                  selected: _filters.contains(exercise.name),
                  onSelected: (bool value) {
                    setState(() {
                      if (value) {
                        if (!_filters.contains(exercise.name)) {
                          _filters.add(exercise.name);
                        }
                      } else {
                        _filters.removeWhere((String name) {
                          return name == exercise.name;
                        });
                      }
                    });
                  },
                );
              }).toList(),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: false,
                itemBuilder: (context, index) => MenuItem(
                    index: index,
                    onMenuSelect: (p0, p1) {},
                    isCategoryVisible: index ==
                        0 //todo add this '|| menuList[index].category != menuList[index-1].category'
                    ),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum ExerciseFilter { walking, running, cycling, hiking }
