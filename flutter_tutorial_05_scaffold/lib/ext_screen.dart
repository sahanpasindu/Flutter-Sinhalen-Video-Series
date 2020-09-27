import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorial_05_scaffold/index.dart';

class ExtScreen extends StatefulWidget {
  const ExtScreen({
    Key key,
    @required ExtBloc extBloc,
  })  : _extBloc = extBloc,
        super(key: key);

  final ExtBloc _extBloc;

  @override
  ExtScreenState createState() {
    return ExtScreenState(_extBloc);
  }
}

class ExtScreenState extends State<ExtScreen> {
  final ExtBloc _extBloc;
  ExtScreenState(this._extBloc);

  @override
  void initState() {
    super.initState();
    this._load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExtBloc, ExtState>(
        bloc: widget._extBloc,
        builder: (
          BuildContext context,
          ExtState currentState,
        ) {
          if (currentState is UnExtState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorExtState) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(currentState.errorMessage ?? 'Error'),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text('reload'),
                    onPressed: () => this._load(),
                  ),
                ),
              ],
            ));
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Flutter files: done'),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: RaisedButton(
                    color: Colors.red,
                    child: Text('throw error'),
                    onPressed: () => this._load(true),
                  ),
                ),
              ],
            ),
          );
        });
  }

  void _load([bool isError = false]) {
    widget._extBloc.add(UnExtEvent());
    widget._extBloc.add(LoadExtEvent(isError));
  }
}
