import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crc/src/features/create/file_source.dart';
import 'package:flutter_crc/src/widgets/space.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({Key? key}) : super(key: key);

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  var _files = <XFile>[];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text('Create CRC'),
          Row(
            children: [
              Flexible(
                child: FilledButton(
                  onPressed: _onAddDirectoryPressed,
                  child: Text("Ajouter un dossier"),
                ),
              ),
              HSpace.p4,
              Flexible(
                child: FilledButton(
                  onPressed: _onAddFilesPressed,
                  child: Text("Ajouter des fichiers"),
                ),
              ),
            ],
          ),
          Expanded(
            child: SfDataGrid(
              source: FileSource(_files),
              columns: [
                GridColumn(
                  columnName: 'file',
                  label: Text("File"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _onAddFilesPressed() async {
    final openedFiles = await openFiles();

    if (openedFiles.isEmpty) {
      return;
    }

    _files = [
      ..._files,
      ...openedFiles,
    ];
  }

  void _onAddDirectoryPressed() async {
    final openedDirectory = await getDirectoryPath();

    if (openedDirectory == null) {
      return;
    }
  }
}
