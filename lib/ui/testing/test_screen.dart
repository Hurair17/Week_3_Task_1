import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'test_view_model.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TestViewModel(),
      child: Consumer<TestViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            body: model.isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: model.testModel.length,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          height: 150.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.withOpacity(0.3)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  model.testModel[index].imageUrl != null
                                      ? Image.network(
                                          model.testModel[index].imageUrl!,
                                          height: 50.h,
                                          width: 50.w)
                                      : Image.asset('assets/product.jpg',
                                          height: 50.h, width: 50.w),
                                  SizedBox(width: 20.w),
                                  Text('Name: ${model.testModel[index].name}'),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                  'Department: ${model.testModel[index].department}'),
                              Text('GPA ${model.testModel[index].gpa}'),
                            ],
                          ),
                        ),
                      );
                    }),
          );
        },
      ),
    );
  }
}
