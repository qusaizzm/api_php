// import 'package:flutter/material.dart';
// import 'package:fz_md01/12/models/content_object.dart';
// import 'package:fz_md01/12/view/widgets/card_widget.dart';
// import 'package:fz_md01/12/view/widgets/icon_button_widget.dart';
// import 'package:fz_md01/12/view/widgets/my_box_widget.dart';
// import 'package:fz_md01/12/view/widgets/text_button_widget.dart';
// import 'package:fz_md01/12/view/widgets/text_field_widget.dart';
 

// class InsertPhpPage extends StatefulWidget {
//   ContentObject contentObject;
//   InsertPhpPage(this.contentObject);

//   @override
//   State<InsertPhpPage> createState() => _InsertPhpPageState();
// }

// class _InsertPhpPageState extends State<InsertPhpPage> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController bodyController = TextEditingController();
//   TextEditingController photoUrlController = TextEditingController();

//   // final dbHelper = DatabaseHelper.instance;

//   final _formKey = GlobalKey<FormState>();

//   @override
//   void initState() {
//     super.initState();
//     nameController.text = widget.contentObject.name;
//     photoUrlController.text = widget.contentObject.photo ?? '';
//     bodyController.text = widget.contentObject.body;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Edit Content'),
//         leading: IconButtonWidget(iconData: Icons.arrow_back_sharp, onTap: () => Navigator.of(context).pop(false)),
//       ),
//       body: SingleChildScrollView(
//         child: CardWidget(
//           child: Column(
//             children: [
//               Form(
//                   key: _formKey,
//                   child: Column(
//                     children: [
//                       TextFieldWidget(controller: nameController, name: 'Name'),
//                       MyBoxWidget(),
//                       TextFieldWidget(
//                         controller: bodyController,
//                         name: 'Body',
//                         maxLines: 8,
//                       ),
//                       MyBoxWidget(),
//                       // TextFieldWidget(
//                       //   controller: photoUrlController,
//                       //   name: 'Photo Path',
//                       //   isRequired: false,
//                       //   maxLines: 2,
//                       //   validator: () {
//                       //     if (photoUrlController.text.isNotEmpty) {
//                       //       Validation.url(photoUrlController.text);
//                       //     }
//                       //   },
//                       // ),
//                     ],
//                   )),
//               MyBoxWidget(
//                 height: 30,
//               ),
//               TextBtnWidget(
//                   name: 'Save',
//                   onTap: () {
//                     // if (_formKey.currentState!.validate()) {
//                     //   ContentObject contentObject =
//                     //       ContentObject(id: widget.contentObject.id, name: nameController.text, body: bodyController.text, photo: photoUrlController.text);
//                     //   Map<String, dynamic> map = contentObject.toMap();
//                     //   DatabaseServices().updateItem(map, tableContent).then((value) {
//                     //     context.back(true);
//                     //   });
//                     // }
//                   }
//                   ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     nameController.dispose();
//     bodyController.dispose();
//     photoUrlController.dispose();
//     super.dispose();
//   }
// }
