import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_crc/src/features/crc/presentation/file_list_card.dart';
import 'package:flutter_crc/src/styles.dart';

class CrcScreen extends StatefulWidget {
  const CrcScreen({Key? key}) : super(key: key);

  @override
  State<CrcScreen> createState() => _CrcScreenState();
}

class _CrcScreenState extends State<CrcScreen> {
  var _files = <FileSystemEntity>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Insets.p13),
        child: FileListCard(
          files: _files,
          onFilesChanged: _onFilesChanged,
        ),
      ),
    );
  }

  Future<void> _onFilesChanged(Set<FileSystemEntity> files) async {
    setState(() {
      _files = files;
    });
  }
}
