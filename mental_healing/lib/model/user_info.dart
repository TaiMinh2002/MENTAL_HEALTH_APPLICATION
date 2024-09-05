class UserInfo {
  final int? id;
  final String? username;
  final String? email;
  final int? status;
  final int? role;
  final String? avatar;
  final int? age;
  final int? gender;
  final int? sleep;
  final int? stress;
  final int? mood;
  final String? password;

  UserInfo({
    this.id,
    this.username,
    this.email,
    this.status,
    this.role,
    this.avatar,
    this.age,
    this.gender,
    this.sleep,
    this.stress,
    this.mood,
    this.password,
  });

  // Tạo phương thức để chuyển từ JSON sang đối tượng UserInfo
  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      status: json['status'],
      role: json['role'],
      avatar: json['avatar'],
      age: json['age'],
      gender: json['gender'],
      sleep: json['sleep'],
      stress: json['stress'],
      mood: json['mood'],
      password: json['password'],
    );
  }

  // Tạo phương thức để chuyển từ đối tượng UserInfo sang JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'status': status,
      'role': role,
      'avatar': avatar,
      'age': age,
      'gender': gender,
      'sleep': sleep,
      'stress': stress,
      'mood': mood,
      'password': password,
    };
  }
}
