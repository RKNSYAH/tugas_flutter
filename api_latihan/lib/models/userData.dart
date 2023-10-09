class UserData {
  String? nama;
  String? email;
  int? userid;

  UserData({this.nama, this.email, this.userid});

  UserData.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    email = json['email'];
    userid = json['userid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama'] = this.nama;
    data['email'] = this.email;
    data['userid'] = this.userid;
    return data;
  }
}
