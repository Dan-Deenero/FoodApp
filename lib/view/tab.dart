import 'package:flutter/material.dart';

class TabbedPage extends StatefulWidget {
  @override
  _TabbedPageState createState() => _TabbedPageState();
}

class _TabbedPageState extends State<TabbedPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
    _animation =
        Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabbed Page'),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _onTabTapped(0);
                  },
                  child: _buildTab(0),
                ),
                GestureDetector(
                  onTap: () {
                    _onTabTapped(1);
                  },
                  child: _buildTab(1),
                ),
                GestureDetector(
                  onTap: () {
                    _onTabTapped(2);
                  },
                  child: _buildTab(2),
                ),
              ],
            ),
          ),
          Expanded(
            child: _buildTabContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(int index) {
    return Container(
      decoration: BoxDecoration(
        border: _selectedIndex == index
            ? null
            : Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.scale(
            scale: 1 + (_animation.value * 0.3),
            child: child,
          );
        },
        child: Text(
          'Tab ${index + 1}',
          style: TextStyle(
            color: _selectedIndex == index ? Colors.blue : Colors.black,
            fontWeight:
            _selectedIndex == index ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_selectedIndex) {
      case 0:
        return const Center(
          child: Text('Tab 1 content'),
        );
      case 1:
        return const Center(
          child: Text('Tab 2 content'),
        );
      case 2:
        return const Center(
          child: Text('Tab 3 content'),
        );
      default:
        return Container();
    }
  }

  void _onTabTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
      _animationController.reset();
      _animationController.forward();
    }
  }
}
