import 'package:flutter/material.dart';
import 'package:flutter_application_7/Fournisseur/persistent_tab_item.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class _PersistentBottomBarScaffoldState
    extends State<PersistentBottomBarScaffold> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
      
        if (widget.items[_selectedTab].navigatorkey?.currentState?.canPop() ??
            false) {
          widget.items[_selectedTab].navigatorkey?.currentState?.pop();
          return false;
        } else {
        
          return true;
        }
      },
      child: Scaffold(
        extendBody: true,
       
        body: IndexedStack(
          index: _selectedTab,
          children: widget.items
              .map((page) => Navigator(
             
                    key: page.navigatorkey,
                    onGenerateInitialRoutes: (navigator, initialRoute) {
                      return [
                        MaterialPageRoute(builder: (context) => page.tab)
                      ];
                    },
                  ))
              .toList(),
        ),


     bottomNavigationBar: CurvedNavigationBar(
  index: _selectedTab,
  backgroundColor: Colors.white,
  color: Colors.deepPurple,
  onTap: (index) {
    setState(() {
      _selectedTab = index;
    });
  },
  items: widget.items.map((item) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(item.icon),
          Text(item.title),
        ],
      ),
    );
  }).toList(),
),

      ),
    );
  }
}

class PersistentBottomBarScaffold extends StatefulWidget {

  final List<PersistentTabItem> items;

  const PersistentBottomBarScaffold({Key? key, required this.items})
      : super(key: key);

  @override
  State<PersistentBottomBarScaffold> createState() =>
      _PersistentBottomBarScaffoldState();
}
