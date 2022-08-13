
import 'package:form_field_validator/form_field_validator.dart';
import 'package:untitled1/Controller/export/export_all.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  var email ="";
  var password ="";
  final emailController =TextEditingController();
  final passwordController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            //controller: controller, // Optional
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
              child: Form(
                key: _formKey,
                child: Column(children: [
                  SizedBox(
                      width: data.size.width * 0.35,
                      height: data.size.height * 0.35,
                      child: const Image(
                        image: AssetImage("assets/mask-1.jpg",),)),
                  const Text("Login", style: TextStyle(fontSize: 23,
                      color: AppColors.kBlue,
                      fontWeight: FontWeight.bold),),
                  SizedBox(height: data.size.height * 0.04),
                  //form
                  TextFormField(
                    decoration:  const InputDecoration(
                     hintText: "Enter email",
                      labelText: "Email",
                      errorStyle: TextStyle(color: AppColors.kRed,fontSize: 16),
                      prefixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(13)),
                      ),
                    ),
                    controller: emailController,
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Please enter your Email'),
                      EmailValidator(errorText: 'Please enter Valida Email'),
                    ]),
                  ),
                  SizedBox(height: data.size.height * 0.03),
                  //form
                  TextFormField(
                  decoration:  const InputDecoration(
                    hintText: "Enter Password",
                    labelText: "Password",
                    errorStyle: TextStyle(color: AppColors.kRed,fontSize: 16),
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(13)),
                    ),
                  ),
                    controller: passwordController,
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Please enter your Password'),
                      MinLengthValidator(8, errorText: 'Password must be at least 8 digits long'),
                      PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'Passwords must have at least one special character'),
                    ]),
                ),
                  SizedBox(height: data.size.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotScreen(),));
                        },
                        child: buildAutoSizeText(Text: "Forgot Password"),),
                    ]),
                  SizedBox(height: data.size.height * 0.01),
                  GestureDetector(
                    onTap: (){
                      if(_formKey.currentState!.validate()) {
                        setState((){
                          email =emailController.text.trim();
                          password =passwordController.text.trim();
                        });
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen(),));
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: data.size.height * 0.07,
                      alignment: Alignment.center,
                      color: AppColors.kBlue,
                      child: const Text("Login",
                          style: TextStyle(fontSize: 17,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),

                  SizedBox(height: data.size.height * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       buildAutoSizeText(Text: "Are you a new?"),
                      TextButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen(),));
                      },
                          child: buildAutoSizeText(Text: "SignUp"),)
                    ],
                  ),
                ]),
              ),
            ),
          ),
        )
    );
  }
}