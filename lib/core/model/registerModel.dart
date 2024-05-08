import 'dart:convert';

// To parse this JSON data, do
//
//     final registerModel = registerModelFromMap(jsonString);


RegisterModel registerModelFromMap(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToMap(RegisterModel data) => json.encode(data.toMap());

class RegisterModel {
  final String status;
  final List<Message> message;

  RegisterModel({
    required this.status,
    required this.message,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        status: json["status"],
        message:
            List<Message>.from(json["Message"].map((x) => Message.fromJson(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "Message": List<dynamic>.from(message.map((x) => x.toMap())),
      };
}

class Message {
  final String name;
  final String email;
  final String vehicle;
  final String mobile;
  final String address1;
  final String address2;
  final String pincode;
  final String city;
  final String state;
  final String country;

  Message({
    required this.name,
    required this.email,
    required this.vehicle,
    required this.mobile,
    required this.address1,
    required this.address2,
    required this.pincode,
    required this.city,
    required this.state,
    required this.country,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        name: json["name"],
        email: json["email"],
        vehicle: json["vehicle"],
        mobile: json["mobile"],
        address1: json["address_1"],
        address2: json["address_2"],
        pincode: json["pincode"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "vehicle": vehicle,
        "mobile": mobile,
        "address_1": address1,
        "address_2": address2,
        "pincode": pincode,
        "city": city,
        "state": state,
        "country": country,
      };
      
}


