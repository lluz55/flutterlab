import 'package:flutter/material.dart';
import 'package:flutter_lab/services/fcService.dart';
import 'package:provider/provider.dart';

class FloatContainerWrapper extends StatelessWidget {
  final Widget child;

  FloatContainerWrapper({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          child,
          Positioned(
            left: 100,
            top: 100,
            child: StreamBuilder(
              stream: FcService.stm,
              builder: (context, snapshot) {
                if (snapshot != null && snapshot.hasData) {
                  return Container(
                    color: Colors.blue[100],
                    child: Center(
                      child: Text(
                        'data: ${snapshot.data}',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class FloatContainer extends StatelessWidget {
  final bool show;
  final Widget child;
  final Offset position;

  FloatContainer(
      {@required this.show,
      @required this.child,
      this.position = const Offset(0, 0)});

  @override
  Widget build(BuildContext context) {
    print(show);
    FloatContainerProvider fcProvider =
        Provider.of<FloatContainerProvider>(context);
    show ? fcProvider.show() : fcProvider.hide();
    fcProvider.setFloatContainer(child: child, position: position);
    return SizedBox();
  }
}

class FloatContainerProvider extends ChangeNotifier {
  Widget _floatContainer;
  Offset _containerPosition = Offset(0, 0);
  bool _showContainer = false;

  get floatContainer => _floatContainer;
  get containerPosition => _containerPosition;
  get showContainer => _showContainer;

  void show() {
    assert(floatContainer != null);
    _showContainer = true;
    notifyListeners();
  }

  void hide() {
    _showContainer = false;
    notifyListeners();
  }

  void toggle() {
    _showContainer = !showContainer;
    notifyListeners();
  }

  void setFloatContainer({
    @required Widget child,
    Offset position = const Offset(0, 0),
  }) {
    _containerPosition = position;
    _floatContainer = child;
    notifyListeners();
  }
}
