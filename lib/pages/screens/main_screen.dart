import 'package:dompet_iq/pages/screens/chart_page.dart';
import 'package:dompet_iq/pages/screens/history_page.dart';
import 'package:dompet_iq/pages/screens/home_page.dart';
import 'package:dompet_iq/pages/screens/settings_page.dart';
import 'package:dompet_iq/pages/screens/transaction_page.dart';
import 'package:dompet_iq/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = "main";

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ChartPage(),
    TransactionPage(),
    HistoryPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(TransactionPage.routeName);
        },
        backgroundColor: petalRouge,
        shape: CircleBorder(),
        elevation: 8,
        child: Icon(Icons.add, color: whiteColor, size: 32),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        color: lightBlue,
        elevation: 10,
        shadowColor: Colors.black.withOpacity(0.1),
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home_filled, Icons.home_outlined, "Home", 0),
              _buildNavItem(
                Icons.bar_chart,
                Icons.bar_chart_outlined,
                "Chart",
                1,
              ),
              SizedBox(width: 48), // Space for the FAB
              _buildNavItem(
                Icons.history,
                Icons.history_outlined,
                "History",
                3,
              ),
              _buildNavItem(
                Icons.settings,
                Icons.settings_outlined,
                "Settings",
                4,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    IconData iconActive,
    IconData iconInactive,
    String label,
    int index,
  ) {
    final isActive = _currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedScale(
            scale: isActive ? 1.3 : 1.0,
            duration: Duration(milliseconds: 200),
            child: Icon(
              isActive ? iconActive : iconInactive,
              color: isActive ? petalRouge : greyText,
            ),
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: poppinsRegular12.copyWith(
              color: isActive ? petalRouge : greyText,
              fontWeight: isActive ? FontWeight.bold : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
