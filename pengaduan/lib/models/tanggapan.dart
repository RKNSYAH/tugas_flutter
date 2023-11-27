class Tanggapan {
  String? idTanggapan;
  String? tglTanggapan;
  String? tanggapan;
  String? idPengaduan;
  String? idPetugas;
  String? createdAt;
  String? updatedAt;

  Tanggapan(
      {this.idTanggapan,
      this.tglTanggapan,
      this.tanggapan,
      this.idPengaduan,
      this.idPetugas,
      this.createdAt,
      this.updatedAt});

  Tanggapan.fromJson(Map<String, dynamic> json) {
    idTanggapan = json['id_tanggapan'];
    tglTanggapan = json['tgl_tanggapan'];
    tanggapan = json['tanggapan'];
    idPengaduan = json['id_pengaduan'];
    idPetugas = json['id_petugas'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_tanggapan'] = this.idTanggapan;
    data['tgl_tanggapan'] = this.tglTanggapan;
    data['tanggapan'] = this.tanggapan;
    data['id_pengaduan'] = this.idPengaduan;
    data['id_petugas'] = this.idPetugas;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
