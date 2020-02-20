import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<String> argumentos = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              _crarAppBarr(),
              SliverList(
                delegate: SliverChildListDelegate([_cajaCalificaciones()]),
              )
            ],
          ),
          Positioned(
              top: 55,
              left: 17,
              child: SafeArea(child: _crearBotonRedondeado(argumentos))),
        ],
      ),
      bottomNavigationBar: _bottomBar(context),
    );
  }

  Widget _crarAppBarr() {
    return SliverAppBar(
      elevation: 2.0,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: Image(
          image: AssetImage('assets/fondoAppBar.jpg'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _crearBotonRedondeado(List<String> argumentos) {
    return Column(
      children: <Widget>[
        Text(
          'Unidad Educativa Hermano Miguel',
          style: TextStyle(
              fontSize: 19, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(colors: [
                Color.fromRGBO(70, 162, 248, 1.0),
                Color.fromRGBO(80, 114, 243, 1.0),
                Color.fromRGBO(142, 82, 243, 1.0),
              ]),
              boxShadow: [BoxShadow(blurRadius: 7, color: Colors.black26)]),
          width: 360,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.account_box,
                size: 30,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Bienvenido ' + argumentos[0],
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _cajaCalificaciones() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 70, horizontal: 40),
        height: 350,
        decoration: BoxDecoration(
            color: Color.fromRGBO(70, 162, 248, 1.0),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black45)],
            gradient: LinearGradient(colors: [
              Color.fromRGBO(70, 162, 248, 1.0),
              Color.fromRGBO(80, 114, 243, 1.0),
              Color.fromRGBO(142, 82, 243, 1.0),
            ])),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            CircleAvatar(
              backgroundColor: Color.fromRGBO(142, 82, 243, 1.0),
              foregroundColor: Colors.white,
              radius: 75,
              child: Container(
                padding: EdgeInsets.all(38),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(70, 162, 248, 1.0),
                      Color.fromRGBO(80, 114, 243, 1.0),
                      Color.fromRGBO(142, 82, 243, 1.0),
                    ]),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 2)
                    ]),
                child: Icon(
                  Icons.assignment,
                  size: 75,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Calificaciones',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {},
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromRGBO(70, 162, 248, 1.0),
                  Color.fromRGBO(80, 114, 243, 1.0),
                  Color.fromRGBO(142, 82, 243, 1.0),
                ])),
                padding:
                    const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                child: Text(
                  'Ver',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _bottomBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          canvasColor: Color.fromRGBO(70, 162, 248, 1.0),
          primaryColor: Colors.white,
          textTheme: Theme.of(context)
              .textTheme
              .copyWith(caption: TextStyle(color: Colors.white))),
      child: BottomNavigationBar(
        iconSize: 28,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: Colors.white, size: 35),
            title: Text('Perfil'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: Colors.white, size: 35),
            title: Text('Notificaciones'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervisor_account, color: Colors.white, size: 35),
            title: Text('Cerrar Sesion'),
          ),
        ],
      ),
    );
  }
}
