
import 'package:form_field_validator/form_field_validator.dart';
import 'package:untitled1/Controller/export/export_all.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({Key? key}) : super(key: key);

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final _formKey = GlobalKey<FormState>();
  var email ="";
  final emailController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    final data =MediaQuery.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    width: data.size.width * 0.30,
                    height: data.size.height * 0.30,
                    child: const Image(image: AssetImage("assets/mask-1.jpg"),),),

                  const Text("Forgot Password", style: TextStyle(fontSize: 23,
                      color: AppColors.kBlue,
                      fontWeight: FontWeight.bold),),

                  SizedBox(height: data.size.height * 0.04),
                  TextFormField(
                    decoration:  const InputDecoration(
                      hintText: "Enter email",
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(13)),
                      ),
                    ),
                    obscureText: true,
                    controller: emailController,
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Please enter your Email'),
                      EmailValidator(errorText: 'Please enter Valida Email'),
                    ]),
                  ),

                  SizedBox(height: data.size.height * 0.04),
                  GestureDetector(
                    onTap: (){
                      if(_formKey.currentState!.validate()) {
                        setState((){
                          email=emailController.text.trim();
                        });

                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: data.size.height * 0.07,
                      alignment: Alignment.center,
                      color: AppColors.kBlue,
                      child: const Text("Forgot Password",
                          style: TextStyle(fontSize: 17,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                  SizedBox(height: data.size.height * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildAutoSizeText(Text: "Goto?"),
                      TextButton(onPressed: () {
                        Navigator.pop(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
                      },
                        child: buildAutoSizeText(Text: "Login"),),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


