import 'package:edamkar_1/pages/Artikel.dart';
import 'package:edamkar_1/style/app_style.dart';
import 'package:flutter/material.dart';

class AppMenu extends StatefulWidget {
  const AppMenu({super.key});

  @override
  State<AppMenu> createState() => _AppMenuState();
}

class _AppMenuState extends State<AppMenu> {
  var _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_filled,
            color: black2,
          ),
          label: 'Beranda',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.history,
            color: black2,
          ),
          label: 'Riwayat',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.edit_document,
            color: black2,
          ),
          label: 'Laporan',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.article_rounded,
            color: black2,
          ),
          label: 'Artikel',
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTap,
    );
  }

  void _onItemTap(int index) {
    setState(() {
      this._selectedIndex = index;
      switch (_selectedIndex) {
        case 0:
          Navigator.pushNamed(context, '/homepage');
          break;
        case 1:
          Navigator.pushNamed(context, '/riwayatlapp');
          break;
        case 2:
          Navigator.pushNamed(context, '/artikel');
          break;
        case 3:
          Navigator.pushNamed(context, '/artikel');
          break;
        default:
          Navigator.pushNamed(context, '/homepage');
      }
    });
  }
}
