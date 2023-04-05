import 'dart:convert';

import 'package:copy_bud/utils/utils.dart';
import 'package:copy_bud/widgets/drop_down_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/copy_model.dart';
import '../services/ad_copy_service.dart';

class AdCopyPage extends StatefulWidget {
  const AdCopyPage({Key? key}) : super(key: key);

  @override
  State<AdCopyPage> createState() => _AdCopyPageState();
}

class _AdCopyPageState extends State<AdCopyPage> {
  AdCopyService adCopyService = AdCopyService();

  final TextEditingController promptController = TextEditingController();
  final TextEditingController prompt1Controller = TextEditingController();
  // final TextEditingController prompt2Controller = TextEditingController();

  String dropDown = 'regular';
  // bool isSelected = true;

  @override
  void dispose() {
    adCopyService;
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
      //     title: const Text('AD Copy'),
      //   ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const Text('Traditional Ad Copy'),
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
              TextButton(
                onPressed: () {
                  var prompt = promptController.text;
                  var prompt1 = prompt1Controller.text;
                  var prompt2 = dropDown;
        
                  debugPrint(prompt2);
        
                  setState(() {
                    s = prompt.isNotEmpty &&
                            prompt1.isNotEmpty &&
                            prompt2.isNotEmpty
                        ? FutureBuilder<CopyModel>(
                            future:
                                adCopyService.postApi(prompt, prompt1, prompt2),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                List<String> arr = snapshot.data!.data1!
                                    .split(RegExp(r'(?<=[.!?])\s'));
        
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Text(
                                    //   'BODY: ${snapshot.data!.data1!}',
                                    // ),
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
        
                                    Text(
                                      'HOOK: ${arr[0]}?',
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      'BODY: ${arr.sublist(1, arr.length - 1).join(' ')}',
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      'CALL-TO-ACTION: ${arr[arr.length - 1]}',
                                    ),
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
