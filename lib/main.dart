import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.done, 'Done'),
          _buildButtonColumn(color, Icons.delete, 'Delete'),
          _buildButtonColumn(color, Icons.home, 'Home'),
          _buildButtonColumn(color, Icons.near_me, 'Route'),
        ],
      ),
    );
    Widget textSection = Container(
      padding: const EdgeInsets.all(20),
      child: Text(
        'Дизайн — это очень объемное понятие, которое включает огромное количество разнообразных процессов '
            'деятельности, направленных на создание того или иного продукта. В зависимости от сферы применения '
            '(назначения) различают следующие виды дизайна:'
        'Книжный. Определяет все нюансы художественного оформления, типографского набора и редактирования текста.'
        'Ландшафтный. Включает комплекс мероприятий, направленных на благоустройство территории с учетом архитектурных.'
        'Дизайн мебели. Объединяет все виды деятельности по разработке предметов мебели для жилых, коммерческих.',
        softWrap: true,
      ),
    );
    return MaterialApp(
      title: 'Instagram "Design"',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Instagram "Design"'),
        ),
        body: ListView(
          children: [
            Image.asset(
               'images/dis.jpg',
                 width: 500,
                 height: 240,
               fit: BoxFit.cover,
                ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

Widget titleSection = Container(
padding: const EdgeInsets.all(32),
child: Row(
children: [
Expanded(
/*1*/
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
/*2*/
Container(
padding: const EdgeInsets.only(bottom: 12),
child: Text(
'Белый классический стиль',
style: TextStyle(
fontWeight: FontWeight.bold,
),
),
),
Text(
'Пышная роскошь и величественность классического стиля',
style: TextStyle(
color: Colors.grey[700],
),
),
],
),
),
/*3*/
  FavoriteWidget(),
],
),
);

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}
class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 99;
  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
}
