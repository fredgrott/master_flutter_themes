// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from the Flutter Samples Material Demo
// Copyright 2021 under BSD license by Flutter Team




import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:raw_md3_demo/components/component_decoration.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? selectedDate;
  final DateTime _firstDate = DateTime(DateTime.now().year - 2);
  final DateTime _lastDate = DateTime(DateTime.now().year + 1);

  @override
  Widget build(BuildContext context) {
    return ComponentDecoration(
      label: 'Date picker',
      tooltipMessage: 'Use showDatePicker',
      child: TextButton.icon(
        onPressed: () async {
          final DateTime? date = await showDatePicker(
            context: context,
            initialDate: selectedDate ?? DateTime.now(),
            firstDate: _firstDate,
            lastDate: _lastDate,
          );
          setState(() {
            selectedDate = date;
            if (selectedDate != null) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                    'Selected Date: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',),
              ),);
            }
          });
        },
        icon: const Icon(Symbols.calendar_month),
        label: const Text(
          'Show date picker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
