class LoginModel {
  String name;
  String lastName;
  String email;
  String password;
  bool keepOn;

  LoginModel({this.name, this.lastName, this.email, this.password, this.keepOn});

  LoginModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    keepOn = json['keepOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['keepOn'] = this.keepOn;
    return data;
  }

  String toString() {
    return "Name: ${this.name} \nLast Name: ${this.lastName} \nEmail: ${this.email} \nPassword: ${this.password}";
  }
}
