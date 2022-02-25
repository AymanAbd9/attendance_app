import 'dart:convert';

class Classroom {
  String? name;
  String? teacherName;
  int? participants;
  Classroom({
     this.name,
     this.teacherName,
     this.participants,
  });
  

  Classroom copyWith({
    String? name,
    String? teacherName,
    int? participants,
  }) {
    return Classroom(
      name: name ?? this.name,
      teacherName: teacherName ?? this.teacherName,
      participants: participants ?? this.participants,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'teacherName': teacherName,
      'participants': participants,
    };
  }

  factory Classroom.fromMap(Map<String, dynamic> map) {
    return Classroom(
      name: map['name'],
      teacherName: map['teacherName'],
      participants: map['participants']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Classroom.fromJson(String source) => Classroom.fromMap(json.decode(source));

  @override
  String toString() => 'Classroom(name: $name, teacherName: $teacherName, participants: $participants)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Classroom &&
      other.name == name &&
      other.teacherName == teacherName &&
      other.participants == participants;
  }

  @override
  int get hashCode => name.hashCode ^ teacherName.hashCode ^ participants.hashCode;
}
