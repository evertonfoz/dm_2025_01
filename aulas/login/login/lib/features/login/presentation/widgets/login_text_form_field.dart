import 'package:flutter/material.dart';

enum FormFieldType { email, password, text }

class LoginTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final FormFieldType? formFieldType;

  const LoginTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.obscureText = false,
    this.keyboardType,
    this.formFieldType = FormFieldType.text,
  });

  @override
  State<LoginTextFormField> createState() => _LoginTextFormFieldState();
}

class _LoginTextFormFieldState extends State<LoginTextFormField> {
  bool _isHovered = false;
  bool _isFocused = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  String? _validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Informe ${widget.labelText}';
    }
    if (widget.formFieldType == FormFieldType.email &&
        !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'E-mail inválido';
    }
    if (widget.formFieldType == FormFieldType.password && value.length < 6) {
      return 'Senha deve ter pelo menos 6 caracteres';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final baseTheme = Theme.of(context).inputDecorationTheme;
    final borderRadius =
        (baseTheme.enabledBorder is OutlineInputBorder)
            ? (baseTheme.enabledBorder as OutlineInputBorder).borderRadius
            : BorderRadius.circular(8);

    final Color defaultBorderColor =
        baseTheme.enabledBorder is OutlineInputBorder
            ? (baseTheme.enabledBorder as OutlineInputBorder).borderSide.color
            : Colors.grey;

    final double DefaultBorderWidth =
        baseTheme.enabledBorder is OutlineInputBorder
            ? (baseTheme.enabledBorder as OutlineInputBorder).borderSide.width
            : 1.0;

    final Color hoveColor = Colors.deepPurple;

    return MouseRegion(
      onEnter:
          (_) => setState(() {
            _isHovered = true;
          }),
      onExit:
          (_) => setState(() {
            _isHovered = false;
          }),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          filled: true,
          fillColor:
              _isHovered || _isFocused ? Colors.white70 : baseTheme.fillColor,
          labelText: widget.labelText,
          enabledBorder:
              baseTheme.enabledBorder is UnderlineInputBorder
                  ? UnderlineInputBorder(
                    borderRadius: borderRadius,
                    borderSide: BorderSide(
                      color:
                          _isHovered || _isFocused
                              ? hoveColor
                              : defaultBorderColor,
                      width:
                          _isHovered || _isFocused
                              ? DefaultBorderWidth + 1
                              : DefaultBorderWidth,
                    ),
                  )
                  : baseTheme.enabledBorder,
        ),
        focusNode: _focusNode,
        obscureText: widget.obscureText,
        keyboardType: widget.keyboardType,
        validator: _validate,
      ),
    );
  }
}
