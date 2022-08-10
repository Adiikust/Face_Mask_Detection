
import 'package:untitled1/Controller/export/export_all.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 13),
          child: Column(children:  [

             SizedBox(
               width: data.size.width * 0.30,
                height: data.size.height * 0.30,
                child: const Image(image: AssetImage("assets/mask-1.jpg",),)),
            const Text("Login",style: TextStyle(fontSize: 23,color: AppColors.kBlue),),
            const SizedBox(height: 12,),
            TextFormField(
            decoration: const InputDecoration(
              hintText: "Enter Email",
              labelText: "Email",
              prefixIcon: Icon(Icons.email_outlined),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
                borderRadius: BorderRadius.all(Radius.circular(13)),
              )


            ),
            )

          ]),
        ),

      ),
    );

  }
}
