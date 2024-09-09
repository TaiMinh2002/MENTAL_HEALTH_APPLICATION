class ForumModel {
  final int? id;
  final String? title;
  final String? description;
  final String? coverImage;
  final int? memberCount;
  final int? postCount;
  final String? createdUserName;

  ForumModel({
    this.id,
    this.title,
    this.description,
    this.coverImage,
    this.memberCount,
    this.postCount,
    this.createdUserName,
  });

  factory ForumModel.fromJson(Map<String, dynamic> json) {
    return ForumModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      coverImage: json['cover_image'],
      memberCount: json['member_count'],
      postCount: json['post_count'],
      createdUserName: json['created_user_name'],
    );
  }
}
