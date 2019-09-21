import 'package:flutter/material.dart';
import 'package:project_3s_mobile/models/model.dart';
import 'package:project_3s_mobile/pages/quiz_page/selections.dart';
import 'package:provider/provider.dart';

import 'model.dart';
import 'progress.dart';
import 'question.dart';
import 'result_presenter.dart';

class QuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => Model(
        quizLoader: Provider.of<QuizLoader>(context, listen: false),
      ),
      child: const _Page(),
    );
  }
}

class __PageState extends State<_Page> {
  static const double _horizontalMargin = 16;
  final _resultPresenter = ResultPresenter();

  Model get _model => Provider.of<Model>(context, listen: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Quiz'),
      ),
      body: _buildBody(),
    );
  }

  @override
  void initState() {
    super.initState();

    _model.answered.listen((correct) {
      _resultPresenter.show(context, model: _model, correct: correct);
    });
  }

  Widget _buildBody() {
    final model = Provider.of<Model>(context);
    return SafeArea(
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: model.quizListLoaded
            ? _buildQuiz()
            : Center(child: const CircularProgressIndicator()),
      ),
    );
  }

  Widget _buildQuiz() {
    return Column(
      children: [
        const Progress(),
        const Divider(
          indent: _horizontalMargin,
          endIndent: _horizontalMargin,
          height: 0,
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(_horizontalMargin),
            physics: const AlwaysScrollableScrollPhysics(),
            child: const Question(),
          ),
        ),
        const Padding(
          child: Selections(),
          padding: EdgeInsets.symmetric(horizontal: _horizontalMargin),
        ),
      ],
    );
  }
}

class _Page extends StatefulWidget {
  const _Page({Key key}) : super(key: key);

  @override
  __PageState createState() => __PageState();
}
