import 'package:flutter/foundation.dart';

class Community {
  final String name;
  final String id;
  final String banner;
  final String avatar;
  final List<String> members;
  final List<String> mods;
  Community({
    required this.name,
    required this.id,
    required this.banner,
    required this.avatar,
    required this.members,
    required this.mods,
  });

  Community copyWith({
    String? name,
    String? id,
    String? banner,
    String? avatar,
    List<String>? members,
    List<String>? mods,
  }) {
    return Community(
      name: name ?? this.name,
      id: id ?? this.id,
      banner: banner ?? this.banner,
      avatar: avatar ?? this.avatar,
      members: members ?? this.members,
      mods: mods ?? this.mods,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'banner': banner,
      'avatar': avatar,
      'members': members,
      'mods': mods,
    };
  }

  factory Community.fromMap(Map<String, dynamic> map) {
    return Community(
      name: map['name'] ?? "",
      id: map['id'] ?? "",
      banner: map['banner'] ?? "",
      avatar: map['avatar'] ?? "",
      members: List<String>.from(map['members']),
      mods: List<String>.from(map['mods']),
    );
  }

  @override
  String toString() {
    return 'Community(name: $name, id: $id, banner: $banner, avater: $avatar, members: $members, mods: $mods)';
  }

  @override
  bool operator ==(covariant Community other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.id == id &&
        other.banner == banner &&
        other.avatar == avatar &&
        listEquals(other.members, members) &&
        listEquals(other.mods, mods);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        id.hashCode ^
        banner.hashCode ^
        avatar.hashCode ^
        members.hashCode ^
        mods.hashCode;
  }
}
