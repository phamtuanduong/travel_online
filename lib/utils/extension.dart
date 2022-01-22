import 'package:oktoast/oktoast.dart';
import 'package:flutter/material.dart';

extension NullableObjectExt on Object? {
  Map<String, dynamic> toMap() {
    return this as Map<String, dynamic>;
  }
}

extension NullableStringExt on String? {
  toast({int code = 0}) async {
    showToastWidget(Builder(
      builder: (BuildContext context) {
        var bgc = Colors.green.shade300;
        var textColor = Colors.black54;
        if (code == 1) {
          bgc = Colors.redAccent;
          textColor = Colors.white;
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    bgc,
                    bgc.withOpacity(0.87),
                  ],
                ),
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.024),
                    offset: const Offset(0, 1),
                    blurRadius: 3.0,
                    spreadRadius: 3.0,
                  ),
                ],
              ),
              child: Text(
                this!,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        );
      },
    ));
  }
}
