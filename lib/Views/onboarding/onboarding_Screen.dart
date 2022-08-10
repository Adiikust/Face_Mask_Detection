

import 'package:untitled1/Controller/export/export_all.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
 List <PageViewModel> getPages() {
   return[
     PageViewModel(

       title: "Mask",
       image:Image.asset('assets/mask-2.jpg'),
       body: "Mask Detection",
     ),
     PageViewModel(
       title: " No Mask",
       image:Image.asset('assets/mask-3.png'),
       body: "Mask Detection",
     ),
     PageViewModel(
       title: "Mask Steps",
       image:Image.asset('assets/mask-4.png'),
       body: "Steps of Mask Detection",
     ),
   ];
 }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
    body: IntroductionScreen(
      done: const Text("Done",style: TextStyle(fontSize: 18,),),
      onDone: (){},


      onSkip: (){},
      skip: const Text("Skip",style: TextStyle(fontSize: 18,),),
      showSkipButton: true,


      next: const Text('Next',style: TextStyle(fontSize: 18,),),

      dotsDecorator: const DotsDecorator(
        size: Size.square(10.0),
        activeColor: AppColors.kDBlue,
        activeSize: Size.square(13.0),
        color: AppColors.kDark,
        spacing: EdgeInsets.symmetric(horizontal: 3.0),


      ),
      pages: getPages(),
    ),
    );
  }
}

