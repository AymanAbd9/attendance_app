import 'dart:convert';

class ClassRoom {
  String? name;
  String? ownerName;
  int? participants;
  ClassRoom({
     this.name,
     this.ownerName,
     this.participants,
  });
  

  ClassRoom copyWith({
    String? name,
    String? ownerName,
    int? participants,
  }) {
    return ClassRoom(
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

  factory ClassRoom.fromMap(Map<String, dynamic> map) {
    return ClassRoom(
      name: map['name'],
      ownerName: map['ownerName'],
      participants: map['participants']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ClassRoom.fromJson(String source) => ClassRoom.fromMap(json.decode(source));

  @override
  String toString() => 'ClassRoom(name: $name, ownerName: $ownerName, participants: $participants)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ClassRoom &&
      other.name == name &&
      other.ownerName == ownerName &&
      other.participants == participants;
  }

  @override
  int get hashCode => name.hashCode ^ ownerName.hashCode ^ participants.hashCode;
}
