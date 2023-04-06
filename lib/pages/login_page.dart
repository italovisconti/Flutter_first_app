import 'package:first_app/api/login.dart';
import 'package:flutter/material.dart';

//Pages
import 'package:first_app/pages/home_page.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key, required this.title});

  final String title;

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>(); //Para validar el formulario (que no este vacio)

  TextEditingController myUserController = TextEditingController(); //Para obtener el valor del input
  TextEditingController myPasswordController = TextEditingController();

  @override
  void dispose() { //limpia los controladores (hay que hacerlo siempre/ajuro)
    // Clean up the controller when the widget is disposed.
    myUserController.dispose();
    myPasswordController.dispose();
    super.dispose();
  }

  Future<bool> validateUser(String user, String password) async {
    //Valida el usuario al momento de iniciar sesion
    //usa la funcion httpGetForm de la clase Api
    var resp = await Api.HttpGetForm('/users/validar', {'username': user, 'password': password}); //pasamos los parametros en un Map
    if (resp == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(Icons.note_add_rounded,
                  size: 100, color: Colors.blueGrey),
              const SizedBox(height: 15),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: myUserController, //para obtener el valor del input
                      decoration: const InputDecoration(
                                    border: OutlineInputBorder(), labelText: "User"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your user';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: myPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "Password"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) { //cuando presionamos el boton, valida el formulario
                          ScaffoldMessenger.of(context).showSnackBar( //muestra un mensaje de procesando (la barrita de abajo)
                            const SnackBar(content: Text('Processing Data')),);
                          if (await validateUser(myUserController.text, myPasswordController.text)) {
                            //si el usuario es valido, redirige a la pagina principal
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage( //redirige a la pagina principal
                                        email: myUserController.text,
                                        title: "App de Notas",
                                      )),
                            );
                          } else { //si no es valido, muestra un mensaje de error
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('User or password incorrect')),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar( //mensaje de error del formularo vacio
                            const SnackBar(content: Text('Please fill input')),
                          );
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}