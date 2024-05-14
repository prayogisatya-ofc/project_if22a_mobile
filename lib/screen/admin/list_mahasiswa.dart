import 'package:flutter/material.dart';
import 'package:project_if22a/config/asset.dart';

class ListMahasiswa extends StatefulWidget {
  const ListMahasiswa({super.key});

  @override
  State<ListMahasiswa> createState() => _ListMahasiswaState();
}

class _ListMahasiswaState extends State<ListMahasiswa> {

  List<Map<String, String>> mahasiswaList = [
    {"nama": "Prayogi Setiawan", "npm": "22312009"},
    {"nama": "Faiz Akbar Putra Wardani", "npm": "22312005"},
    {"nama": "M. Arif Martadinata", "npm": "22312010"},
    {"nama": "Restu Anggia Putra", "npm": "22312013"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        title: const Text(
          "Data Mahasiswa", 
          style: TextStyle(
            color: Colors.white
          )
        ),
        backgroundColor: Asset.colorPrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white,),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            itemCount: mahasiswaList.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(
                    mahasiswaList[index]['nama']!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  subtitle: Text(
                    mahasiswaList[index]['npm']!,
                    style: const TextStyle(
                      fontSize: 14
                    ),
                  ),
                  trailing: PopupMenuButton(
                    itemBuilder: (BuildContext context) {
                      return [
                        const PopupMenuItem(
                          value: "edit",
                          child: ListTile(
                            leading: Icon(Icons.edit),
                            title: Text("Edit"),
                          ),
                        ),
                        const PopupMenuItem(
                          value: "hapus",
                          child: ListTile(
                            leading: Icon(Icons.delete),
                            title: Text("Hapus"),
                          ),
                        )
                      ];
                    },
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}