import 'package:copy_bud/utils/utils.dart';
import 'package:copy_bud/widgets/drop_down_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/copy_model.dart';
import '../services/copy_service.dart';

class HeadlinePage extends StatefulWidget {
  const HeadlinePage({Key? key}) : super(key: key);

  @override
  State<HeadlinePage> createState() => _HeadlinePageState();
}

class _HeadlinePageState extends State<HeadlinePage> {
  CopyService copyService = CopyService();
  final TextEditingController promptController = TextEditingController();
  final TextEditingController prompt1Controller = TextEditingController();
  // final TextEditingController prompt2Controller = TextEditingController();
  final TextEditingController prompt3Controller = TextEditingController();

  String dropDown = 'regular';

  @override
  void dispose() {
    copyService;
    promptController;
    prompt1Controller;
    // prompt2Controller;
    prompt3Controller;
    print('dismissed');
    super.dispose();
  }

  Widget s = Container();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   appBar: AppBar(
      //     title: const Text('Headline'),
      //   ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const Text('Headline'),
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
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                margin: const EdgeInsets.all(
                  16,
                ),
                width: 200,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    elevation: 2,
                    // focusColor: Colors.white,
                    style: const TextStyle(
                      color: Colors.blue,
                    ),
                    isExpanded: true,
                    hint: dropDown == 'regular'
                        ? const Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Text('Select a tone'),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(dropDown),
                          ),
                    items: options.map((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        dropDown = newValue.toString();
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              // TextField(
              //   controller: prompt3Controller,
              //   keyboardType: TextInputType.number,
              //   decoration: const InputDecoration(
              //     hintText: 'output',
              //     border: InputBorder.none,
              //   ),
              // ),
              TextButton(
                onPressed: () {
                  var prompt = promptController.text;
                  var prompt1 = prompt1Controller.text;
                  var prompt2 = dropDown;
                  // int prompt3 = int.parse(prompt3Controller.text);

                  print(prompt2);

                  setState(() {
                    s = prompt.isNotEmpty && prompt1.isNotEmpty
                        ? FutureBuilder<CopyModel>(
                            future:
                                copyService.postApi(prompt, prompt1, prompt2),
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
                                    Text('HEADLINE: ${snapshot.data!.data1!}'),
                                    // const SizedBox(
                                    //   height: 9,
                                    // ),
                                    // SelectableText(
                                    //     'HEADLINE: ${snapshot.data!.data2!}'),
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
