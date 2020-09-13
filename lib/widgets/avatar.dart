import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_demo/model/user.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key key, this.user, this.size = 40, this.clippingRadiusFactor = 0.4})
      : assert(user != null),
        super(key: key);
  final User user;
  final double size;
  final double clippingRadiusFactor;

  @override
  Widget build(BuildContext context) {
    double clippingRadius = size * clippingRadiusFactor;

    return ClipRRect(
      borderRadius: BorderRadius.circular(clippingRadius),
      child: Container(
        height: size,
        width: size,
        child: user.profilePicture != null
            ? CachedNetworkImage(
                placeholder: (context, url) => CircularProgressIndicator(),
                imageUrl: user.profilePicture,
                errorWidget: (context, string, d) => Text(string),
                imageBuilder: (context, imageProvider) => Test(
                  imageProvider: imageProvider,
                ),
              )
            : _Initials(initials: user.initials),
      ),
    );
  }
}

class Test extends StatelessWidget {
  const Test({
    Key key,
    this.imageProvider,
  }) : super(key: key);
  final ImageProvider imageProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 10,
      // height: 10,
      decoration: BoxDecoration(
        color: Colors.blue,
        image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
      ),
    );
  }
}

class _Initials extends StatelessWidget {
  const _Initials({Key key, this.initials}) : super(key: key);

  final String initials;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(initials),
    );
  }
}
