// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_3s_mobile/models/api_request.dart';
import 'package:project_3s_mobile/models/api_response.dart';
import 'package:project_3s_mobile/models/entities/hotel.dart';
import 'package:project_3s_mobile/models/hotel_loader.dart';
import 'package:project_3s_mobile/pages/pre_quiz_page.dart';
import 'package:project_3s_mobile/utils/constants.dart';

List<Hotel> _hotels;

class SearchDemo extends StatefulWidget {
  @override
  _SearchDemoState createState() => _SearchDemoState();
}

class _ResultCard extends StatelessWidget {
  final Hotel hotel;
  final SearchDelegate<Hotel> searchDelegate;

  const _ResultCard({this.hotel, this.searchDelegate});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        searchDelegate.close(context, hotel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(hotel.hotelName),
              Text(
                hotel.hotelAddress,
                style: theme.textTheme.headline.copyWith(fontSize: 72.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchDemoSearchDelegate extends SearchDelegate<Hotel> {
  final List<String> _data = _hotels.map<String>((Hotel i) {
    return i.hotelName;
  }).toList();
  final List<String> _history = <String>[
    'Hotel1',
    'Hotel2',
    'Hotel3',
    'Hotel4',
    'Hotel5'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      if (query.isNotEmpty)
        IconButton(
          tooltip: 'Clear',
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
            showSuggestions(context);
          },
        ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final String searched = query;
    if (searched == null) {
      return Center(
        child: Text(
          '"$query"\n is not a valid integer between 0 and 100,000.\nTry again.',
          textAlign: TextAlign.center,
        ),
      );
    }

    return ListView(
      children: <Widget>[
        _ResultCard(
          hotel: _hotels.singleWhere((Hotel i) => i.hotelName == searched),
          searchDelegate: this,
        ),
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final Iterable<String> suggestions = query.isEmpty
        ? _history
        : _data.where((String i) => '$i'.startsWith(query));

    return _SuggestionList(
      query: query,
      suggestions: suggestions.map<String>((String i) => '$i').toList(),
      onSelected: (String suggestion) {
        query = suggestion;
        showResults(context);
      },
    );
  }
}

class _SearchDemoState extends State<SearchDemo> {
  bool _isLoaded = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  _SearchDemoSearchDelegate _delegate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text('Find Hotel'),
        ),
        body: _buildBody());
  }

  @override
  initState() {
    super.initState();
    _getHotels();
  }

  Widget _buildBody() {
    return SafeArea(
      child: AnimatedSwitcher(
        duration: Duration(seconds: 1),
        child: _isLoaded
            ? _buildBodyAfterGettingHotels()
            : Center(child: const CircularProgressIndicator()),
      ),
    );
  }

  Widget _buildBodyAfterGettingHotels() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        MergeSemantics(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonTheme(
                    minWidth: 150.0,
                    height: 50.0,
                    child: RaisedButton(
                      color: Colors.green,
                      shape: StadiumBorder(),
                      onPressed: () async {
                        _delegate = _SearchDemoSearchDelegate();
                        await showSearch<Hotel>(
                          context: context,
                          delegate: _delegate,
                        ).then((Hotel hotel) {
                          if (hotel != null) {
                            _goToQuizPage();
                          }
                        });
                      },
                      child: Text(
                        "Search",
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  _getHotels() async {
    const String _url = APIConstants.API_BASE_URL + APIRoutes.GET_HOTELS;
    http.Response _response = await ApiRequest().apiGetRequest(_url);
    final List _results = ApiResponse().handleSearchResponse(_response);
    final HotelLoader _hotelLoader = HotelLoader(_results);
    _hotels = _hotelLoader.load();
    if (mounted) {
      setState(() {
        _isLoaded = true;
      });
    }
  }

  _goToQuizPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PreQuizPage()),
    );
  }
}

class _SuggestionList extends StatelessWidget {
  final List<String> suggestions;
  final String query;
  final ValueChanged<String> onSelected;

  const _SuggestionList({this.suggestions, this.query, this.onSelected});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int i) {
        final String suggestion = suggestions[i];
        return ListTile(
          leading: query.isEmpty ? const Icon(Icons.history) : const Icon(null),
          title: RichText(
            text: TextSpan(
              text: suggestion.substring(0, query.length),
              style:
                  theme.textTheme.subhead.copyWith(fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                  text: suggestion.substring(query.length),
                  style: theme.textTheme.subhead,
                ),
              ],
            ),
          ),
          onTap: () {
            onSelected(suggestion);
          },
        );
      },
    );
  }
}
