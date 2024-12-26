void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 25),
        child: Text("Hello World",
            style: TextStyle(fontSize: 22, color: Colors.black87),
            textDirection: TextDirection.ltr),
      ),
    ),
  ));
}
