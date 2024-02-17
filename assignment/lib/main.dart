import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'user_detail_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Discovery App',
      // theme: ThemeData(
      //   primarySwatch: Colors.black,
      // ),
      home: DiscoveryPage(),
    );
  }
}

class DiscoveryPage extends StatefulWidget {
  @override
  _DiscoveryPageState createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  final String apiUrl = "https://reqres.in/api/users";
  List<dynamic> items = [];
  int page = 1;
  int limit = 10;
  bool isLoading = false;
  bool isLoadingMore = false; // Separate loading state for loading more items
  bool isEndOfList = false;

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchItems();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (!isLoadingMore && !isEndOfList) {
          fetchMoreItems();
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> fetchItems() async {
    setState(() {
      isLoading = true;
    });
    final response =
        await http.get(Uri.parse('$apiUrl?page=$page&per_page=$limit'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        isLoading = false;
        items.addAll(data['data']);
        page++;
        if (data['data'].isEmpty) {
          isEndOfList = true;
        }
      });
    } else {
      // Error handling
      setState(() {
        isLoading = false;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Failed to load data. Please try again later."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> fetchMoreItems() async {
    setState(() {
      isLoadingMore = true;
    });
    final response =
        await http.get(Uri.parse('$apiUrl?page=$page&per_page=$limit'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        isLoadingMore = false;
        items.addAll(data['data']);
        page++;
        if (data['data'].isEmpty) {
          isEndOfList = true;
        }
      });
    } else {
      // Error handling
      setState(() {
        isLoadingMore = false;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Failed to load more data. Please try again later."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  void _navigateToUserDetail(Map<String, dynamic> user) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserDetailPage(user: user),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Discovery"),
        backgroundColor: Colors.black54,
      ),
      body: Padding(
    padding: EdgeInsets.all(10.0),
    child:
      Column(
        children: [
          Expanded(
            child: GridView.builder(
              controller: _scrollController,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 0.75,
              ),
              itemCount: items.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index < items.length) {
                  return GestureDetector(
                    onTap: () {
                      _navigateToUserDetail(items[index]);
                    },
                    child: Hero(
                      tag: 'cards',
                    // AnimatedOpacity(
                    //   duration: Duration(milliseconds: 500),
                    //   opacity: isLoading ? 0.0 : 1.0,
                      child:Card(
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                              ),
                              child: Image.network(
                                items[index]['avatar'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${items[index]['first_name']} ${items[index]['last_name']}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  items[index]['email'] ?? '',
                                  style: TextStyle(fontSize: 14.0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    ),
                  );
                } else {
                  if (isEndOfList) {
                    return Container(
                      padding: EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: Text("End of List"),
                    );
                  } else {
                    if (isLoadingMore) {
                      return Container(
                        padding: EdgeInsets.all(16.0),
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      // This indicates that more items are being loaded
                      
                      return SizedBox.shrink();
                    }
                  }
                }
              },
            ),
          ),
          if (isLoading)
            Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
        ],
      ),
      ),
    );
  }
}
