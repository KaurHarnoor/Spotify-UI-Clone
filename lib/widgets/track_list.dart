import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/track_model.dart';
import '../data/data.dart';

class TrackList extends StatelessWidget {
  final List<Song> tracks;

  const TrackList({Key? key, required this.tracks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingTextStyle: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 12.0),
      dataRowMinHeight: 54.0,
      dataRowMaxHeight: 54.0,
      showCheckboxColumn: false,
      columns: const [
        DataColumn(label: Text('TITLE', style: TextStyle(color: Colors.white))),
        DataColumn(label: Text('ARTIST', style: TextStyle(color: Colors.white))),
        DataColumn(label: Icon(Icons.access_time, color: Colors.white)),
      ],
      rows: tracks.map((e) {
        final isSelected = context.watch<TrackModel>().currentTrack?.id == e.id;
        final textStyle = TextStyle(color: isSelected ? Colors.green : Colors.white);

        return DataRow(
          cells: [
            DataCell(Text(e.title, style: textStyle)),
            DataCell(Text(e.singer, style: textStyle)),
            DataCell(Text(e.time, style: textStyle)),
          ],
          selected: isSelected,
          onSelectChanged: (_) => context.read<TrackModel>().setTrack(e),
          color: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
                return Colors.grey.withOpacity(0.2);
              } else if (states.contains(WidgetState.hovered)) {
                return Colors.grey.withOpacity(0.1);
              }
              return null;
            },
          ),
        );
      }).toList(),
    );
  }
}
