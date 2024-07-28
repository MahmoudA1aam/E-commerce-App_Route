import 'Error.dart';

/// statusMsg : "fail"
/// message : "Account Already Exists"

class RegisterErrorResponse {
  RegisterErrorResponse({this.statusMsg, this.message, this.errors});

  RegisterErrorResponse.fromJson(dynamic json) {
    statusMsg = json['statusMsg'];
    message = json['message'];
    errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
  }

  String? statusMsg;
  String? message;
  Errors? errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusMsg'] = statusMsg;
    map['message'] = message;
    map['errors'] = errors;
    return map;
  }
}
