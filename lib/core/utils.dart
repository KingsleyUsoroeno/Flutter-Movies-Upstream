import 'package:domain/model/result.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'constant.dart';

class Utils {
  static Widget buildImage(MovieResult movieResult) {
    //final networkInfo = injector<NetworkInfo>();
    return FutureBuilder<bool>(
      future: Future.value(true),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.data == true) {
          return Expanded(
            flex: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: movieResult.posterPath != null
                      ? Constants.IMAGE_URL + movieResult.posterPath
                      : Constants.DEFAULT_IMAGE_URL,
                  fit: BoxFit.cover,
                  width: 90),
            ),
          );
        } else if (snapshot.data == false) {
          return Expanded(
            flex: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: FadeInImage.assetNetwork(
                image: Constants.OFFLINE_IMAGE_URL,
                placeholder: Constants.OFFLINE_IMAGE_URL,
                fit: BoxFit.cover,
              ),
            ),
          );
        }
        return Center();
      },
    );
  }

  static Widget buildGridImage(MovieResult movieResult) {
    //final networkInfo = injector<NetworkInfo>();
    return FutureBuilder<bool>(
      future: Future.value(true),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.data == true) {
          return FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: movieResult.posterPath != null
                  ? Constants.IMAGE_URL + movieResult.posterPath
                  : Constants.DEFAULT_IMAGE_URL,
              fit: BoxFit.cover,
              width: 90);
        } else if (snapshot.data == false) {
          return FadeInImage.assetNetwork(
              placeholder: Constants.OFFLINE_IMAGE_URL,
              image: Constants.OFFLINE_IMAGE_URL,
              fit: BoxFit.cover,
              width: 90);
        }
        return Center();
      },
    );
  }
}
