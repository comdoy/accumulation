import 'package:accumulation/consts/consts.dart';
import 'package:accumulation/view_pages/home/src/bloc/edit_resume.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditResume extends StatelessWidget {
  const EditResume({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<EditResumeBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(bloc.title ?? '编辑'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 70,
              margin: const EdgeInsets.only(top: 32),
              padding: const EdgeInsets.all(Globals.pad12),
              color: Theme.of(context).cardColor,
              child: CupertinoButton(
                onPressed: (){},
                padding: const EdgeInsets.all(0),
                minSize: double.infinity,
                color: Theme.of(context).primaryColor,
                child: Text(bloc.value ?? "提  交"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
