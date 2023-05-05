import 'package:animeniac/features/auth/domain/entites/user_data.dart';

class UserModel extends UserData {
  UserModel({
    name = "",
    email = "",
    uid = "",
  }) : super(name: name, email: email, uid: uid);

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['uid'] = uid;
    return data;
  }
}
