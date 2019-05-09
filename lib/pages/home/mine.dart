import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            child: Column(
          children: <Widget>[
            Flexible(
              child: ListView(
                children: <Widget>[
                  MyIconList(
                    icon: 0xe602,
                    text: '本地音乐',
                  ),
                  MyIconList(
                    icon: 0xe629,
                    text: '最近播放',
                  ),
                  MyIconList(
                    icon: 0xeae4,
                    text: '下载管理',
                  ),
                  MyIconList(
                    icon: 0xe661,
                    text: '我的电台',
                  ),
                  MyIconList(
                    icon: 0xe616,
                    text: '我的收藏',
                  ),
                ],
              ),
            ),
            Flexible(
                child: ListView(
              children: <Widget>[
                MyMusicList(
                  pic:
                      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1557398526517&di=de122cd4a0751b486aa332e0deaef271&imgtype=0&src=http%3A%2F%2Fimg.cnmo-img.com.cn%2F1362_600x375%2F1361466.jpg",
                  tit: '我喜欢的音乐',
                  length: 520,
                ),
                MyMusicList(
                  pic:
                      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1557398526517&di=de122cd4a0751b486aa332e0deaef271&imgtype=0&src=http%3A%2F%2Fimg.cnmo-img.com.cn%2F1362_600x375%2F1361466.jpg",
                  tit: 'summer的年度歌单',
                  length: 10,
                ),
                MyMusicList(
                  pic:
                      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1557398526517&di=de122cd4a0751b486aa332e0deaef271&imgtype=0&src=http%3A%2F%2Fimg.cnmo-img.com.cn%2F1362_600x375%2F1361466.jpg",
                  tit: '老张',
                  length: 12,
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Text('跳转登录'),
                )
              ],
            ))
          ],
        )),
      ),
    );
  }
}

class MyIconList extends StatelessWidget {
  MyIconList({
    this.icon,
    this.text,
  });

  final dynamic icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(IconData(icon, fontFamily: 'iconfont')),
      title: Text(text),
    );
  }
}

class MyMusicList extends StatelessWidget {
  MyMusicList({
    @required this.pic,
    this.tit,
    this.length,
    this.ismyfavoriate,
  });

  final String pic;
  final String tit;
  final int length;
  final bool ismyfavoriate;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(tit),
      leading: Image(
        image: NetworkImage(pic),
      ),
      subtitle: Text("${this.length}首"),
    );
  }
}