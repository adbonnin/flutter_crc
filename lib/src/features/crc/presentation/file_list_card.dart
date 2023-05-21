import 'dart:io';

import 'package:collection/collection.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crc/src/features/crc/presentation/file_data_grid.dart';
import 'package:flutter_crc/src/styles.dart';
import 'package:flutter_crc/src/widgets/space.dart';

class FileListCard extends StatelessWidget {
  const FileListCard({
    Key? key,
    required this.files,
    required this.onFilesChanged,
  }) : super(key: key);

  final Set<FileSystemEntity> files;
  final ValueChanged<Set<FileSystemEntity>> onFilesChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Insets.p13),
        child: Column(
          children: [
            Row(
              children: [
                OutlinedButton(
                  onPressed: onAddFoldersPressed,
                  child: const Text("Add Folders"),
                ),
              ],
            ),
            VSpace.p13,
            Expanded(
              child: FileDataGrid(
                files: files,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onAddFoldersPressed() async {
    final directoryPaths = (await getDirectoryPaths()) //
        .whereNotNull();

    if (directoryPaths.isEmpty) {
      return;
    }

    final newFiles = <FileSystemEntity>[];

    for (final path in directoryPaths) {
      final dir = Directory(path);

      await for (final file in dir.list()) {
        newFiles.add(file);
      }
    }

    onFilesChanged({
      ...files,
      ...newFiles,
    });
  }
}
