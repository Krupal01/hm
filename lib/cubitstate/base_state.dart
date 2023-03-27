import 'package:flutter/material.dart';
import 'package:hotel_management/cubit/login_cubit.dart';
import 'package:hotel_management/cubit/register_cubit.dart';

class BaseLoadingState with LoginState ,RegisterState{}

class BaseErrorState with LoginState ,RegisterState{
  final String errorMsg;

  BaseErrorState(this.errorMsg);
}