import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255,187,178,200),
      body: SizedBox.expand(
        
          // width: double.infinity,
          child: Column(
            children: [
              // Logo bölümü
                Expanded(
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Image.asset(
                    'images/logo.webp',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              
            
              //CircularProgressIndicator(),
             InkWell(
              onTap: () => context.go("/home"),
  child: SizedBox(
    width: 350,
    child: DotLottieLoader.fromAsset(
      "motions/animation1.lottie",
      frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
        if (dotlottie != null) {
          return Lottie.memory(dotlottie.animations.values.single);
        } else {
          return Container();
        }
      },
    ),
  ),
),

            
            
            SizedBox(height: 20)
            
            
            
            
            
            
            ],


          ),
        ),
      );
    
  }

}