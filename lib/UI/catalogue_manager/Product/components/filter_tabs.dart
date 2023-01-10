import 'package:flutter/material.dart';

class MyTabbedPage extends StatefulWidget {
  const MyTabbedPage({Key? key, required this.tabs, required this.onTap})
      : super(key: key);
  final List<Tab> tabs;
  final VoidCallback onTap;
  @override
  _MyTabbedPageState createState() => _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTabbedPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: widget.tabs.length);
    _tabController!.addListener(() {
      print(_tabController!.index.toString());
    });
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 10,
          child: TabBar(
            controller: _tabController,
            tabs: widget.tabs,
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 5,
            child: TabBarView(
              controller: _tabController,
              children: widget.tabs.map((Tab tab) {
                return const Center(child: Text(""));
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
