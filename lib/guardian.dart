library guardian;

import 'package:flutter/material.dart';
import 'package:guardian/constant.dart';
import 'package:http/http.dart' as http;

class Guardian extends StatefulWidget {
  final Widget child;
  final dynamic doomsday;
  final bool showLogo;
  final String logoUrl;
  final double logoSize;
  final String message;
  final Color messageColor;
  final String configUrl;

  const Guardian(
      {Key? key,
      required this.doomsday,
      required this.child,
      this.showLogo = true,
      this.logoUrl = defaultLogoUrl,
      this.logoSize = defaultLogoSize,
      this.message = defaultMessage,
      this.messageColor = defaultMessageColor,
      this.configUrl = defaultConfigUrl})
      : super(key: key);

  @override
  State<Guardian> createState() => _GuardianState();
}

class _GuardianState extends State<Guardian> {
  bool isOutdated = false;

  @override
  void initState() {
    doom();
    getConfigs();
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

  Future<http.Response> getConfigs() async {
    http.Response response = await http.get(Uri.parse(widget.configUrl));
    print(response.body);
    return response;
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
                  widget.logoUrl,
                  width: widget.logoSize,
                  height: widget.logoSize,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                widget.message,
                style: TextStyle(
                  fontSize: 16,
                  color: widget.messageColor,
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
