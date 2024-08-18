final class User {
  final String id;
  final String name;
  final Avatar avatar;
  final String? banner;

  const User({
    required this.id,
    required this.name,
    required this.avatar,
    this.banner,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['_id'],
        avatar: Avatar.fromJson(json['avatar']),
        name: json['name'],
        banner: json['banner'],
      );
}

class Avatar {
  final String? url;
  final String? discordId;

  const Avatar({this.url, this.discordId});

  factory Avatar.fromJson(Map<String, dynamic> json) =>
      Avatar(discordId: json['discordId'], url: json['url']);
}
