import 'package:aplikasi_pelaporan/pages/editMasyarakat.dart';
import 'package:aplikasi_pelaporan/pages/editPengaduan.dart';
import 'package:aplikasi_pelaporan/pages/editPetugas.dart';
import 'package:aplikasi_pelaporan/pages/editTanggapan.dart';
import 'package:aplikasi_pelaporan/pages/listMasyarakat.dart';
import 'package:aplikasi_pelaporan/pages/listPetugas.dart';
import 'package:aplikasi_pelaporan/pages/pagePengaduan.dart';
import 'package:aplikasi_pelaporan/pages/pageTanggapan.dart';
import 'package:aplikasi_pelaporan/pages/tambahMasyarakat.dart';
import 'package:aplikasi_pelaporan/pages/tambahPengaduan.dart';
import 'package:aplikasi_pelaporan/pages/tambahPetugas.dart';
import 'package:aplikasi_pelaporan/pages/tambahTanggapan.dart';
import 'package:get/get.dart';

List<GetPage> router = [
  GetPage(name: "/", page: () => const ListMasyarakatScreen()),
  GetPage(name: "/tambah", page: () => const TambahMasyarakatScreen()),
  GetPage(name: "/edit", page: () => const EditMasyarakat()),
  GetPage(name: "/petugas", page: () => const ListPetugas()),
  GetPage(name: "/tambahPetugas", page: () => const TambahPetugas()),
  GetPage(name: "/editPetugas", page: () => const EditPetugas()),
  GetPage(name: "/pengaduan", page: () => const PagePengaduan()),
  GetPage(name: "/tambahPengaduan", page: () => const TambahPengaduan()),
  GetPage(name: "/editPengaduan", page: () => const EditPengaduan()),
  GetPage(name: "/tanggapan", page: () => const PageTanggapan()),
  GetPage(name: "/tambahTanggapan", page: () => const TambahTanggapan()),
  GetPage(name: "/editTanggapan", page: () => const EditTanggapan()),
];
