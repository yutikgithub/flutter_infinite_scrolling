import 'package:flutter/material.dart';
import 'package:new_maps/model/datamodel.dart';
import 'package:new_maps/screens/content.dart';
import 'package:new_maps/services/remote_services.dart';
import 'package:new_maps/utils/utils.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';

class TabOne extends StatefulWidget {
  final int pack;
  const TabOne(this.pack,{ Key? key }) : super(key: key);

  @override
  State<TabOne> createState() => _TabOneState();
}

class _TabOneState extends State<TabOne> {

  Future<List<DataModel>>? maps;
  List<DataModel> dataList = [];

  GlobalKey contentKey = GlobalKey();
  GlobalKey refresherKey = GlobalKey();

  int page = 0;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  getData(int page,int pack) async {
    maps = RemoteServices().fetchCategories(page: page,pack: pack);
    setState(() {
      maps!.then((value) {
        dataList.addAll(value);
      });
    });
  }

  void _onRefresh() async {
    print('_onRefresh');

    await Future.delayed(const Duration(seconds: 2));

    dataList.clear();

    page = 0;

    getData(page,widget.pack);

    setState(() {
      refreshController.refreshCompleted();
    });
  }

  void _onLoading() async {
    print('_onLoading');

    await Future.delayed(const Duration(seconds: 2));

    if (page < 100) {
      page += 30;
      getData(page,widget.pack);
    }

    setState(() {
      refreshController.loadComplete();
    });
  }

  @override
  void initState() {
    super.initState();
    getData(page,widget.pack);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration.copyAncestor(
      enableLoadingWhenFailed: true,
      context: context,
      child: Scaffold(
        body: FutureBuilder<List<DataModel>>(
          future: maps,
          builder: (context, snapshot) {
            return snapshot.hasData
                ? SmartRefresher(
                    key: refresherKey,
                    controller: refreshController,
                    enablePullUp: true,
                    physics: const BouncingScrollPhysics(),
                    footer: const ClassicFooter(
                      loadStyle: LoadStyle.ShowWhenLoading,
                    ),
                    onRefresh: _onRefresh,
                    onLoading: _onLoading,
                    child: ListView.builder(
                      key: contentKey,
                      physics: const BouncingScrollPhysics(),
                      itemCount: dataList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(8.sp),
                          child: InkWell(
                            onTap: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => Content(dataList[index])));
                            },
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
                                            dataList[index].pack.toString() +
                                            '_' +
                                            dataList[index].position.toString() +
                                            '_0.jpg'))),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : Center(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.purple,
                        strokeWidth: 4.sp,
                      ),
                    ),
                  );
          },
        ),
      ),
      headerBuilder: () => WaterDropMaterialHeader(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      footerTriggerDistance: 30.sp,
    );
  }
}