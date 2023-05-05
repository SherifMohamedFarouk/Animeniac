import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  final String name;
  final String email;
  final String uid;
  final String password;

  const UserData({
    this.name = "",
    this.email = "",
    this.uid = "",
    this.password = "",
  });
  @override
  // TODO: implement props
  List<Object?> get props => [name, email, uid, password];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['uid'] = uid;
    return data;
  }
}
