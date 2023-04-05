import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/copy_model.dart';
import '../services/marketing_service.dart';

class MarketingIdeasPage extends StatefulWidget {
  const MarketingIdeasPage({Key? key}) : super(key: key);

  @override
  State<MarketingIdeasPage> createState() => _MarketingIdeasPageState();
}

class _MarketingIdeasPageState extends State<MarketingIdeasPage> {
  MarketingService marketingService = MarketingService();
  final TextEditingController promptController = TextEditingController();

  Widget s = Container();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   appBar: AppBar(
      //     title: const Text('Marketing Ideas'),
      //   ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const Text('Marketing Ideas'),
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
              TextButton(
                onPressed: () {
                  var prompt = promptController.text;

                  setState(() {
                    s = prompt.isNotEmpty
                        ? FutureBuilder<CopyModel>(
                            future: marketingService.postApi(prompt),
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
                                    Text(
                                      'MARKETING IDEAS:${snapshot.data!.data1!}',
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
