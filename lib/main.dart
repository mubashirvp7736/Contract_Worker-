import 'package:contracterApp/controller/add_provider.dart';
import 'package:contracterApp/controller/db_provider.dart';
import 'package:contracterApp/controller/search_provider.dart';
import 'package:contracterApp/db/model/model.dart';
import 'package:contracterApp/db/second_model/model2.dart';
import 'package:contracterApp/controller/tab_view.dart';
import 'package:contracterApp/controller/Worker_detsil.dart';
import 'package:contracterApp/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

const save_key='';
 Future <void> main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
   if (!Hive.isAdapterRegistered(JobworkersAdapter().typeId)) {
     Hive.registerAdapter(JobworkersAdapter());
  }
if (!Hive.isAdapterRegistered(ProfileModelAdapter().typeId)){
  Hive.registerAdapter(ProfileModelAdapter());
}
  runApp(const Myhome());
}

class Myhome extends StatelessWidget {
  const Myhome({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Workerdetail>(create: (context) => Workerdetail()),
        ChangeNotifierProvider<Tabviewdetail>(create: (context) => Tabviewdetail()),
        ChangeNotifierProvider<DbProvider>(create: (context)=>DbProvider()),
        ChangeNotifierProvider<Addworkers>(create: (context) => Addworkers(),),
        ChangeNotifierProvider(create:(context) => SearchProvider(),)
      ],
      child: const MaterialApp(
        home: Splash(),
        debugShowCheckedModeBanner:false,
      ),
    );
    }
   }
