class Pengaduan {
  String? idPengaduan;
  String? tglPengaduan;
  String? nik;
  String? isiLaporan;
  String? status;
  String? url;
  String? foto;
  String? updatedAt;
  String? createdAt;

  Pengaduan(
      {this.idPengaduan,
      this.tglPengaduan,
      this.nik,
      this.isiLaporan,
      this.status,
      this.url,
      this.foto,
      this.updatedAt,
      this.createdAt});

  Pengaduan.fromJson(Map<String, dynamic> json) {
    idPengaduan = json['id_pengaduan'];
    tglPengaduan = json['tgl_pengaduan'];
    nik = json['nik'];
    isiLaporan = json['isi_laporan'];
    status = json['status'];
    url = json['url'];
    foto = json['foto'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_pengaduan'] = this.idPengaduan;
    data['tgl_pengaduan'] = this.tglPengaduan;
    data['nik'] = this.nik;
    data['isi_laporan'] = this.isiLaporan;
    data['status'] = this.status;
    data['url'] = this.url;
    data['foto'] = this.foto;
    data['updatedAt'] = this.updatedAt;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
