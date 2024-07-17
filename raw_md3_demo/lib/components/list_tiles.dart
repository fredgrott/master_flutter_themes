// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



import 'package:flutter/material.dart';
import 'package:raw_md3_demo/components/component_decoration.dart';

class ListTiles extends StatelessWidget {
  const ListTiles({super.key});
  
  @override
  Widget build(BuildContext context) {
   return const ComponentDecoration(
      label: 'ListTiles',
      tooltipMessage: 'Use List or ListTile',
      // need column here instead of ListView as ListView 
      // will force the viewport verticle height to unbounded
      // this is straight modified example from the docs and 
      // do not  know why the Flutter team was too damn 
      // lazy to add it.
      child: Column(
        children: <Widget>[
          Card(child: ListTile(title: Text('One-line ListTile'))),
          Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text('One-line with leading widget'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('One-line with trailing widget'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text('One-line with both widgets'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('One-line dense ListTile'),
              dense: true,
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(size: 56.0),
              title: Text('Two-line ListTile'),
              subtitle: Text('Here is a second line'),
              trailing: Icon(Icons.more_vert),
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(size: 72.0),
              title: Text('Three-line ListTile'),
              subtitle:
                  Text('A sufficiently long subtitle warrants three lines.'),
              trailing: Icon(Icons.more_vert),
              isThreeLine: true,
            ),
          ),
        ],
      ),
    );
  }


}
