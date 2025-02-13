import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

snackBarResponse(BuildContext context,String text){
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text.tr(),style: Theme.of(context).textTheme.bodySmall,),
    ),
  );
}