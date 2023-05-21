import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_crc/src/styles.dart';
import 'package:flutter_crc/src/widgets/space.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:path/path.dart' as p;

const _fileColumnName = 'file';
const _parentColumnName = 'location';

class FileDataGrid extends StatelessWidget {
  const FileDataGrid({
    Key? key,
    required this.files,
  }) : super(key: key);

  final List<FileSystemEntity> files;

  @override
  Widget build(BuildContext context) {
    return SfDataGrid(
      rowHeight: Insets.p40,
      headerRowHeight: Insets.p40,
      source: FileDataGripSource(files),
      columns: [
        GridColumn(
          columnName: _fileColumnName,
          label: const _TextCell('File'),
          columnWidthMode: ColumnWidthMode.fill,
        ),
        GridColumn(
          columnName: _parentColumnName,
          label: const _TextCell('Location'),
          columnWidthMode: ColumnWidthMode.fitByCellValue,
        ),
      ],
    );
  }
}

class FileDataGripSource extends DataGridSource {
  FileDataGripSource(List<FileSystemEntity> files) : rows = files.map(toDataGridRow).toList();

  @override
  final List<DataGridRow> rows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    final cells = row.getCells();

    return DataGridRowAdapter(
      cells: [
        _FileCell(file: cells[0].value),
        _TextCell((cells[1].value as Directory).path),
      ],
    );
  }

  static DataGridRow toDataGridRow(FileSystemEntity file) {
    return DataGridRow(
      cells: [
        DataGridCell(
          columnName: _fileColumnName,
          value: file,
        ),
        DataGridCell(
          columnName: _parentColumnName,
          value: file.parent,
        )
      ],
    );
  }
}

class _Cell extends StatelessWidget {
  const _Cell({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: Insets.p16),
      alignment: Alignment.centerLeft,
      child: child,
    );
  }
}

class _TextCell extends StatelessWidget {
  const _TextCell(
    this.value, {
    Key? key,
  }) : super(key: key);

  final Object? value;

  @override
  Widget build(BuildContext context) {
    return _Cell(
      child: Text(value.toString()),
    );
  }
}

class _FileCell extends StatelessWidget {
  const _FileCell({
    Key? key,
    required this.file,
  }) : super(key: key);

  final FileSystemEntity file;

  @override
  Widget build(BuildContext context) {
    return _Cell(
      child: Row(
        children: [
          Icon(file is Directory ? Symbols.folder : Symbols.draft),
          HSpace.p13,
          Expanded(
            child: Text(
              p.basename(file.path),
              overflow: TextOverflow.fade,
              softWrap: false,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
