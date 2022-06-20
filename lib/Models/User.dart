class RegisterRequest{
  String? id;
  String name;
  String email;
  String imgurl;
  RegisterRequest({required this.id,required this.name,required this.email,required this.imgurl});

  toMap(){
    return {
      'id': this.id,
      'name': this.name,
      'email': this.email,
      'imgurl': this.imgurl,
    };
  }
  factory RegisterRequest.fromMap(Map<String, dynamic> map) {
    return RegisterRequest(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      imgurl: map['imgurl'],
    );
  }
}
