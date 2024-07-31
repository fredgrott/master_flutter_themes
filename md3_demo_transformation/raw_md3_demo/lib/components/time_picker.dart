// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from the Flutter Samples Material Demo
// Copyright 2021 under BSD license by Flutter Team



import 'package:flutter/material.dart';
import 'package:raw_md3_demo/components/component_decoration.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({super.key});

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return ComponentDecoration(
      label: 'Time picker',
      tooltipMessage: 'Use showTimePicker',
      child: TextButton.icon(
        onPressed: () async {
          final TimeOfDay? time = await showTimePicker(
            context: context,
            initialTime: selectedTime ?? TimeOfDay.now(),
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  alwaysUse24HourFormat: true,
                ),
                child: child!,
              );
            },
          );
          setState(() {
            selectedTime = time;
            if (selectedTime != null) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content:
                    Text('Selected time: ${selectedTime!.format(context)}'),
              ),);
            }
          });
        },
        icon: const Icon(Icons.schedule),
        label: const Text(
          'Show time picker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
