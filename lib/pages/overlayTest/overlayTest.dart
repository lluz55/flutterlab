import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class OverlayTest extends StatefulWidget {
  @override
  _OverlayTestState createState() => _OverlayTestState();
}

class _OverlayTestState extends State<OverlayTest> with RouteAware {
  GlobalKey _containerKey = GlobalKey();
  Size _containerSize = Size(0, 0);
  Offset _containerPosition = Offset(0, 0);

  OverlayEntry _overlayFloatBtn;
  LayerLink _layerLink = LayerLink();

  PageController _controller = PageController(viewportFraction: .9);
  final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  _afterLayoutCallback(_) {
    RenderBox _containerRender =
        _containerKey.currentContext.findRenderObject();
    setState(() {
      _containerSize = _containerRender.size;
      _containerPosition = _containerRender.localToGlobal(Offset.zero);
    });

    _overlayFloatBtn = _floatBtn();

    Overlay.of(context).insert(_overlayFloatBtn);
  }

  OverlayEntry _floatBtn() {
    return OverlayEntry(
      builder: (context) => Positioned(
        width: 50,
        height: 50,
        child: CompositedTransformFollower(
          link: _layerLink,
          offset: Offset(
              (_containerSize.width / 2) - 25, _containerSize.height - 25),
          showWhenUnlinked: false,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.orangeAccent,
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            child: Icon(
              Icons.arrow_drop_up,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayoutCallback);
    super.initState();
  }

  @override
  void dispose() {
    // routeObserver.unsubscribe(this);
    _overlayFloatBtn?.remove();
    super.dispose();
  }

  @override
  void didPop() {
    // _overlayFloatBtn?.remove();
    Toast.show('I poped', context);
    super.didPush();
  }

  @override
  void didChangeDependencies() {
    // routeObserver.subscribe(this, ModalRoute.of(context));

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CompositedTransformTarget(
        link: _layerLink,
        child: Container(
          key: _containerKey,
          constraints: BoxConstraints(
            maxHeight: 400,
            maxWidth: 360,
          ),
          child: PageView(
            controller: _controller,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  color: Colors.green[300],
                ),
              ),
              Container(
                color: Colors.red[800],
              )
            ],
          ),
        ),
      ),
    );
  }
}
