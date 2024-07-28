import 'package:ecommerce/core/constants/constants.dart';
import 'package:ecommerce/data/auth/register/model/RegisterRequest.dart';
import 'package:http/http.dart' as http;

class RegisterDataSource {
  Future<http.Response> register(String name, String email, String password,
      String rePassword, String phone) async {
    // https://ecommerce.routemisr.com/api/v1/auth/signup
    Uri uri = Uri.https(Constants.baseUrl, Constants.registerApi);
    RegisterRequest registerRequestBody = RegisterRequest(
        name: name,
        email: email,
        phone: phone,
        password: password,
        rePassword: rePassword);

    var response = await http.post(uri, body: registerRequestBody.toJson());
    return response;
  }
}
