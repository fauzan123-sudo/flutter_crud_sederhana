import 'package:flutter/material.dart';
import 'package:flutter_crud_sederhana/view/aktivitas/list_aktivitas.dart';
import 'package:flutter_crud_sederhana/view/berita/list_berita.dart';
import 'package:flutter_crud_sederhana/view/gaji/list_gaji.dart';
import 'package:flutter_crud_sederhana/view/lembur/list_lembur.dart';
import 'package:flutter_crud_sederhana/view/perizinan/list_perizinan.dart';
import 'package:flutter_crud_sederhana/view/reimbursement/list_reimbursement.dart';
import 'package:flutter_crud_sederhana/view/shift/list_shift.dart';
import 'package:flutter_svg/svg.dart';

class AllMenu extends StatefulWidget {
  const AllMenu({Key? key}) : super(key: key);

  @override
  State<AllMenu> createState() => _AllMenuState();
}

class _AllMenuState extends State<AllMenu> {
  final List<CardItem> _cards = [
    CardItem(
      icon: SvgPicture.asset(
        'assets/images/perizinan.svg',
        height: 35,
        width: 35,
      ),
      title: 'Perizinan',
      color: Colors.white,
      route: const ListPermissions(),
    ),
    CardItem(
      icon: SvgPicture.asset(
        'assets/images/lembur.svg',
        height: 35,
        width: 35,
      ),
      title: 'Lembur',
      color: Colors.white,
      route: const ListOvertime(),
    ),
    CardItem(
      icon: SvgPicture.asset(
        'assets/images/shift.svg',
        height: 35,
        width: 35,
      ),
      title: 'Shift',
      color: Colors.white,
      route: const ListShift(),
    ),
    CardItem(
      icon: SvgPicture.asset(
        'images/ic_salary.svg',
        height: 35,
        width: 35,
      ),
      title: 'Gaji',
      color: Colors.white,
      route: const ListSalary(),
    ),
    CardItem(
      icon: SvgPicture.asset(
        'images/ic_activity.svg',
        height: 35,
        width: 35,
      ),
      title: 'Aktivitas',
      color: Colors.white,
      route: const ListActivity(),
    ),
    CardItem(
      icon: SvgPicture.asset(
        'images/ic_news.svg',
        height: 35,
        width: 35,
      ),
      title: 'Berita',
      color: Colors.white,
      route: const ListNews(),
    ),
    CardItem(
      icon: SvgPicture.asset(
        'images/ic_reimbursement.svg',
        height: 35,
        width: 35,
      ),
      title: 'Reimbursement',
      color: Colors.white,
      route: const ListReimbursement(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE2EBF0),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffE2EBF0),
        iconTheme: const IconThemeData(color: Colors.black),
        // mengubah warna icon
        title: const Text('All Menu',
            style: TextStyle(color: Colors.black)), // mengubah warna teks
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          children: _cards,
        ),
      ),
    );
  }

  Card buildCard() {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              margin: const EdgeInsets.all(10),
              child: const Icon(Icons.account_circle_sharp)),
          const Text("data")
        ],
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.color,
    required this.route,
  }) : super(key: key);

  final Widget icon;
  final String title;
  final Color color;
  final Widget route;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => route),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon,
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}




class MyCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const MyCard({super.key, required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: imagePath.endsWith('.svg')
                ? SvgPicture.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
