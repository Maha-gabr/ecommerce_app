import 'package:flutter/material.dart';
class AppDialog {
  static void showLoading({
    required BuildContext context,

  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            spacing: 10,
            children: [
              CircularProgressIndicator(color: Colors.white70,),
              Text('Loading', style: Theme
                  .of(context)
                  .textTheme
                  .bodyLarge,),
            ],

          ),
        );
      },
    );
  }
  ///hide dialog
  static void hideLoading({required BuildContext context}){
    Navigator.pop(context);
  }
  //show message
  static void showMessage({
    required BuildContext context,
    required String message,
    String title ='',
    String? posActionName,
    VoidCallback? positiveAction,
    String? negActionName,
    VoidCallback? negativeAction,


  }){
    List<Widget> actions =[];
    if(posActionName !=null){
      actions.add(TextButton(
          onPressed: (){
            positiveAction?.call();
          },
          child: Text(posActionName ,style: Theme.of(context).textTheme.bodyLarge,)));
    }
    if(negActionName !=null){
      actions.add(TextButton(
          onPressed: (){
            negativeAction?.call();
          },
          child: Text(negActionName ,style: Theme.of(context).textTheme.bodyLarge,)));
    }
    showDialog(
      context: context, builder: (context) {
      return AlertDialog(
        content:Text(message,style: Theme.of(context).textTheme.bodyLarge,),
        title: Text(title,style: Theme.of(context).textTheme.bodyLarge,),
        actions: actions,
      );

    },);
  }
}
