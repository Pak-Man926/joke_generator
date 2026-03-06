import "package:flutter/material.dart";

class HomeView extends StatelessWidget
{
  const HomeView({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar:AppBar(
        title: const Text("Random Joke Generator"),
        centerTitle: true,
      ),
      body: SizedBox.expand(
        child: Stack(
          alignment: Alignment.center,
          children:[
            const SelectableText(
              "What kind of bagel can fly? \n\n" "A plain bagel!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize:24)
            ),
            Positioned(
              bottom: 20,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Get another joke"),
              ),
            ),
          ],
        ),
      ),
    );
  }


}