import 'package:http/http.dart' as http;
import 'package:project_3s_mobile/models/api_request.dart';
import 'package:project_3s_mobile/models/api_response.dart';
import 'package:project_3s_mobile/models/entities/quiz.dart';
import 'package:project_3s_mobile/utils/constants.dart';

class QuizLoader {
  Future<List<Quiz>> load() async {
    const String _url = APIConstants.API_BASE_URL + APIRoutes.GET_QUESTIONS;
    http.Response _response = await ApiRequest().apiGetRequest(_url);
    final _questionList = ApiResponse().handleQuestionsResponse(_response);
    try {
      final quizzes = (_questionList as List)
          .map<Quiz>(
              (dynamic json) => Quiz.fromJson(json as Map<String, dynamic>))
          .toList();
      return (quizzes..shuffle());
    } catch (error) {
      print(error);
      return null;
    }
  }
}
