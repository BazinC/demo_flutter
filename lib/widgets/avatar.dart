import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_demo/model/models.dart';
import 'package:responsive_demo/color_extention.dart';

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
        color: HexColor.fromHex(user.color),
        child: user.profilePicture != null
            ? CachedNetworkImage(
                placeholder: (context, url) => CircularProgressIndicator(),
                imageUrl: user.profilePicture,
                errorWidget: (context, string, d) => Text(
                  string,
                ),
                // imageBuilder: (context, imageProvider) => Test(
                //   imageProvider: imageProvider,
                // ),
              )
            : _Initials(initials: user.initials),
      ),
    );
  }
}

class _Initials extends StatelessWidget {
  const _Initials({Key key, this.initials}) : super(key: key);

  final String initials;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        initials,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      ),
    );
  }
}
