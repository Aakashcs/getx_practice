import 'package:flutter/cupertino.dart';

class SingleButtonAlert extends StatelessWidget {
  const SingleButtonAlert({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: CupertinoButton(
          onPressed: () {},
          child: const Text('CupertinoAlertDialog'),
        ),
      ),
    );
  }
}
