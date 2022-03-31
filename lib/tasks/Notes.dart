import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/home_controller.dart';

class NotesPage extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCFFFDC),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFCFFFDC),
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 10, right: 5),
          child: Row(
            children: [
              Text('Add your Notes',
                style: TextStyle(
                  fontFamily: 'Uber',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff9E00FF),
                ),
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.add,
                  color: Color(0xff9E00FF),
                  size: 25,
                ),
                onPressed: () {
                  _buildAddEditEmployeeView(
                      text: 'Add', addEditFlag: 1, docId: '');
                },
              )
            ],
          ),
        ),

      ),
      body: Obx(
            () =>
            ListView.builder(
              itemCount: controller.employees.length,
              itemBuilder: (context, index) =>
                  Card(
                    color: Color(0xffFFDDFE),
                    child: ListTile(
                      title: Text(controller.employees[index].name!,
                        style: TextStyle(
                            color: Color(0xff9E00FF),
                            fontFamily: "Ubuntu",
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(controller.employees[index].address!,
                        style: TextStyle(
                            color: Color(0xff9E00FF),
                            fontFamily: "Ubuntu",
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      leading: CircleAvatar(
                        child: Text(
                          controller.employees[index]
                              .name!
                              .substring(0, 1)
                              .capitalize!,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: Color(0xff9E00FF),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          displayDeleteDialog(
                              controller.employees[index].docId!);
                        },
                      ),
                      onTap: () {
                        controller.nameController.text =
                        controller.employees[index].name!;
                        controller.addressController.text =
                        controller.employees[index].address!;
                        _buildAddEditEmployeeView(
                            text: 'Update',
                            addEditFlag: 2,
                            docId: controller.employees[index].docId!);
                      },
                    ),
                  ),
            ),
      ),
    );
  }

  _buildAddEditEmployeeView({String? text, int? addEditFlag, String? docId}) {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
          color: Color(0xffFFDDFE),
        ),
        child: Padding(
          padding:
          const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
          child: Form(
            key: controller.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(
                '${text} Note',
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: 'Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                controller: controller.nameController,
                validator: (value) {
                  return controller.validateName(value!);
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                controller: controller.addressController,
                validator: (value) {
                  return controller.validateAddress(value!);
                },
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    child: Material(
                      elevation: 3,
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xff9E00FF),
                      child: MaterialButton(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        onPressed: () {
                          controller.saveUpdateEmployee(
                              controller.nameController.text,
                              controller.addressController.text,
                              docId!,
                              addEditFlag!);
                        },
                        child: Text("Add your Note",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ],
            ),
          ),
        ),
      ),
    ),
    );
  }


  displayDeleteDialog(String docId) {
    Get.defaultDialog(
      title: "Delete Note",
      titleStyle: TextStyle(
          color: Color(0xff9E00FF),
          fontFamily: 'Ubuntu',
          fontWeight: FontWeight.w600,
          fontSize: 18),
      middleText: 'Are you sure to delete your note?',
      textCancel: "Cancel",
      textConfirm: "Confirm",
      confirmTextColor: Colors.black,
      onCancel: () {},
      onConfirm: () {
        controller.deleteData(docId);
      },
    );
  }
}