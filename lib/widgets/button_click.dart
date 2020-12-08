import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonClick extends StatefulWidget {
  final bool isLoading;

  final bool autoWidth;

  final String title;

  final TextStyle titleStyle;

  final Widget icon;

  final VoidCallback onPressed;

  ButtonClick({
    @required this.onPressed,
    @required this.title,
    @required this.titleStyle,
    @required this.icon,
    this.autoWidth = false,
    this.isLoading = false,
  });

  @override
  _ButtonClickState createState() => _ButtonClickState();
}

class _ButtonClickState extends State<ButtonClick> {
  GlobalKey key = GlobalKey();

  double width = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox renderBox = key.currentContext.findRenderObject();
      setState(() {
        width = renderBox.size.width + 40;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      height: 45,
      minWidth: widget.autoWidth ? width : MediaQuery.of(context).size.width,
      shape: StadiumBorder(),
      color: Color(0xff5F41B2),
      disabledColor: Color(0xff5F41B2),
      onPressed: !widget.isLoading ? widget.onPressed : null,
      child: widget.isLoading
          ? SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(backgroundColor: Colors.white))
          : Row(
              key: key,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                widget.icon != null ? widget.icon : SizedBox(),
                Text(widget.title, style: widget.titleStyle),
              ],
            ),
    );
  }
}
