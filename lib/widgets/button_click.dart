import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonClick extends StatefulWidget {
  final bool isLoading;

  final bool autoWidth;

  final bool isRoundButton;

  final String title;

  final Widget icon;

  final VoidCallback onPressed;

  ButtonClick({
    @required this.onPressed,
    @required this.title,
    @required this.icon,
    this.isRoundButton = false,
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(28)),
        side: BorderSide(
          color: widget.isRoundButton ? Color(0xff5F41B2): Color(0xff5F41B2),
          width: 1
        )
      ),
      color: widget.isRoundButton ? Colors.transparent : Color(0xff5F41B2),
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
                Text(widget.title.toUpperCase(), style: TextStyle(
                    color: widget.isRoundButton ? Color(0xff5F41B2) : Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                )),
              ],
            ),
    );
  }
}
