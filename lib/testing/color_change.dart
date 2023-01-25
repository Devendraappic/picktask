import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _colorTween;
  // late Animation<Decoration> _imageTween;
  int _currentImage = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    _colorTween = ColorTween(begin: Colors.green, end: Colors.orange)
        .animate(_animationController);
    // _imageTween = DecorationTween(
    //   begin: BoxDecoration(
    //     image: DecorationImage(
    //       image: AssetImage('assets/images/logo.png'),
    //     ),
    //   ),
    //   end: BoxDecoration(
    //     image: DecorationImage(
    //       image: AssetImage('assets/images/sbi_logo.png'),
    //     ),
    //   ),
    // ).animate(_animationController);

    abc();
  }

  abc() {
    if (_animationController.status == AnimationStatus.completed) {
      _animationController.reverse();
      _currentImage = 0;
    } else {
      _animationController.forward();
      _currentImage = 1;
    }

    _currentImage = _currentImage == 0 ? 1 : 0;
    _animationController.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Container(
              color: _colorTween.value,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                // decoration: _imageTween.value,
                child: AnimatedContainer(
                  margin: EdgeInsets.all(100),
                  height: 200,
                  width: 200,
                  duration: Duration(seconds: 0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: _currentImage == 0
                          ? AssetImage('assets/images/red.png')
                          : AssetImage('assets/images/green.png'),
                      // fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 5,
                    ),
                    // height: 200,
                    // width: 200,
                    child: Center(
                      child: FadeTransition(
                        opacity: _animationController,
                        child: Image.asset(
                          _currentImage == 0
                              ? 'assets/images/green.png'
                              : 'assets/images/red.png',
                          key: ValueKey<int>(_currentImage),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// class MyNewApp extends StatefulWidget {
//   @override
//   _MyNewAppState createState() => _MyNewAppState();
// }

// class _MyNewAppState extends State<MyNewApp>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;

//   late Animation _colorTween;
//   int _currentImage = 0;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       duration: Duration(seconds: 2),
//       vsync: this,
//     );

//     _colorTween = ColorTween(begin: Colors.green, end: Colors.red)
//         .animate(_animationController);

//     abc();
//   }

//   abc() {
//     if (_animationController.status == AnimationStatus.completed) {
//       _animationController.reverse();
//       _currentImage = 0;
//     } else {
//       _animationController.forward();
//       _currentImage = 1;
//     }

//     _currentImage = _currentImage == 0 ? 1 : 0;
//     _animationController.forward(from: 0.0);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: AnimatedContainer(
//           duration: Duration(seconds: 10),
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: _currentImage == 0
//                   ? AssetImage('assets/images/sbi_logo.png')
//                   : AssetImage('assets/images/sbi_logo.png'),
//               // fit: BoxFit.cover,
//             ),
//           ),
//           child: Container(
//             height: double.infinity,
//             width: double.infinity,
//             child: Center(
//               child: FadeTransition(
//                 opacity: _animationController,
//                 child: Image.asset(
//                   _currentImage == 0
//                       ? 'assets/images/logo.png'
//                       : 'assets/images/sbi_logo.png',
//                   key: ValueKey<int>(_currentImage),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {});
//         },
//         child: Icon(Icons.refresh),
//       ),
//     );
//   }
// }
