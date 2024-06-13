import 'package:bloc_copy_with_method/bloc/bloc_status.dart';
import 'package:bloc_copy_with_method/bloc/for_get_all/get_all_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/my_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final MyBloc _bloc = MyBloc();
  final GetAllBloc _getAllBloc = GetAllBloc();

  @override
  Widget build(BuildContext context) {
    late String newEntityOrId;
    return MaterialApp(
      home: Scaffold(
        body: BlocBuilder<MyBloc, MyState>(
          bloc: _bloc,
          builder: (context, state) {
            if (state.blocStatus == BlocStatus.LOADED) {
              return Center(child: Text(state.entity!));
            } else if (state.blocStatus == BlocStatus.LOADING) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.blocStatus == BlocStatus.ERROR) {
              return Center(child: Text(state.error!));
            } else
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Row(
                      children: [
                        Expanded(child: TextField(
                          onChanged: (newEntity) {
                            newEntityOrId = newEntity;
                          },
                        )),
                        ElevatedButton(
                            onPressed: () {
                              _bloc.add(PostEvent(newEntity: newEntityOrId));
                            },
                            child: const Text('post')),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Row(
                      children: [
                        Expanded(child: TextField(
                          onChanged: (idOfEntity) {
                            newEntityOrId = idOfEntity;
                          },
                        )),
                        ElevatedButton(
                          onPressed: () {
                            _bloc.add(
                                GetByIdEvent(id: int.parse(newEntityOrId)));
                          },
                          child: const Text('getById'),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _bloc.add(DeleteByIdEvent(id: 2));
                      },
                      child: const Text('deleteById')),
                  ElevatedButton(
                      onPressed: () {
                        _bloc.add(DeleteAllEvent());
                      },
                      child: const Text('deleteAll')),

                  ElevatedButton(
                    onPressed: () {
                      _getAllBloc.add(GetAllEvent());
                    },
                    child: const Text('getAll'),
                  ),
                  //  ...kList.map((e) => Text(e)).toList()),
                ],
              );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _bloc.add(RollBackEvent());
          },
        ),
      ),
    );
  }
}