import 'dart:io';

import 'package:collection/collection.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crc/src/features/crc/presentation/file_data_grid.dart';
import 'package:flutter_crc/src/styles.dart';
import 'package:flutter_crc/src/widgets/space.dart';

class CrcScreen extends StatefulWidget {
  const CrcScreen({Key? key}) : super(key: key);

  @override
  State<CrcScreen> createState() => _CrcScreenState();
}

class _CrcScreenState extends State<CrcScreen> {
  var _files = <FileSystemEntity>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Insets.p13),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(Insets.p13),
            child: Column(
              children: [
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: _onAddDirectoryPressed,
                      child: const Text("Add Folders"),
                    ),
                  ],
                ),
                VSpace.p13,
                Expanded(
                  child: FileDataGrid(
                    files: _files,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onAddDirectoryPressed() async {
    final directoryPaths = (await getDirectoryPaths()) //
        .whereNotNull();

    if (directoryPaths.isEmpty) {
      return;
    }

    final files = <FileSystemEntity>[];

    for (final path in directoryPaths) {
      final dir = Directory(path);

      await for (final file in dir.list()) {
        files.add(file);
      }
    }

    setState(() {
      _files = [
        ..._files,
        ...files,
      ];
    });
  }
}
