import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'api.dart';

class CreatePage extends StatelessWidget {

  final titleCtl = TextEditingController();
  final contentCtl = TextEditingController();
  final passwordCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("게시글 작성하기"),
      ),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CupertinoTextField(
                controller: titleCtl,
                placeholder: "Title",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CupertinoTextField(
                controller: contentCtl,
                placeholder: "Content",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CupertinoTextField(
                controller: passwordCtl,
                obscureText: true,
                placeholder: "Password",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CupertinoButton.filled(
                onPressed: () {
                  if (titleCtl.text == "" || contentCtl.text == "" || passwordCtl.text == "") {
                    showCupertinoDialog(context: context, builder: (context) => CupertinoAlertDialog(
                      title: Text("공백"),
                      content: Text("빈칸을 모두 채워주세요!"),
                      actions: [
                        CupertinoDialogAction(
                          isDefaultAction: true,
                          child: Text("확인"),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ));
                  } else {
                    Provider.of<RestClient>(context, listen: false).createFeed(
                        CreateFeed(title: titleCtl.text,
                            content: contentCtl.text,
                            password: passwordCtl.text))
                        .then((value) => Navigator.pop(context));
                  }
                },
                child: Text("완료"),
              ),
            )
          ],
        )
      ),
    );
  }
}
