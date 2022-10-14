import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

abstract class SimmerController {
  

  static Widget listShimmers(BuildContext context, int length) {
    return Container(
      height: (MediaQuery.of(context).size.width * 0.25 + 40) * length,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.white,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: ListView.builder(
            itemBuilder: (_, __) => Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.width * 0.25,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5))),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.all(3),
                            width: double.infinity,
                            height: 16.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100))),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.0),
                        ),
                        Container(
                            margin: EdgeInsets.all(3),
                            width: double.infinity,
                            height: 16.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100))),
                        Container(
                            margin: EdgeInsets.all(3),
                            width: 120,
                            height: 16.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100))),
                      ],
                    ),
                  )
                ],
              ),
            ),
            itemCount: length,
          ),
        ),
      ),
    );
  }
}
