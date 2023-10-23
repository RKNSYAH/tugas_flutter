import 'package:aplikasi_pelaporan/pages/editMasyarakat.dart';
import 'package:aplikasi_pelaporan/pages/editPetugas.dart';
import 'package:aplikasi_pelaporan/pages/listMasyarakat.dart';
import 'package:aplikasi_pelaporan/pages/listPetugas.dart';
import 'package:aplikasi_pelaporan/pages/tambahMasyarakat.dart';
import 'package:aplikasi_pelaporan/pages/tambahPetugas.dart';
import 'package:get/get.dart';

List<GetPage> router = [
  GetPage(name: "/", page: () => const ListMasyarakatScreen()),
  GetPage(name: "/tambah", page: () => const TambahMasyarakatScreen()),
  GetPage(name: "/edit", page: () => const EditMasyarakat()),
  GetPage(name: "/petugas", page: () => const ListPetugas()),
  GetPage(name: "/tambahPetugas", page: () => const TambahPetugas()),
  GetPage(name: "/editPetugas", page: () => const EditPetugas()),
];
