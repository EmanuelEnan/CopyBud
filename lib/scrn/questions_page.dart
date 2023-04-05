import 'package:copy_bud/services/questions_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/copy_model.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({Key? key}) : super(key: key);

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  final questionsService = QuestionsService();
  final TextEditingController promptController = TextEditingController();
  final TextEditingController prompt1Controller = TextEditingController();

  @override
  void dispose() {
    questionsService;
    promptController;
    prompt1Controller;

    print('dismissed');
    super.dispose();
  }

  Widget s = Container();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   appBar: AppBar(
      //     title: const Text('Questions'),
      //   ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const Text('Questions'),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: prompt1Controller,
                // maxLines: 3,
                decoration: const InputDecoration(
                  hintText: 'product name',
                  border: InputBorder.none,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: promptController,
                maxLines: 4,
                decoration: const InputDecoration(
                  hintText:
                      'short product description(e.g: A spicy flavored biscuit with the blend of potato and herbs. Can be eaten as an afternoon snacks and in leisure times.)',
                  border: InputBorder.none,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const SizedBox(
                height: 8,
              ),
              TextButton(
                onPressed: () {
                  var prompt = promptController.text;
                  var prompt1 = prompt1Controller.text;

                  setState(() {
                    s = prompt.isNotEmpty && prompt1.isNotEmpty
                        ? FutureBuilder<CopyModel>(
                            future: questionsService.postApi(prompt, prompt1),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            Clipboard.setData(ClipboardData(
                                                    text:
                                                        snapshot.data!.data1!))
                                                .then(
                                              (_) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    duration: Duration(
                                                      milliseconds: 500,
                                                    ),
                                                    content: Text('Copied'),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.copy_rounded,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(snapshot.data!.data1!),
                                  ],
                                );
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            })
                        : const Text('Please provide some information');
                  });
                },
                child: const Text('Compose'),
              ),
              const SizedBox(
                height: 15,
              ),
              s,
            ],
          ),
        ),
      ),
    );
  }
}
