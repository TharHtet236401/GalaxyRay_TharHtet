import 'user.dart';

class Post {
  int? id;
  String? body;
  String? title;
  String? image;
  int? likesCount;
  User? user;
  bool? selfLiked;
  bool? selfSaved;
  String? created_at;

  Post({
    this.id,
    this.body,
    this.title,
    this.image,
    this.likesCount,
    this.user,
    this.selfLiked,
    this.selfSaved,
    this.created_at,
  });

// map json to post model

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        id: json['id'],
        body: json['body'],
        title: json['title'],
        image: json['image'],
        likesCount: json['likes_count'],
        created_at: json['created_at'],
        selfLiked: json['likes'].length > 0,
        selfSaved: json['saves'].length>0,
        user: User(
            id: json['user']['id'],
            name: json['user']['name'],
            image: json['user']['image']));
  }
}
