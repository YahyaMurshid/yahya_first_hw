import 'package:flutter/material.dart';
import '../widgets/yahya_custom_button.dart';

class YahyaTextFieldsScreen extends StatefulWidget {
  const YahyaTextFieldsScreen({super.key});

  @override
  State<YahyaTextFieldsScreen> createState() => _YahyaTextFieldsScreenState();
}

class _YahyaTextFieldsScreenState extends State<YahyaTextFieldsScreen> {
  final List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  final _formKey = GlobalKey<FormState>();

  bool _acceptTerms = false;

  void clearFields() {
    setState(() {
      for (var controller in controllers) {
        controller.clear();
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تم مسح جميع الحقول بنجاح'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }

  String? validateField(String? value, int index) {
    if (value == null || value.isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    switch (index) {
      case 1: // رقم الهاتف
        if (!RegExp(r'^7[0137]\d{7}$').hasMatch(value)) {
          return 'رقم الهاتف غير صحيح - يجب أن يبدأ بـ 73 أو 77 أو 71 أو 70';
        }
        break;
      case 2: // البريد الإلكتروني
        if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[\w-]{2,4}$')
            .hasMatch(value)) {
          return 'البريد الإلكتروني غير صحيح';
        }
        break;
    }
    return null;
  }

  void submitForm() {
    if (!_acceptTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('يجب الموافقة على الشروط والأحكام'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تم حفظ البيانات بنجاح'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> hintTexts = [
      'أدخل اسمك الكامل',
      'أدخل رقم الهاتف',
      'أدخل البريد الإلكتروني',
      'أدخل العنوان',
    ];

    final List<IconData> fieldIcons = [
      Icons.person,
      Icons.phone,
      Icons.email,
      Icons.location_on,
    ];

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'تسجيل البيانات',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.blue.shade700,
        ),
        backgroundColor: Colors.grey[100],
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue.shade700,
                Colors.grey.shade100,
              ],
              stops: const [0.0, 0.3],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 15,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: ListView.builder(
                        itemCount: controllers.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: TextFormField(
                            controller: controllers[index],
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            keyboardType: index == 1
                                ? TextInputType.phone
                                : index == 2
                                    ? TextInputType.emailAddress
                                    : TextInputType.text,
                            textInputAction: index == controllers.length - 1
                                ? TextInputAction.done
                                : TextInputAction.next,
                            validator: (value) => validateField(value, index),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                fieldIcons[index],
                                color: Colors.blue.shade700,
                              ),
                              suffixIcon: controllers[index].text.isNotEmpty
                                  ? IconButton(
                                      icon: const Icon(Icons.clear),
                                      onPressed: () {
                                        setState(() {
                                          controllers[index].clear();
                                        });
                                      },
                                    )
                                  : null,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.grey.shade100,
                              hintText: hintTexts[index],
                              hintStyle: TextStyle(
                                color: Colors.grey.shade600,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 20,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade300,
                                  width: 1.5,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Colors.blue.shade700,
                                  width: 2,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Colors.red.shade300,
                                  width: 1.5,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Colors.red.shade700,
                                  width: 2,
                                ),
                              ),
                            ),
                            onChanged: (value) => setState(() {}),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Checkbox(
                      value: _acceptTerms,
                      onChanged: (value) {
                        setState(() {
                          _acceptTerms = value ?? false;
                        });
                      },
                      activeColor: Colors.blue.shade700,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _acceptTerms = !_acceptTerms;
                          });
                        },
                        child: Text(
                          'أوافق على الشروط والأحكام',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: YahyaCustomButton(
                        text: 'حذف النموذج',
                        buttonColor: Colors.red.shade700,
                        onPressed: clearFields,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: YahyaCustomButton(
                        text: 'إرسال البيانات',
                        buttonColor:
                            _acceptTerms ? Colors.green.shade700 : Colors.grey,
                        onPressed: _acceptTerms ? submitForm : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
