import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:joke_generator/joke.dart";

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Random Joke Generator"),
        centerTitle: true,
      ),
      body: SafeArea(
        bottom: true,
        child: SizedBox.expand(
          child: Consumer(
            builder: (context, ref, child) {
              final randomJoke = ref.watch(randomJokeProvider);
              return Stack(
                alignment: Alignment.center,
                children: [
                  if (randomJoke.isRefreshing)
                    const Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: LinearProgressIndicator(),
                    ),
                  switch (randomJoke) {
                    AsyncValue(:final value?) => SelectableText(
                      "${value.setup} \n\n ${value.punchline}",
                      textAlign: .center,
                      style: const TextStyle(fontSize: 24),
                    ),
                    AsyncValue(error: != null) => const Text(
                      "Error fetching joke",
                    ),
                    AsyncValue() => CircularProgressIndicator(),
                  },
                  Positioned(
                    bottom: 20,
                    child: ElevatedButton(
                      onPressed: () => ref.invalidate(randomJokeProvider),
                      child: const Text("Get another joke"),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
