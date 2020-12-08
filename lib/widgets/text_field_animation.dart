import 'package:flutter/material.dart';

class TextFieldAnimation extends StatefulWidget {

  final String hintText;

  final FocusNode myFocusNode;

  final FormFieldSetter<String> onSaved;

  final FormFieldValidator<String> validator;

  final Icon prefixIcon;

  final Icon suffixIcon;

  TextFieldAnimation(this.hintText, {
    @required this.myFocusNode,
    @required this.validator,
    @required this.onSaved,
    @required this.prefixIcon,
    this.suffixIcon
  });

  @override
  _TextFieldAnimationState createState() => _TextFieldAnimationState();
}

class _TextFieldAnimationState extends State<TextFieldAnimation> with SingleTickerProviderStateMixin{

  Animation<double> _animation;
  AnimationController _controller;

  bool obscureText = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: Duration(milliseconds: 500), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.myFocusNode.addListener(() {
      if (!widget.myFocusNode.hasFocus) {
        _controller.reset();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        TextFormField(
          focusNode: widget.myFocusNode,
          onTap: () {
            _controller.forward();
          },
          obscureText: obscureText,
          decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: Color(0xffB2B3D2),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 22.0),
                child: widget.prefixIcon,
              ),
              suffixIcon: widget.suffixIcon != null
                  ? InkWell(
                      onTap: () => setState(() => obscureText = !obscureText),
                      child: widget.suffixIcon
                    )
                  : SizedBox(),
              fillColor: Colors.transparent,
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 0.5,
                      color: Color(0xffB2B3D2)
                  )
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 0.5,
                      color: Color(0xffB2B3D2)
                  )
              )
          ),
          validator: widget.validator,
          onSaved: widget.onSaved
        ),
        AnimatedBuilder(
            animation: _animation,
            builder: (context,child) {
              return Positioned(
                left: 48 - _animation.value * 48,
                top: 10 - _animation.value * 20,
                child: Visibility(
                  child: Text(
                    widget.hintText,
                    style: TextStyle(
                        color: Color(0xffB2B3D2),
                        fontSize: 14
                    ),
                  ),
                  visible: widget.myFocusNode.hasFocus,
                ),
              );
            }
        )
      ],
    );
  }
}
