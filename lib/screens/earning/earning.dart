// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:picktask/components/dot_seperator.dart';
import 'package:picktask/screens/account/accountsController/accounts_controller.dart';
import 'package:picktask/screens/earning/model/withdrawal_list_response.dart';
import 'package:picktask/utils/color.dart';
import 'package:picktask/utils/dialog_helper.dart';
import 'package:picktask/utils/extra_widget.dart';
import 'package:picktask/utils/local_storage.dart';

import 'controller/earnings_controller.dart';
import 'package:intl/intl.dart';
import 'package:picktask/main.dart';
import 'package:picktask/constants/key_constants.dart';

class Earning extends StatefulWidget {
  const Earning({super.key});

  @override
  State<Earning> createState() => _EarningState();
}

class _EarningState extends State<Earning> {
  var amountController = TextEditingController();
  var earningsController = Get.put(EarningsController());
  var accountsController = Get.put(AccountsController());

  Future<void> _pullRefresh() async {
    callAPI();
  }

  callAPI() {
    earningsController.getWithdrawalList().then((value) {
      if (value.success == true) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          accountsController.getMyAccountDetail();
        });
      }
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callAPI();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _pullRefresh,
      child: Scaffold(body: Obx(() {
        return earningsController.isLoading.value == true
            ? loader
            : SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                      height: h * 0.15,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kBlueColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(w * 0.11),
                          bottomRight: Radius.circular(w * 0.11),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: h * 0.01),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Lifetime Earning",
                                    style: GoogleFonts.poppins(
                                        color: kWhiteColor,
                                        fontSize: w * 0.055,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  space(h * 0.0),
                                  Text(
                                    "₹${earningsController.withdrawalListResponse.value.data?.totalamount}",
                                    style: GoogleFonts.poppins(
                                        color: kWhiteColor,
                                        fontSize: w * 0.05,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(
                                    Icons.account_balance_wallet_sharp,
                                    size: w * 0.1,
                                    color: kWhiteColor,
                                  ),
                                ),
                              )
                            ]),
                      ),
                    ),
                    space(h * 0.01),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: w * 0.05, vertical: 5),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Current Balance",
                                  style: GoogleFonts.poppins(
                                      color: kWhiteColor,
                                      fontSize: w * 0.055,
                                      fontWeight: FontWeight.w600),
                                ),
                                space(h * 0.005),
                                Text(
                                  "₹${earningsController.withdrawalListResponse.value.data?.currentbalance}",
                                  style: GoogleFonts.poppins(
                                      color: kWhiteColor,
                                      fontSize: w * 0.05,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.account_balance_wallet_sharp,
                                  size: w * 0.1,
                                  color: kWhiteColor,
                                ),
                              ),
                            )
                          ]),
                    ),
                    space(h * 0.02),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: w * 0.05, vertical: 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: h * 0.06,
                            width: w * 0.45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: kWhiteColor),
                            child: Center(child: mobileFormField()),
                          ),

                          // mobileFormField(),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {

                              if (accountsController.kycStatus.value == 0 ||accountsController.kycStatus.value == 3) {
                                showKycPendingDialog(context);
                                return;
                              }

                              if (amountController.text.isEmpty) {
                                showToastMsg('Enter withdrawal amount');
                                return;
                              }

                              if (double.parse(amountController.text) < 100) {
                                showToastMsg('Min withdrawal amount is ₹100');
                                return;
                              }

                              if (double.parse(amountController.text) > 5000) {
                                showToastMsg('Max withdrawal amount is ₹5000');
                                return;
                              }

                              earningsController
                                  .applyWithdrawal(double.parse(
                                      amountController.text.trim()))
                                  .then((value) {
                                if (value.data?.status == true) {
                                  amountController.text = "";
                                  showWithdrawalSuccessDialog(context);
                                }
                              });
                            },
                            child: Container(
                              height: h * 0.06,
                              width: w * 0.4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: kBlueColor),
                              child: Center(
                                child: Text(
                                  "Withdraw",
                                  style: GoogleFonts.poppins(
                                      color: kWhiteColor,
                                      fontSize: w * 0.045,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    space(h * 0.02),
                    MySeparator(
                      color: Colors.white,
                    ),
                    ListView.builder(
                      itemCount: earningsController.withdrawalList.length,
                      shrinkWrap: true,
                      controller: scrollController,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: h * 0.02),
                          child: EarningCard(
                            withdrawalItemData: earningsController
                                    .withdrawalListResponse
                                    .value
                                    .data
                                    ?.data![index] ??
                                ListData(),
                          ),
                        );
                      },
                    ),
                    //EarningCard()
                  ],
                ),
              );
      })),
    );
  }

  TextFormField mobileFormField() {
    return TextFormField(
      // autovalidateMode:
      //     AutovalidateMode.onUserInteraction,

      inputFormatters: [FilteringTextInputFormatter.digitsOnly],

      controller: amountController,

      maxLength: 10,

      style: GoogleFonts.poppins(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
      keyboardType: TextInputType.phone,
      cursorColor: kWhiteColor,
      decoration: InputDecoration(
        fillColor: kPrimaryColor,
        // fillColor: Colors.black,
        filled: false,
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        counterText: '',
        hintText: "Enter Amount",
        hintStyle: GoogleFonts.poppins(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: kPrimaryColor,
            width: 1.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kWhiteColor),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: kPrimaryColor,
            ),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kWhiteColor, width: 1.0)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0)),

        prefixIconConstraints: BoxConstraints(minWidth: 4),
      ),
    );
  }
}

class EarningCard extends StatelessWidget {
  ListData withdrawalItemData;

  EarningCard({
    Key? key,
    required this.withdrawalItemData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var status = "Pending";
    if (withdrawalItemData.type != 1) {
      if (withdrawalItemData.status == 1) {
        status = "Pending";
      }
      if (withdrawalItemData.status == 2) {
        status = "Approved";
      }
      if (withdrawalItemData.status == 3) {
        status = "Rejected";
      }
      if (withdrawalItemData.status == 4) {
        status = "In-Progress";
      }
    } else {
      status = "Credited";
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: w * 0.05),
      padding: EdgeInsets.symmetric(horizontal: w * 0.03),
      height: h * 0.12,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // Box decoration takes a gradient
        gradient: LinearGradient(
          // Where the linear gradient begins and ends
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          // Add one stop for each color. Stops should increase from 0 to 1
          // stops: [0.1, 0.4, 0.7, 0.9],
          colors: const [
            // Colors are easy thanks to Flutter's Colors class.
            Color(0xFF2B252A),
            Color(0xFF1F2131),
          ],
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Image.asset(
                "assets/images/savings.png",
                width: 70,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // RichText(
                  //   overflow: TextOverflow.ellipsis,
                  //   strutStyle: StrutStyle(fontSize: 12.0),
                  //   maxLines: 2, // this will show dots(...) after 2 lines
                  //   text: TextSpan(
                  //       style: GoogleFonts.poppins(
                  //         color: kWhiteColor,
                  //         fontSize: w * 0.035,
                  //         fontWeight: FontWeight.w500,
                  //       ),
                  //       text:  withdrawalItemData.title ?? "Withdraw"),
                  // ),
                  Text(
                    withdrawalItemData.title ??
                        "Withdrawal",
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      color: kWhiteColor,
                      fontSize: w * 0.035,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "${DateFormat("dd MMM hh:mm a").format(DateTime.parse(withdrawalItemData.createdAt ?? ""))}",
                    style: GoogleFonts.poppins(
                        color: kWhiteColor,
                        fontSize: w * 0.035,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    height: h * 0.03,
                    width: w * 0.25,
                    margin: EdgeInsets.only(top: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        // Where the linear gradient begins and ends
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        // Add one stop for each color. Stops should increase from 0 to 1
                        // stops: [0.1, 0.4, 0.7, 0.9],
                        colors: const [
                          // Colors are easy thanks to Flutter's Colors class.
                          Colors.yellow,
                          Colors.orange,
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        status,
                        style: GoogleFonts.poppins(
                            color: kWhiteColor,
                            fontSize: w * 0.04,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    withdrawalItemData.type == 1
                        ? "+ ₹${withdrawalItemData.amount}"
                        : "- ₹${withdrawalItemData.amount}",
                    style: GoogleFonts.poppins(
                        color: Colors.green,
                        fontSize: w * 0.035,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "TXN${withdrawalItemData.id}",
                    style: GoogleFonts.poppins(
                        color: kWhiteColor,
                        fontSize: w * 0.035,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
