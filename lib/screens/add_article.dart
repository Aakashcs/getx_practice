import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/controllers/article_controller.dart';
import 'package:getx_practice/models/article.dart';

import '../constants.dart';

class AddArticleScreen extends StatefulWidget {
  const AddArticleScreen({Key? key}) : super(key: key);

  @override
  State<AddArticleScreen> createState() => _AddArticleScreenState();
}

class _AddArticleScreenState extends State<AddArticleScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();

  final articleController = Get.put(ArticleController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Article"),
      ),
      body: Obx(
        () => articleController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      TextField(
                        controller: _titleController,
                        cursorColor: Colors.black,
                        style: TextStyle(color: Colors.black),
                        showCursor: true,
                        decoration: kTextFiledInputDecoration,
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: _bodyController,
                        cursorColor: Colors.black,
                        style: TextStyle(color: Colors.black),
                        showCursor: true,
                        decoration: kTextFiledInputDecoration.copyWith(
                            labelText: "Body"),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          final article = Article(
                              id: 0,
                              userId: 1,
                              title: _titleController.text,
                              body: _bodyController.text);
                          await articleController.addArticle(article);

                          showCupertinoDialog<void>(
                            context: context,
                            builder: (BuildContext context) =>
                                CupertinoAlertDialog(
                              title: const Text('Success'),
                              content:
                                  const Text("News article has been added."),
                              actions: <CupertinoDialogAction>[
                                CupertinoDialogAction(
                                  child: const Text('Ok'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            ),
                          );
                        },
                        child: Text("Add"),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(horizontal: 30)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
