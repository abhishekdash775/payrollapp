import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
	String? uid;
	String? name;
	String? email;
	String? address;

	UserModel({this.uid, this.name, this.email, this.address});

	factory UserModel.fromJson(Map<String, dynamic> json) {
		return _$UserModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
