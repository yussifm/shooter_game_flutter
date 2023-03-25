import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:shooter_game_flutter/screens/game_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  bool isVolume = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceH = MediaQuery.of(context).size.height;
    final double deviceW = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: deviceH,
        width: deviceW,
        decoration: BoxDecoration(color: Colors.yellow[600]),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/opponent.png",
                width: 200,
                height: 200,
              ),
              const Text(
                "Space Shooter",
                style: TextStyle(
                  fontSize: 32,
                  fontFamily: "Permanent Marker",
                  height: 2,
                ),
              ),
              SizedBox(
                height: deviceH * 0.3,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GameScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: deviceW * 0.4,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 2,
                        color: Colors.black,
                      ),
                    ),
                    child: const Text(
                      "Play",
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: "Permanent Marker",
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isVolume != isVolume;
                      });
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2,
                          color: isVolume ? Colors.green : Colors.black,
                        ),
                      ),
                      child: Icon(
                        isVolume
                            ? Icons.volume_down_outlined
                            : Icons.volume_off_outlined,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
