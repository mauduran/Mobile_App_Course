import 'package:flutter/material.dart';
import 'package:estructura_practica_1/utils/constants.dart';

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 30, 16, 16),
          child: Text(
            'Perfil',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Divider(
          height: 1,
          thickness: 1,
        ),
        Padding(
          padding: EdgeInsets.all(24.0),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: 150,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        PROFILE_PICTURE,
                      ),
                      minRadius: 40,
                      maxRadius: 80,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    PROFILE_NAME,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(PROFILE_EMAIL),
                  SizedBox(
                    height: 16,
                  ),
                  ListTile(
                    title: Text(
                      PROFILE_CART.toUpperCase(),
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    leading: Icon(
                      Icons.shopping_cart_outlined,
                      color: Theme.of(context).primaryColor,
                      size: 35,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text(
                      PROFILE_WISHES.toUpperCase(),
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    leading: Icon(
                      Icons.favorite_border_outlined,
                      color: Theme.of(context).primaryColor,
                      size: 35,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text(
                      PROFILE_HISTORY.toUpperCase(),
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    leading: Icon(
                      Icons.store_outlined,
                      color: Theme.of(context).primaryColor,
                      size: 35,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text(
                      PROFILE_SETTINGS.toUpperCase(),
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    leading: Icon(
                      Icons.settings_outlined,
                      color: Theme.of(context).primaryColor,
                      size: 35,
                    ),
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 110,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          child: Text(PROFILE_LOGOUT.toUpperCase()),
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/access', (r) => false);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
