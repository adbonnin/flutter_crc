import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class FileSource extends DataGridSource {
  FileSource(List<XFile> files) : rows = files.map(toDataGridRow).toList();

  @override
  final List<DataGridRow> rows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: [
        for (var cell in row.getCells()) //
          _buildCell(cell),
      ],
    );
  }

  Widget _buildCell(DataGridCell cell) {
    return Text(cell.value.toString());
  }

  static DataGridRow toDataGridRow(XFile file) {
    return DataGridRow(
      cells: [
        DataGridCell(
          columnName: 'file',
          value: file.path,
        ),
      ],
    );
  }
}
