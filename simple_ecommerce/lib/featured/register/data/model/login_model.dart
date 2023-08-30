class LoginModel {
  LoginModel({this.message, this.token});
  String? message;
  String? token;

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      LoginModel(message: json['message'], token: json['token']);
}
