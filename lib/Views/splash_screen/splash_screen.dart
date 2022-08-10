
import 'package:untitled1/Controller/export/export_all.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

 /* void initState() {
    super.initState();
    const SplashScreen();
  }*/

  /*Timer ( const Duration( seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => const LoginScreen()));
    });*/
  @override
  Widget build(BuildContext context) {

    final data = MediaQuery.of(context);
    return  Scaffold(
      backgroundColor: AppColors.kWhite,
      body: Center(
        child: SizedBox(
          height: data.size.height * 0.35,
          width: data.size.width * 0.35,
          child:Image.asset(AssetsPath.klogo),
        ),
      ),

    );
  }
}


