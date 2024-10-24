import 'package:e_commerce/configs/themes/main_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReadMoreWidget extends StatefulWidget {
  final String text;
  final int trimLength;

  const ReadMoreWidget({super.key, required this.text, this.trimLength = 200});

  @override
  State<ReadMoreWidget> createState() => _ReadMoreWidgetState();
}

class _ReadMoreWidgetState extends State<ReadMoreWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final displayText = _isExpanded || widget.text.length < widget.trimLength
        ? widget.text
        : '${widget.text.substring(0, widget.trimLength)}...';

    return RichText(
      text: TextSpan(
        text: displayText,
        style: TextStyle(
          color: MainColor.darkGrey,
          fontSize: 13.sp,
          fontFamily: 'sf reguler',
        ),
        children: [
          if (widget.text.length > widget.trimLength) TextSpan(
            text: _isExpanded ? ' Read Less' : ' Read More',
            style: TextStyle(
              color: MainColor.black,
              fontSize: 13.sp,
              fontFamily: 'sf reguler',
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
          ),
        ],
      ),
    );
  }
}
