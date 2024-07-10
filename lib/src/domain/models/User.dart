
import 'Rol.dart';

class User {
  int? id;
  String name;
  String lastName;
  String? email;
  String phone;
  String? password;
  String? image;
  String? notificationToken;
  List<Role>? roles;

  User({
    this.id,
    required this.name,
    required this.lastName,
    this.email,
    required this.phone,
    this.password,
    this.image,
    this.notificationToken,
    this.roles,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] ?? 0,
        name: json["name"],
        lastName: json["lastname"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"] ?? '',
        image: json["image"] ?? '',
        notificationToken: json["notification_token"] ?? '',
        /*createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updateAt: json["update_at"] == null
            ? null
            : DateTime.parse(json["update_at"]),*/
        roles: json["roles"] == null
            ? []
            : List<Role>.from(json["roles"]!.map((x) => Role.fromJson(x))),
        //roles: json["roles"] != null ? List<Role>.from(json["roles"]!.map((x) => Role.fromJson(x))) : [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lastname": lastName,
        "email": email,
        "phone": phone,
        "password": password,
        "image": image,
        "notification_token": notificationToken,
        /* "created_at": createdAt?.toIso8601String(),
        "update_at": updateAt?.toIso8601String(),*/
        "roles": roles == null
            ? []
            : List<dynamic>.from(roles!.map((x) => x.toJson())),
      };
}
