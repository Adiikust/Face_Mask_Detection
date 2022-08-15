
import 'package:untitled1/Controller/export/export_all.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final data =MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Face Mask Detection"),
      ),
      body: Column(
        children:  [
          SizedBox(
            width: data.size.width * 0.03,
            height:data.size.height * 0.09,
            child: const Text("Detection"),
          ),
          Container(
            width: double.infinity,
            height: data.size.height * 0.07,
            alignment: Alignment.center,
            color: AppColors.kBlue,
            child: const Text("Camera",
                style: TextStyle(fontSize: 17,
                  fontWeight: FontWeight.bold,
                )),
          ),
          const SizedBox(height: 3),
          Container(
            width: double.infinity,
            height: data.size.height * 0.07,
            alignment: Alignment.center,
            color: AppColors.kBlue,
            child: const Text("Gallery",
                style: TextStyle(fontSize: 17,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ],
      )
    );
  }
}
