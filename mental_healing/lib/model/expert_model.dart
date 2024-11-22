class ExpertModel {
  final int id;
  final String name;
  final int specialization;
  final String bio;
  final String contactInfo;
  final String phoneNumber;
  final String avatar;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  final String specializationString;

  ExpertModel({
    required this.id,
    required this.name,
    required this.specialization,
    required this.bio,
    required this.contactInfo,
    required this.phoneNumber,
    required this.avatar,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.specializationString,
  });

  factory ExpertModel.fromJson(Map<String, dynamic> json) {
    return ExpertModel(
      id: json['id'],
      name: json['name'],
      specialization: json['specialization'],
      bio: json['bio'],
      contactInfo: json['contact_info'],
      phoneNumber: json['phone_number'],
      avatar: json['avatar'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      specializationString: json['specialization_string'],
    );
  }
}
