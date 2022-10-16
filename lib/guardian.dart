library guardian;

import 'package:flutter/material.dart';
import 'package:guardian/constant.dart';

class Guardian extends StatefulWidget {
  final dynamic doomsday;
  final Widget child;
  final bool showLogo;

  const Guardian(
      {Key? key,
      required this.doomsday,
      required this.child,
      this.showLogo = true})
      : super(key: key);

  @override
  State<Guardian> createState() => _GuardianState();
}

class _GuardianState extends State<Guardian> {
  bool isOutdated = false;

  @override
  void initState() {
    doom();
    super.initState();
  }

  void doom() {
    var doomsday = DateTime.now();
    if (widget.doomsday is DateTime) {
      doomsday = widget.doomsday;
    } else if (widget.doomsday is String) {
      doomsday = DateTime.tryParse(widget.doomsday)!;
    } else {
      throw ArgumentError.value(widget.doomsday);
    }

    setState(() {
      isOutdated = doomsday.isBefore(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isOutdated) {
      return Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: widget.showLogo,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Image.network(
                  logoUrl,
                  width: logoSize,
                  height: logoSize,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(messageColor),
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      );
    }
    return widget.child;
  }
}
