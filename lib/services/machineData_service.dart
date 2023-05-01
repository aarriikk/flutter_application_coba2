
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:my_app/providers/user_provider.dart';
import 'package:my_app/utils/constant.dart';
import 'package:my_app/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MachineDataService {

  Future<http.Response?> getDataPdf({
    required BuildContext context,
    required machineId
  }) async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      http.Response res = await http.get(
          Uri.parse('${Constants.uri}/calculation?machineId=${machineId}'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token!
          }
      );

        return res;
    }catch(err){
      showSnackBar(context, err.toString());
      throw err.toString();
    }
  }

  Future<http.Response> getAllMachine(BuildContext context) async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      http.Response res = await http.get(
        Uri.parse('${Constants.uri}/parameter'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        },
      );

      return res;
    }catch(err){
      showSnackBar(context, err.toString());
      throw err.toString();
    }
  }

  Future<http.Response?> getByIdMachine({
    required BuildContext context,
    required machineId
    }) async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      http.Response res = await http.get(
        Uri.parse('${Constants.uri}/parameter/machine?machineId=${machineId}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        }
      );

      return res;
    }catch(err){
      showSnackBar(context, err.toString());
      throw err.toString();
    }
  }

  void createMachineData({
    required BuildContext context,
    required int machineId,
    required String objectType,
    required String upTime,
    required String cycleTime,
    required String quantityTarget,
    required String rawMaterialGram,
    required String rawMaterialPrice
  })async{
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/parameter'),
        body: jsonEncode({
            'machineId': machineId,
            'objectType': objectType,
            'upTime': upTime,
            'cycleTime': cycleTime,
            'quantityTarget': quantityTarget,
            'rawMaterialGram': rawMaterialGram,
            'rawMaterialPrice': rawMaterialPrice
          }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        },
      );

      final resData = jsonDecode(res.body)['data'];

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            showSnackBar(context, resData['message']);
          });

    }catch(err){
      showSnackBar(context, err.toString());
    }
  }

}