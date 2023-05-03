import 'package:animeniac/features/auth/domain/entites/user_data.dart';

class UserModel extends UserData {
  UserModel({
    name = "",
    email = "",
    uid = "",
  }) : super(name: name,
    email: email,uid:uid);



  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = Map<String,dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['uid'] = this.uid;
    return data;

  }
}
