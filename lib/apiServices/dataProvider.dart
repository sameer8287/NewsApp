import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/apiServices/worldApi.dart';
import 'package:news_app/models/generalModel.dart';

import '../views/Category/reusableCategoryPage.dart';
import 'generalApiCall.dart';

final generalNewsData = FutureProvider.autoDispose.family<GeneralModel, String>(
    (ref, arg) => ref.watch(generalApi).GeneralNews(arg));

final worlfNewData = FutureProvider<GeneralModel>((ref) => ref.watch(worldApiNewsData).getWorldData());
