import '../../../../../config/constants.dart';

class Note {
  int? id;
  String? title;
  String? desc;
  String? date;
  String? time;
  String? repeat;
  Note({this.id, this.title, this.desc, this.date, this.time, this.repeat});
// Read
  Note.fromMap(Map<String, dynamic> map) {
    id = map[Constants.notesIdColumnName];
    title = map[Constants.notesTitleColumnName];
    desc = map[Constants.notesDescColumnName];
    date = map[Constants.notesDateColumnName];
    time = map[Constants.notesTimeColumnName];
    repeat = map[Constants.notesRepeatColumnName];
  }

// Write
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      Constants.notesTitleColumnName: title,
      Constants.notesDescColumnName: desc,
      Constants.notesDateColumnName: date,
      Constants.notesTimeColumnName: time,
      Constants.notesRepeatColumnName: repeat,
    };
  }
}
