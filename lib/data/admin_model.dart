import 'package:json_annotation/json_annotation.dart';
part 'admin_model.g.dart';

@JsonSerializable()
class AdminModel {
   List<dynamic> menu;
   final String time;

   AdminModel({required this.menu,required this.time});

   factory AdminModel.fromJson(Map<String,dynamic> json) => _$AdminModelFromJson(json);

   Map<String,dynamic> toJson() => _$AdminModelToJson(this);

}