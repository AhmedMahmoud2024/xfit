import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:xfit/screens/mvp/login_model.dart';
class APIService{

  Future<LoginResponseModel> login(LoginRequestModel requestModel) async{
    String url="https://x-fit-backend-graduation-project.vercel.app/api/v1/user/login";
    final response=await http.post(url as Uri ,body:requestModel.toJson());
    if(response.statusCode ==200 || response.statusCode ==400){
      return LoginResponseModel.fromJson(json.decode(response.body));
    }
    else{
      throw Exception("Failed to load data");
    }
  }
}