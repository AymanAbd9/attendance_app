import 'dart:convert';

class Classroom {
  String? name;
  String? teacherName;
  int? participants;
  String? uid;
  Classroom({
    this.name,
    this.teacherName,
    this.participants,
    this.uid,
  });
  

  Classroom copyWith({
    String? name,
    String? teacherName,
    int? participants,
    String? uid,
  }) {
    return Classroom(
      name: name ?? this.name,
      teacherName: teacherName ?? this.teacherName,
      participants: participants ?? this.participants,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'teacherName': teacherName,
      'participants': participants,
      'uid': uid,
    };
  }

  factory Classroom.fromMap(Map<String, dynamic> map) {
    return Classroom(
      name: map['name'],
      teacherName: map['teacherName'],
      participants: map['participants']?.toInt(),
      uid: map['uid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Classroom.fromJson(String source) => Classroom.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Classroom(name: $name, teacherName: $teacherName, participants: $participants, uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Classroom &&
      other.name == name &&
      other.teacherName == teacherName &&
      other.participants == participants &&
      other.uid == uid;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      teacherName.hashCode ^
      participants.hashCode ^
      uid.hashCode;
  }
}
