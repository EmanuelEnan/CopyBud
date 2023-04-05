import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/copy_model.dart';
import '../services/bullet_points_service.dart';

class BulletPointsPage extends StatefulWidget {
  const BulletPointsPage({Key? key}) : super(key: key);

  @override
  State<BulletPointsPage> createState() => _BulletPointsPageState();
}

class _BulletPointsPageState extends State<BulletPointsPage> {
  final bulletPointsService = BulletPointsService();
  final TextEditingController promptController = TextEditingController();
  final TextEditingController prompt1Controller = TextEditingController();

  @override
  void dispose() {
    bulletPointsService;
    promptController;
    prompt1Controller;

    debugPrint('dismissed');
    super.dispose();
  }

  Widget s = Container();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   appBar: AppBar(
      //     title: const Text('Bullet Points'),
      //   ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const Text('Bullet Points'),
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
                            future:
                                bulletPointsService.postApi(prompt, prompt1),
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
