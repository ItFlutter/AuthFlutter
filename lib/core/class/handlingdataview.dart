import 'package:first_project/core/constant/imageasset.dart';
import 'package:first_project/core/constant/statusrequest.dart';
import 'package:first_project/core/function/checkinternet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../constant/colors.dart';

class HandlingDataView extends StatefulWidget {
  StatusRequest statusRequest;
  final Widget widget;
  HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  State<HandlingDataView> createState() => _HandlingDataViewState();
}

class _HandlingDataViewState extends State<HandlingDataView> {
  @override
  Widget build(BuildContext context) {
    return widget.statusRequest == StatusRequest.loading
        ? Center(
            child: SizedBox(
            width: Get.width,
            height: 250,
            child: Lottie.asset(
              AppImageAsset.lodding,
            ),
          ))
        : widget.statusRequest == StatusRequest.offline
            ? RefreshIndicator(
                onRefresh: () {
                  return Future.delayed(const Duration(seconds: 1), () async {
                    if (await checkinternet()) {
                      widget.statusRequest = StatusRequest.none;
                      setState(() {});
                    }
                  });
                },
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(vertical: Get.width / 2),
                        width: Get.width,
                        height: 250,
                        child:
                            Lottie.asset(AppImageAsset.offline, reverse: true)),
                  ],
                ),
              )
            : widget.statusRequest == StatusRequest.serverfailure
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 35, horizontal: 20),
                        child: TextButton(
                            style: TextButton.styleFrom(
                                padding: const EdgeInsets.all(0)),
                            onPressed: () {
                              widget.statusRequest = StatusRequest.none;
                              setState(() {});
                            },
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: AppColor.black,
                            )),
                      ),
                      SizedBox(
                        height: Get.width / 2,
                      ),
                      Center(
                          child: SizedBox(
                              width: Get.width,
                              height: 250,
                              child: Lottie.asset(
                                AppImageAsset.serverfailure,
                              ))),
                    ],
                  )
                : widget.statusRequest == StatusRequest.failure
                    ? Center(
                        child: SizedBox(
                            width: Get.width,
                            height: 250,
                            child: Lottie.asset(AppImageAsset.nodata,
                                repeat: false)))
                    : widget.widget;
  }
}
