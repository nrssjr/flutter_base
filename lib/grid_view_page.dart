import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GridViewPage extends StatefulWidget {
  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  int _columnsCount = 2;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              setState(() {
                if (_columnsCount < 10) {
                  _columnsCount++;
                }
              });
            },
            heroTag: 'grid_on',
            child: const Icon(
              Icons.grid_on,
              color: Colors.white,
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                if (_columnsCount > 1) {
                  _columnsCount--;
                }
              });
            },
            heroTag: 'grid_off',
            child: const Icon(
              Icons.grid_off,
              color: Colors.white,
            ),
          ),
          FloatingActionButton(
            onPressed: () {},
            heroTag: 'arrow_upward',
            child: const Icon(
              Icons.arrow_upward,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ]),
        body: GridView.builder(
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index) => Container(
            color: Colors.black,
            child: Center(
              child: Text(index.toString(),
                  style: const TextStyle(
                    fontSize: 42,
                    color: Colors.white,
                  )),
            ),
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _columnsCount,
              crossAxisSpacing: 1,
              mainAxisSpacing: 6),
        ));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
