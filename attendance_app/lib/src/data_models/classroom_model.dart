import 'dart:convert';

class Classroom {
  String? name;
  String? ownerName;
  int? participants;
  Classroom({
     this.name,
     this.ownerName,
     this.participants,
  });
  

  Classroom copyWith({
    String? name,
    String? ownerName,
    int? participants,
  }) {
    return Classroom(
      name: name ?? this.name,
      ownerName: ownerName ?? this.ownerName,
      participants: participants ?? this.participants,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'ownerName': ownerName,
      'participants': participants,
    };
  }

  factory Classroom.fromMap(Map<String, dynamic> map) {
    return Classroom(
      name: map['name'],
      ownerName: map['ownerName'],
      participants: map['participants']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Classroom.fromJson(String source) => Classroom.fromMap(json.decode(source));

  @override
  String toString() => 'Classroom(name: $name, ownerName: $ownerName, participants: $participants)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Classroom &&
      other.name == name &&
      other.ownerName == ownerName &&
      other.participants == participants;
  }

  @override
  int get hashCode => name.hashCode ^ ownerName.hashCode ^ participants.hashCode;
}
