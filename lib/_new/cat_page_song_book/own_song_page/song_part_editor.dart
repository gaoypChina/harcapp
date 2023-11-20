
import 'package:flutter/material.dart';
import 'package:harcapp_core_own_song/page_widgets/song_part_editor_template/error_widget.dart';
import 'package:harcapp_core_own_song/page_widgets/song_part_editor_template/song_part_editor_template.dart';


class SongPartEditor extends StatefulWidget{

  final String? initText;
  final String? initChords;
  final bool? initShifted;

  final bool isRefren;
  final Function(String, int)? onTextChanged;
  final Function(String, int)? onChordsChanged;
  final Function(bool)? onShiftedChanged;

  const SongPartEditor({super.key, this.initText, this.initChords, this.initShifted, this.isRefren = false, this.onTextChanged, this.onChordsChanged, this.onShiftedChanged});

  @override
  State<StatefulWidget> createState() => SongPartEditorState();

}

class SongPartEditorState extends State<SongPartEditor>{

  String? get initText => widget.initText;
  String? get initChord => widget.initChords;
  bool? get initShifted => widget.initShifted;
  bool get isRefren => widget.isRefren;
  Function(String, int)? get onTextChanged => widget.onTextChanged;
  Function(String, int)? get onChordsChanged => widget.onChordsChanged;
  Function(bool)? get onShiftedChanged => widget.onShiftedChanged;

  bool? showErrBar;

  @override
  void initState() {
    showErrBar = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => SongPartEditorTemplate(
    initText: initText,
    initChord: initChord,
    initShifted: initShifted,
    isRefren: isRefren,
    onTextChanged: onTextChanged,
    onChordsChanged: onChordsChanged,
    onShiftedChanged: onShiftedChanged,
    bottomBuilder: (context, state) => Column(
      children: [
        ButtonsWidget(
          isRefren: isRefren,
          onCheckPressed: () => Navigator.pop(context),
          onAlertTap: () => setState(() => showErrBar = !showErrBar!),
          onChordsChanged: onChordsChanged,
        ),
        ErrorListWidget(showErrBar),
      ],
    ),
  );

}