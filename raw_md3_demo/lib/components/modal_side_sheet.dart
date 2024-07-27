// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter/material.dart';
import 'package:raw_md3_demo/components/component_decoration.dart';
import 'package:side_sheet_material3/side_sheet_material3.dart';

/// The Flutter SDK as of July 2024 does not have modal side 
/// sheets and no standard side sheets. Just the same stuff 
/// from MD2 in that missing Material Design components from 
/// the damn SDK. This is a temp fix via a package.
/// 
/// @author Fredrick Allan Grott
class CustomModalSideSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ComponentDecoration(
        label: 'Modal Side Sheet',
        tooltipMessage: 'Modal Side Sheet',
        child: FilledButton(
            onPressed: () {
              showModalSideSheet(
                context,
                body: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                header: "edit user",
                barrierDismissible: false,
                addBackIconButton: false,
                addCloseIconButton: true,
                addActions: true,
                addDivider: true,
                confirmActionTitle: 'Update',
                cancelActionTitle: 'Cancel',
                confirmActionOnPressed: () {
                  Navigator.pop(context);
                  debugPrint('on confirm action');
                },
                cancelActionOnPressed: () {
                  Navigator.pop(context);
                  debugPrint('on cancel event');
                },
                transitionDuration: const Duration(milliseconds: 1500),
                closeButtonTooltip: 'Close',
                backButtonTooltip: 'Back',
                onDismiss: () {
                  debugPrint('on dismiss event');
                },
                onClose: () {
                  Navigator.pop(context);
                  debugPrint('on close event');
                },
              );
            },
            child: const Text('show side sheet'),
            ),);
  }
}
