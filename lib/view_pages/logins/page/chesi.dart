import 'package:flutter/material.dart';

class Chesis extends StatefulWidget {
  const Chesis({super.key});

  @override
  State<Chesis> createState() => _ChesisState();
}

class _ChesisState extends State<Chesis> {
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("登录"),
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Center(
            child: Container(
              child: TextFormField(
                controller: _emailController,
                focusNode: _emailFocusNode,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.white, fontSize: 14),
                cursorColor: Colors.white,
                onSaved: (v) {},
              ),
            ),
          ),
          Center(
            child: Container(
              child: TextFormField(
                controller: _emailController,
                focusNode: _emailFocusNode,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.white, fontSize: 14),
                cursorColor: Colors.white,
                onSaved: (v) {},
              ),
            ),
          ),
          Center(
            child: Container(
              child: TextFormField(
                controller: _emailController,
                focusNode: _emailFocusNode,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.white, fontSize: 14),
                cursorColor: Colors.white,
                onSaved: (v) {},
              ),
            ),
          ),
          Center(
            child: Container(
              child: TextFormField(
                controller: _emailController,
                focusNode: _emailFocusNode,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.white, fontSize: 14),
                cursorColor: Colors.white,
                onSaved: (v) {},
              ),
            ),
          ),
          Container(
            child: TextFormField(
              controller: _emailController,
              focusNode: _emailFocusNode,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: Colors.white, fontSize: 14),
              cursorColor: Colors.white,
              onSaved: (v) {},
            ),
          ),
          Container(
            child: TextFormField(
              controller: _emailController,
              focusNode: _emailFocusNode,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: Colors.white, fontSize: 14),
              cursorColor: Colors.white,
              onSaved: (v) {},
            ),
          ),
          Container(
            child: TextFormField(
              controller: _emailController,
              focusNode: _emailFocusNode,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: Colors.white, fontSize: 14),
              cursorColor: Colors.white,
              onSaved: (v) {},
            ),
          ),
          Center(
            child: Container(
              child: TextFormField(
                controller: _emailController,
                focusNode: _emailFocusNode,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.white, fontSize: 14),
                cursorColor: Colors.white,
                onSaved: (v) {},
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(8)),
            child: Column(children: [
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [Text("data"), Text("2013-10")],
              )
            ]),
          )
        ],
      ),
    );
  }
}
