library utils;

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math' as math;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stack_trace/stack_trace.dart';
import 'package:teledart/telegram.dart';

import '../constants/value.dart';
import '../extensions/extension.dart';

part 'bot.dart';
part 'error_handler.dart';
part 'faker.dart';
part 'formatter.dart';
part 'lipsum.dart';
part 'log.dart';
part 'shortcut.dart';
part 'utilities.dart';
