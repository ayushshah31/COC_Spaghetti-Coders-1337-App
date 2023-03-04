import 'package:coc_app/UI/home.dart';
import 'package:coc_app/UI/profile.dart';
import 'package:coc_app/UI/swap.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

class BottomBarStart extends StatefulWidget {
  const BottomBarStart({Key? key}) : super(key: key);

  @override
  State<BottomBarStart> createState() => _BottomBarStartState();
}

class _BottomBarStartState extends State<BottomBarStart> {
  int _selectedIndex = 0;

  late List<Widget> pages ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pages = [
      const HomePage(),
      const Swap(),
      const ProfilePage()
      // const KYC(),
      // const Income(),
      // const Profile()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff141332),
      body: SafeArea(child: pages[_selectedIndex]),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _selectedIndex,
      //   backgroundColor: Color(0xff6359E9),
      //   selectedItemColor: Colors.white,
      //   unselectedItemColor: Colors.grey,
      //   onTap: (curentIndex){
      //     setState(() {
      //       _selectedIndex = curentIndex;
      //     });
      //   },
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.home),
      //       label: 'home'
      //     ),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.wallet),
      //         label: 'Income'
      //     ),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.person),
      //         label: 'profile'
      //     ),
      //
      //   ],
      // ),
      bottomNavigationBar: MoltenBottomNavigationBar(
        selectedIndex: _selectedIndex,
        borderRaduis: BorderRadius.circular(10),
        domeHeight: 25,
        margin: EdgeInsets.all(10),
        barColor: Color(0xff232630),
        borderSize: 5,
        domeCircleColor: Color(0xff4fbcd3),
        curve: Curves.easeOutQuart,
        tabs: [
          MoltenTab(
              icon: Icon(Icons.home),
            selectedColor: Colors.white,
            title: Text("Home",style: GoogleFonts.poppins(color: Colors.white),)
          ),
          MoltenTab(
              icon: Icon(Icons.wallet),
              selectedColor: Colors.white,
              title: Text("Transfer",style: GoogleFonts.poppins(color: Colors.white),),
          ),
          MoltenTab(
              icon: Icon(Icons.person),
            selectedColor: Colors.white,
            title: Text("Profile",style: GoogleFonts.poppins(color: Colors.white),),
          )
        ],
        onTabChange: (currentIndex){
          setState(() {
            _selectedIndex = currentIndex;
          });
        },
      ),
    );
  }
}
