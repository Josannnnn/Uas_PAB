import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final String label;
  const FilterButton({Key? key, required this.label}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(onPressed: () {}, child: Text(label));
  }
}
