import 'dart:ui';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:project_if22a/config/asset.dart';
import 'package:project_if22a/screen/admin/list_mahasiswa.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Asset.colorPrimary,
              borderRadius: BorderRadius.all(
                Radius.circular(10)
              )
            ),
            child: const Image(
              image: AssetImage('assets/images/header_uti.jpg'),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 25, bottom: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton('KRS', Icons.description, 0),
                    IconButton('KHS', Icons.assessment, 0),
                    IconButton('Transkrip', Icons.assignment, 0),
                    IconButton('Jadwal', Icons.calendar_month, 0),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton('PKL', Icons.work, 0),
                    IconButton('Magang', Icons.engineering, 0),
                    IconButton('Skripsi', Icons.book, 0),
                    IconButton('Mahasiswa', Icons.people, 0),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            alignment: Alignment.topLeft,
            child: const Text("Berita Terkini", style: TextStyle(
              color: Asset.colorPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 18
            )),
          ),
          SizedBox(
            height: 170,
            child: ListView(
              children: [
                CarouselSlider(
                  items: [
                    BeritaTerkini(
                      'https://lampung.rilis.id/image/2024/04/28dfjCcAe_WhatsAppImage2024-04-28at07.41.26.jpeg', 
                      'Universitas Teknokrat Indonesia Menjadi Pelopor Transformasi Digital bagi Generasi Muda', 
                      '28 April 2024'
                    ),
                    BeritaTerkini(
                      'https://lampung.rilis.id/image/2024/04/29mtj2OD8_WhatsAppImage2024-04-29at09.12.20.jpeg', 
                      'Universitas Teknokrat Indonesia Borong Penghargaan Pemilihan Muli Mekhanai', 
                      '29 April 2024'
                    ),
                    BeritaTerkini(
                      'https://lampung.rilis.id/image/2024/04/28jbRjVVh_MahasiswaTeknokratmagangdiDiskominfoPesawaran.jpg', 
                      'Mahasiswa Teknokrat Magang dan Studi Independen Bersertifikat di Diskominfotiksan Pesawaran', 
                      '28 April 2024'
                    ),
                    BeritaTerkini(
                      'https://lampung.rilis.id/image/2024/04/25sQid5Y9_IMG-20240425-WA0089.jpg', 
                      'Dosen FEB Universitas Teknokrat Raih Gelar Doktor Peminatan Ilmu Akuntansi', 
                      '25 April 2024'
                    ),
                    BeritaTerkini(
                      'https://lampung.rilis.id/image/2024/04/255pcWp3c_WhatsAppImage2024-04-25at10.36.20.jpeg', 
                      'Mahasiswa PMM Universitas Teknokrat Pelajari Budaya Lampung di Pulau Pahawang', 
                      '25 April 2024'
                    ),
                  ], 
                  options: CarouselOptions(
                    height: 170,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16/9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    viewportFraction: 0.8
                  )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class IconButton extends StatelessWidget {
  final String nameLabel;
  final IconData iconLabel;
  final int index;

  IconButton(this.nameLabel, this.iconLabel, this.index);

  final List<Map> _fragment = [
    {'title': 'Data Mahasiswa', 'view': const ListMahasiswa()}
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // margin: EdgeInsets.only(bottom: 5),
            child: Material(
              borderRadius: const BorderRadius.all(
                Radius.circular(40),
              ),
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(40),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => _fragment[index]['view'],
                    )
                  );
                },
                child: Container(
                  // margin: EdgeInsets.all(5),
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                    color: Asset.colorPrimary,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Stack(
                      children: [
                        Icon(
                          iconLabel,
                          color: Colors.white,
                          size: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Text(
              nameLabel,
              style: const TextStyle(fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}

class BeritaTerkini extends StatelessWidget {
  final String img;
  final String judul;
  final String tanggal;

  BeritaTerkini(this.img, this.judul, this.tanggal);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  image: NetworkImage(img),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                  colors: [
                    Asset.colorPrimaryDark,
                    Colors.transparent,
                  ],
                  end: Alignment.topCenter,
                  begin: Alignment.bottomCenter,
                  stops: [0.1, 0.9],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    judul,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    tanggal,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      // alignment: Alignment(1, 1),
    );
  }
}