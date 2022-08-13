
import 'package:form_field_validator/form_field_validator.dart';
import 'package:untitled1/Controller/export/export_all.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  var email ="";
  var password ="";
  var conformPwd ="";
  var name ="";
  final nameController =TextEditingController();
  final emailController =TextEditingController();
  final passwordController =TextEditingController();
  final conformController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
            child: Form(
              key: _formKey,
              child: Column(children: [
                SizedBox(
                  width: data.size.width * 0.30,
                  height: data.size.height * 0.30,
                  child: const Image(image: AssetImage("assets/mask-1.jpg"),),),


                TextFormField(
                  decoration:  const InputDecoration(
                    hintText: "Enter Name",
                    labelText: "Name",
                    prefixIcon: Icon(Icons.email_outlined),
                    errorStyle: TextStyle(color: AppColors.kRed,fontSize: 16),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(13)),
                    ),
                  ),
                  obscureText: true,
                  controller: nameController,
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Please enter your Name'),
                  ]),
                ),
                SizedBox(height: data.size.height * 0.02),
                TextFormField(
                  decoration:  const InputDecoration(
                    hintText: "Enter email",
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email_outlined),
                    errorStyle: TextStyle(color: AppColors.kRed,fontSize: 16),
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
                SizedBox(height: data.size.height * 0.02),
                TextFormField(
                  obscureText: true,
                  decoration:  const InputDecoration(
                    hintText: "Enter Password",
                    labelText: "Password",
                    prefixIcon: Icon(Icons.email_outlined),
                    errorStyle: TextStyle(color: AppColors.kRed,fontSize: 16),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(13)),
                    ),
                  ),
                  controller: passwordController,
                  onChanged: (val){
                    password = val;
                  },
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Please enter your Password'),
                    MinLengthValidator(8, errorText: 'Password must be at least 8 digits long'),
                    PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'passwords must have at least one special character'),
                  ]),
                ),
                SizedBox(height: data.size.height * 0.02),
                TextFormField(
                  decoration:  const InputDecoration(
                    hintText: "Enter Conform Password",
                    labelText: "Conform Password",
                    prefixIcon: Icon(Icons.email_outlined),
                    errorStyle: TextStyle(color: AppColors.kRed,fontSize: 16),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(13)),
                    ),
                  ),
                    controller: conformController,

                    validator: (value) => MatchValidator(errorText: 'Passwords do not match').validateMatch(conformPwd, password),

                ),
                SizedBox(height: data.size.height * 0.03),
                GestureDetector(
                  onTap: (){
                    if(_formKey.currentState!.validate()) {
                      setState((){
                        name=nameController.text.trim();
                        email=emailController.text.trim();
                        password=passwordController.text.trim();
                        conformPwd=conformController.text.trim();
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen(),));
                    }},
                  child: Container(
                    width: double.infinity,
                    height: data.size.height * 0.07,
                    alignment: Alignment.center,
                    color: AppColors.kBlue,
                    child: const Text("SignUp",
                        style: TextStyle(fontSize: 17,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
                SizedBox(height: data.size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildAutoSizeText(Text: "I am already a member?"),
                    TextButton(onPressed: () {Navigator.pop(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));},
                      child: buildAutoSizeText(Text: "Login"),),
                  ],
                ),
              ],),
            ),
          ),
        ),
      ),
    );
  }
}
