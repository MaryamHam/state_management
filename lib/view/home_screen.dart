import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/cubit/auth/cubit/auth_cubit.dart';
import 'package:state_management/cubit/main/main_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(  
       

        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 72, 79, 7), 
          title: Text("Home", style: TextStyle(fontSize: 20,color: Colors.white),)), 
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Switch(value: MainCubit.get(context).isDark,
               onChanged: (value){
                if(value){
                  MainCubit.get(context).changeToDark();
                }else{
                  MainCubit.get(context).changeToLight();
                }
               }),
        
               BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return state is LoadingLoginState
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 157, 160, 62))),
                      onPressed: () {
                        AuthCubit.get(context).login("Maryam@gmail.com", "123456");
                      },
                      child: Text("Login"),
                    );
            },
          ),
              
        
            //  ElevatedButton(
            //   onPressed: (){
        
          
            //  }, child: Text("Login"))
        
        
            ],
          ),
        ),
      ),
    );
  }
}