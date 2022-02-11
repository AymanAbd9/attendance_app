import 'dart:convert';

// TODO: make a datamodel for general user

class GeneralUser {
  String uid;
  String email;
  String username;
  bool isTeacher;
  GeneralUser({
    required this.uid,
    required this.email,
    required this.username,
    required this.isTeacher,
  });

  GeneralUser copyWith({
    String? uid,
    String? email,
    String? username,
    bool? isTeacher,
  }) {
    return GeneralUser(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      username: username ?? this.username,
      isTeacher: isTeacher ?? this.isTeacher,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'username': username,
      'isTeacher': isTeacher,
    };
  }

  factory GeneralUser.fromMap(Map<String, dynamic> map) {
    return GeneralUser(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      username: map['username'] ?? '',
      isTeacher: map['isTeacher'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory GeneralUser.fromJson(String source) => GeneralUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GeneralUser(uid: $uid, email: $email, username: $username, isTeacher: $isTeacher)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is GeneralUser &&
      other.uid == uid &&
      other.email == email &&
      other.username == username &&
      other.isTeacher == isTeacher;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
      email.hashCode ^
      username.hashCode ^
      isTeacher.hashCode;
  }
}
