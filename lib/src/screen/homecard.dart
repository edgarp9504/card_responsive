import 'package:flutter/material.dart';

class ResponsiveCards extends StatelessWidget {
  const ResponsiveCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      backgroundColor: Color(0xff212239),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Cards',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Colors.white),
            ),
            Expanded(
                child: AnimatedSwitcher(
              duration: Duration(seconds: 1),
              child: orientation == Orientation.portrait
                  ? ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return _CardItem(
                            color: Colors
                                .primaries[index % Colors.primaries.length]);
                      })
                  : GridView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return _CardItem(
                            color: Colors
                                .primaries[index % Colors.primaries.length]);
                      },
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 500,
                          childAspectRatio: 3 / 2,
                          crossAxisSpacing: 2,
                          mainAxisSpacing: 2),
                    ),
            ))
          ],
        ),
      ),
    );
  }
}

class _CardItem extends StatelessWidget {
  final Color color;
  const _CardItem({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 160,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [color.withOpacity(0.5), color]),
            borderRadius: BorderRadius.circular(20.0)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('\$15,872'),
              Spacer(),
              Text('4020 **** **** 2749'),
              Text('edgarPerez')
            ],
          ),
        ),
      ),
    );
  }
}
