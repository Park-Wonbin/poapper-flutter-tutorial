import 'package:flutter/material.dart';

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: Hero(
          tag: 'buttonHero',
          child: SelectionButton(),
        ),
      ),
    );
  }
}

class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _navigateAndDisplaySelection(context);
      },
      child: Text('Touch!'),
    );
  }

  // SelectionScreen을 띄우고 navigator.pop으로부터 결과를 기다리는 메서드
  _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push는 Future를 반환합니다. Future는 선택 창에서
    // Navigator.pop이 호출된 이후 완료될 것입니다.
    final result = await Navigator.pushNamed(context, SecondRoute.routeName, arguments: ScreenArguments(
      'Extract Arguments Screen',
      'This message is extracted in the build method.',
    ),);

    // 선택 창으로부터 결과 값을 받은 후, 이전에 있던 snackbar는 숨기고 새로운 결과 값을
    // 보여줍니다.
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("$result")));
  }
}

class SecondRoute extends StatelessWidget {
  static const routeName = '/second';

  @override
  Widget build(BuildContext context) {

    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Column(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Hero(
                    tag: 'buttonHero',
                    child: RaisedButton(
                      onPressed: () {
                        // "Yep" 문자열과 함께 이전 화면으로 돌아갑니다...
                        Navigator.pop(context, 'Yep!');
                      },
                      child: Text('Yep!'),
                    ),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () {
                      // "Nope" 문자열과 함께 이전 화면으로 돌아갑니다.
                      Navigator.pop(context, 'Nope!');
                    },
                    child: Text('Nope.'),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 15, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(text: 'title: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '${args.title}\n'),
                    TextSpan(text: 'message:', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '${args.message}')
                  ]
                ),
            ),
          )
        ],
      )
    );
  }
}

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}