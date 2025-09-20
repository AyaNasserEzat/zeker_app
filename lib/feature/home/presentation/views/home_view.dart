import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zker/feature/home/data/repositorys/home_repo_impl.dart';
import 'package:zker/feature/home/presentation/view_model/surah_cubit/surah_cubit.dart';
import 'package:zker/feature/home/presentation/view_model/surah_cubit/surah_state.dart';
import 'package:zker/feature/home/presentation/views/ayah_view.dart';
import 'package:zker/services/api_service.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
              SurahListCubit(HomeRepoImpl(ApiService(Dio())))..getSurahList(),
      child: Scaffold(
        appBar: AppBar(title: Text("القرآن الكريم")),
        body: BlocBuilder<SurahListCubit, SurahListState>(
          builder: (context, state) {
            if (state is SurahListLoading)
              return Center(child: CircularProgressIndicator());
            if (state is SurahListError)
              return Center(child: Text(state.message));
            if (state is SurahListLoaded) {
              final surahs = state.surahs;

              return ListView.separated(
                itemCount: surahs.length,
                separatorBuilder: (context, _) => Divider(),
                itemBuilder: (_, index) {
                  final surah = surahs[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return AyahView(surahNumber: surah.number);
                          },
                        ),
                      );
                    },

                    child: ListTile(
                      leading: CircleAvatar(child: Text("${surah.number}")),
                      title: Text(
                        surah.name,
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Text(
                        "${surah.revelationType == "Meccan" ? "مكية" : "مدنية"} - ${surah.numberOfAyahs} آية",
                        textAlign: TextAlign.right,
                      ),
                      trailing: Icon(Icons.bookmark_border),
                    
                    ),
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
