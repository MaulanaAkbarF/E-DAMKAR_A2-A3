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
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black.withOpacity(.30),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'beranda',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'Riwayat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.edit_document),
          label: 'Laporan',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.edit_document),
          label: 'Laporan',
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
        default:
          Navigator.pushNamed(context, '/homepage');
      }
    });
  }
}
