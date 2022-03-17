import 'package:flutter/material.dart';
import 'package:new_maps/model/datamodel.dart';
import 'package:new_maps/utils/utils.dart';
import 'package:sizer/sizer.dart';

class Content extends StatefulWidget {
  final DataModel dataList;
  const Content(this.dataList, {Key? key}) : super(key: key);

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  DataModel? dataList;

  @override
  void initState() {
    super.initState();

    dataList = widget.dataList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.sp),
              child: Material(
                elevation: 15.sp,
                shadowColor: Colors.black,
                borderRadius: BorderRadius.circular(14.sp),
                child: Container(
                  height: 26.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(width: 1.sp),
                      borderRadius: BorderRadius.circular(14.sp),
                      // backgroundBlendMode: BlendMode.color,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(Util.baseUrl +
                              Util.type[0] +
                              dataList!.pack.toString() +
                              '_' +
                              dataList!.position.toString() +
                              '_0.jpg'))),
                ),
              ),
            ),
            SizedBox(height: 3.h),
            Text(
              dataList!.name.toString(),
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 3.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(Icons.file_download),
                    SizedBox(height: 5.sp,),
                    Text('${dataList!.filesize} Mb')
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.abc), 
                   SizedBox(height: 5.sp,),
                  Text(dataList!.supportVersion.toString())],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
