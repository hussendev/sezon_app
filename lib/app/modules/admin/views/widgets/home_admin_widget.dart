import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sezon_app/app/utils/extensions/sized_box_extension.dart';

import '../../../../core/shared_widget/app_text.dart';
import '../../../auth/views/widgets/app_text_form_field.dart';
import '../product/product_admin_widget.dart';

class HomeAdminWidget extends StatelessWidget {
  const HomeAdminWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: Column(
        children: [
          AppTextFormField(
            textEditingController: TextEditingController(),
            label: 'Search',
            keyboardType: TextInputType.text,
          ),
          30.ph(),
          SizedBox(
              height: 24.h,
              child: const DefaultTabController(
                length: 3,
                child: TabBar(
                  indicatorColor: Colors.redAccent,
                  labelColor: Colors.redAccent,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    Tab(text: 'All'),
                    Tab(text: 'Pending'),
                    Tab(text: 'Completed'),
                  ],
                ),
              )),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              primary: false,
              separatorBuilder: (context, index) => const Divider(),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return const ProductAdminWidget();
              },
            ),
          )
        ],
      ),
    );
  }
}

