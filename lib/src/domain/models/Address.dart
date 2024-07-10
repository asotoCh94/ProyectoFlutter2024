import 'dart:convert';

class Address {
  int? id;
  String? address;
  String? neighborhood;
  int? idUser;
  DateTime? createdAt;
  DateTime? updateAt;

  Address({
    this.id,
    this.address,
    this.neighborhood,
    this.idUser,
    this.createdAt,
    this.updateAt,
  });

  factory Address.fromRawJson(String str) => Address.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        address: json["address"],
        neighborhood: json["neighborhood"],
        idUser: json["id_user"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updateAt: json["update_at"] == null
            ? null
            : DateTime.parse(json["update_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "neighborhood": neighborhood,
        "id_user": idUser,
        "created_at": createdAt?.toIso8601String(),
        "update_at": updateAt?.toIso8601String(),
      };
}
