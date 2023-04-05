import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_bud/services/ad_AIDA_service.dart';
import 'package:copy_bud/utils/utils.dart';
import 'package:copy_bud/widgets/drop_down_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/copy_model.dart';

class AdAIDAPage extends StatefulWidget {
  const AdAIDAPage({Key? key}) : super(key: key);

  @override
  State<AdAIDAPage> createState() => _AdAIDAPageState();
}

class _AdAIDAPageState extends State<AdAIDAPage> {
  final adAidaService = AdAIDAService();
  final TextEditingController promptController = TextEditingController();
  final TextEditingController prompt1Controller = TextEditingController();
  // final TextEditingController prompt2Controller = TextEditingController();
  final TextEditingController prompt3Controller = TextEditingController();

  String dropDown = 'regular';

  @override
  void dispose() {
    adAidaService;
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
      //     title: const Text('AIDA Copy'),
      //   ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const Text('AIDA Copy'),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: prompt1Controller,
                // maxLines: 3,
                decoration: const InputDecoration(
                  hintText: 'product name(e.g: Copy Buddy)',
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

                  print(prompt2);

                  setState(() {
                    s = prompt.isNotEmpty && prompt1.isNotEmpty
                        // & FirebaseFirestore.instance.collection('usersData').where("permission", isEqualTo: permission).get() == true
                        ? FutureBuilder<CopyModel>(
                            future:
                                adAidaService.postApi(prompt, prompt1, prompt2),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                // List<String> para = snapshot.data!.data1!.split(
                                //     "Attention:|Interest:|Desire:|Action");
                                // List<Text> sectionWidgets = [];
                                // for (int i = 0; i < para.length; i++) {
                                //   sectionWidgets.add(Text(para[i]));
                                // }
                                String paragraph = snapshot.data!.data1!;

                                int attentionIndex =
                                    paragraph.indexOf("Attention:");
                                int interestIndex =
                                    paragraph.indexOf("Interest:");
                                int desireIndex = paragraph.indexOf("Desire:");
                                int actionIndex = paragraph.indexOf("Action:");

                                String attention = "";
                                String interest = "";
                                String desire = "";
                                String action = "";

                                if (attentionIndex != -1) {
                                  attention = paragraph.substring(
                                      attentionIndex, interestIndex);
                                }

                                if (interestIndex != -1) {
                                  interest = paragraph.substring(
                                      interestIndex,
                                      (desireIndex != -1
                                          ? desireIndex
                                          : paragraph.length));
                                }

                                if (desireIndex != -1) {
                                  desire = paragraph.substring(
                                      desireIndex,
                                      (actionIndex != -1
                                          ? actionIndex
                                          : paragraph.length));
                                }

                                if (actionIndex != -1) {
                                  action = paragraph.substring(actionIndex);
                                }

                                String quote =
                                    '$attention \n $interest \n $desire \n $action';
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // for (int i = 0; i < paragraph.length; i++)
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            Clipboard.setData(
                                              ClipboardData(text: quote),
                                            ).then(
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
                                    Text(attention),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(interest),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(desire),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(action),
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
