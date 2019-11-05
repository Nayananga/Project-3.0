/*
 * Copyright 2018 Harsh Sharma
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

class APIConstants {
  static const String OCTET_STREAM_ENCODING = "application/octet-stream";
  static const String API_BASE_URL = "https://95270c7d.ngrok.io";
}

class APIOperations {
  static const String LOGIN = "login";
  static const String SUCCESS = "success";
  static const String FAILURE = "failure";
}

class APIResponseCode {
  static const int SC_OK = 200;
}

class APIRoutes {
  static const String GET_HELP = "/";
  static const String GET_STATUS = "/status";
  static const String GET_ONE_REVIEW = "/api/v1/reviews/"; // [{id}]
  static const String SEARCH_REVIEW = "/api/v1/reviews/search/"; // [{query}]
  static const String CREATE_REVIEW = "/api/v1/reviews";
  static const String UPDATE_REVIEW = "/api/v1/reviews/"; // [{id}]
  static const String DELETE_REVIEW = "/api/v1/reviews/"; // [{id}]
  static const String LOGIN_USER = "/api/v1/users/login";
  static const String GET_ONE_USER = "/api/v1/users/getoneuser";
  static const String UPDATE_USER = "/api/v1/users/updateuser";
  static const String GET_ONE_COMPLAINTS = "/api/v1/complaints/"; // [{id}]
  static const String SEARCH_COMPLAINTS = "/api/v1/complaints/search/"; // [{query}]
  static const String CREATE_COMPLAINTS = "/api/v1/complaints";
  static const String UPDATE_COMPLAINTS = "/api/v1/complaints/"; // [{id}]
  static const String DELETE_COMPLAINTS = "/api/v1/complaints/"; // [{id}]
  static const String GET_HOTELS = "/api/v1/hotels";

}

class EventConstants {
  static const int NO_INTERNET_CONNECTION = 0;
  static const int LOGIN_USER_SUCCESSFUL = 500;
  static const int LOGIN_USER_UN_SUCCESSFUL = 501;
  static const int USER_REGISTRATION_SUCCESSFUL = 502;
  static const int USER_REGISTRATION_UN_SUCCESSFUL = 503;
}

class ProgressDialogTitles {
  static const String IN_PROGRESS = "In Progress...";
  static const String USER_LOG_IN = "Logging In...";
  static const String USER_CHANGE_PASSWORD = "Changing...";
}

class SharedPreferenceKeys {
  static const String USER_LOGGED_ID_TOKEN = "USER_LOGGED_ID_TOKEN";
  static const String USER = "USER";
}

class SnackBarText {
  static const String NO_INTERNET_CONNECTION = "No Internet Conenction";
  static const String LOGIN_SUCCESSFUL = "Login Successful";
  static const String LOGIN_UN_SUCCESSFUL = "Login Un Successful";
  static const String REGISTER_SUCCESSFUL = "Register Successful";
  static const String REGISTER_UN_SUCCESSFUL = "Register Un Successful";
}
