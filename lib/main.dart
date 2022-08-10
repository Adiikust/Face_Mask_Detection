
import 'package:untitled1/Controller/export/export_all.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mask Detection',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}
