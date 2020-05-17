import 'package:flutter/material.dart';

alert(BuildContext context, String msg, {Function callback}){

  showDialog(context: context,
    builder: (context){
      return AlertDialog(
        title: Text("Alerta!"),
        content: Text(msg),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ),
        actions: <Widget>[
          Row(
            children: <Widget>[
              FlatButton(
                onPressed: (){
                  if(callback != null){
                    callback();
                  }
                  Navigator.of(context).pop();
                }, 
                child: Text("OK")
              ),
              callback != null
              ? FlatButton(
                onPressed: (){
                  Navigator.of(context).pop();
                }, 
                child: Text("Cancelar"),
              )
              : Container(),
            ],
          )
        ],
      );
    }
  );
}