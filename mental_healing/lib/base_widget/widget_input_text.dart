import 'package:flutter/services.dart';
import 'package:mental_healing/import.dart';

class WidgetInputText extends StatefulWidget {
  const WidgetInputText({
    Key? key,
    this.iconLeading,
    this.widgetLeading,
    required this.hintText,
    required this.controller,
    this.currentNode,
    this.title = '',
    this.submitFunc,
    this.obscureText = false,
    this.iconNextTextInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.sentences,
    this.textInputType = TextInputType.text,
    this.inputFormatters,
    this.onChanged,
    this.maxLengthInputForm = 500,
    this.isReadOnly = false,
    this.maxLines,
    this.minLines,
    this.fontSize = 16,
    this.suffixIcon,
    this.hintFontSize = 12,
    this.fillColor,
    this.scrollPadding,
    this.textAlign,
    this.styleText,
    this.hintStyle,
    this.clearText,
    this.validator,
    this.suffixText,
    this.errText = '',
    this.height,
    this.contentPadding,
    this.borderColor,
    this.useSuffix = false,
    this.onPhoneTap,
    this.iconLeadingImage,
    this.marginTop = 16,
    this.borderRadius = 0,
    this.enabledBorder = false,
    this.showRequired = false,
    this.showOptional = false,
    this.onPress,
    this.toolTipMessage,
  }) : super(key: key);

  final EdgeInsets? scrollPadding;
  final String title;
  final Color? fillColor;
  final double hintFontSize;
  final Color? borderColor;
  final double borderRadius;
  final String errText;
  final String? iconLeading;
  final String? iconLeadingImage;
  final Widget? widgetLeading;
  final String hintText;
  final TextEditingController controller;
  final FocusNode? currentNode;
  final bool obscureText;
  final bool isReadOnly;
  final Function()? submitFunc;
  final TextInputAction iconNextTextInputAction;
  final TextCapitalization textCapitalization;
  final TextInputType textInputType;
  final int maxLengthInputForm;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final double fontSize;
  final TextStyle? styleText;
  final TextStyle? hintStyle;
  final TextAlign? textAlign;
  final Function()? clearText;
  final double? height;
  final String? suffixText;
  final EdgeInsets? contentPadding;
  final String? Function(String?)? validator;
  final bool useSuffix;
  final double marginTop;
  final Function()? onPhoneTap;
  final Function()? onPress;
  final bool enabledBorder;
  final bool showRequired;
  final bool showOptional;
  final String? toolTipMessage;

  @override
  State<WidgetInputText> createState() => _WidgetInputTextState();
}

class _WidgetInputTextState extends State<WidgetInputText> {
  final RxBool _isShowButtonClear = false.obs;
  final RxBool _isShowText = false.obs;
  String? errText;
  @override
  void initState() {
    super.initState();
    _isShowText.value = widget.obscureText;
    widget.controller.addListener(() {
      if (widget.controller.text.isNotEmpty) {
        _isShowButtonClear.value = true;
      } else {
        _isShowButtonClear.value = false;
      }
    });
    widget.currentNode?.addListener(() {
      if (widget.currentNode?.hasFocus == false) {
        widget.controller.text = widget.controller.text.trim();
      }
    });
  }

  @override
  void setState(Function() fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.controller.addListener(
      () => setState(() {}),
    );
    return Padding(
      padding: EdgeInsets.only(top: widget.marginTop),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (widget.title.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 7),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: widget.title,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xff4F3422),
                        fontWeight: FontWeight.w600),
                  ),
                ]),
              ),
            )
          else
            const SizedBox(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: widget.onPress,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        autocorrect: false,
                        enableSuggestions: false,
                        textAlignVertical: TextAlignVertical.top,
                        maxLines:
                            widget.obscureText ? 1 : (widget.maxLines ?? 1),
                        minLines:
                            widget.obscureText ? 1 : (widget.minLines ?? 1),
                        obscuringCharacter: '•',
                        scrollPadding: widget.scrollPadding ??
                            const EdgeInsets.only(
                                left: 20, right: 20, top: 20, bottom: 40),
                        textCapitalization: widget.textCapitalization,
                        maxLength: widget.maxLengthInputForm,
                        inputFormatters: widget.obscureText
                            ? [FilteringTextInputFormatter.deny(RegExp(r'\s'))]
                            : (widget.inputFormatters ?? []),
                        textAlign: widget.textAlign ?? TextAlign.start,
                        enabled: !widget.isReadOnly,
                        style: widget.styleText ??
                            const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                        onChanged: (String v) {
                          if (!_isShowButtonClear.value || v.isEmpty) {
                            _isShowButtonClear.value = v.isNotEmpty;
                          }
                          widget.onChanged?.call(v);
                        },
                        validator: (value) {
                          if (widget.validator != null) {
                            setState(() => errText = widget.validator!(value));
                            return widget.validator!(value);
                          } else {
                            return null;
                          }
                        },
                        textInputAction: widget.iconNextTextInputAction,
                        controller: widget.controller,
                        obscureText: _isShowText.value,
                        focusNode: widget.currentNode,
                        keyboardType: widget.textInputType,
                        onFieldSubmitted: (String v) {
                          if (widget.submitFunc != null) {
                            widget.submitFunc!();
                          } else {
                            if (widget.currentNode != null) {
                              widget.currentNode!.unfocus();
                            }
                          }
                        },
                        cursorColor: const Color(0xff4F3422),
                        decoration: InputDecoration(
                          errorStyle: const TextStyle(
                              height: 0.01, color: Colors.transparent),
                          hintStyle: widget.hintStyle ??
                              const TextStyle(
                                  fontSize: 14, color: Color(0xffCCCCCC)),
                          hintText: widget.hintText,
                          fillColor: widget.fillColor ??
                              (widget.controller.text.isNotEmpty
                                  ? Colors.white
                                  : Colors.white),
                          filled: true,
                          isDense: true,
                          errorMaxLines: null,
                          border: InputBorder.none,
                          errorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(widget.borderRadius),
                            borderSide: const BorderSide(
                              width: 1,
                              color: Color(0xff9BB168),
                            ),
                          ),
                          enabledBorder: widget.controller.text.isNotEmpty ||
                                  widget.enabledBorder
                              ? OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      widget.borderRadius),
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: Color(0xff4F3422),
                                  ),
                                )
                              : OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      widget.borderRadius),
                                  borderSide: BorderSide.none,
                                ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(widget.borderRadius),
                            borderSide: const BorderSide(
                                width: 1, color: Color(0xff4F3422)),
                          ),
                          contentPadding: widget.contentPadding ??
                              const EdgeInsets.fromLTRB(12, 18, 0, 18),
                          prefixIcon: _buildPrefixIcon,
                          prefixIconConstraints:
                              const BoxConstraints(maxWidth: 40, maxHeight: 40),
                          suffixIcon:
                              widget.useSuffix || widget.suffixText != null
                                  ? null
                                  : _buildSuffixIcon,
                          suffix: !widget.useSuffix || widget.suffixText != null
                              ? null
                              : _buildSuffixIcon,
                          suffixText: widget.suffixText,
                          suffixIconConstraints:
                              const BoxConstraints(maxWidth: 40, maxHeight: 40),
                          counterStyle:
                              const TextStyle(height: double.minPositive),
                          counterText: '',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _errBuilder(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _errBuilder() {
    return errText != null
        ? Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              children: [
                SvgPicture.asset(AssetIcons.warning),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    errText!,
                    style:
                        const TextStyle(fontSize: 12, color: Color(0xff4F3422)),
                    maxLines: 3,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          )
        : const SizedBox();
  }

  Widget? get _buildPrefixIcon {
    return widget.iconLeading != null
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SvgPicture.asset(widget.iconLeading!, width: 24, height: 24),
          )
        : null;
  }

  Widget? get _buildSuffixIcon {
    if (widget.suffixIcon != null) {
      return Padding(
          padding: const EdgeInsets.only(right: 10), child: widget.suffixIcon);
    }
    if (widget.isReadOnly) {
      return null;
    }
    return widget.obscureText
        ? InkWell(
            onTap: () {
              setState(() {
                _isShowText.toggle();
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Icon(
                _isShowText.value ? Icons.visibility_off : Icons.visibility,
                size: 20.0,
                color: _isShowText.value ? Colors.black : Colors.grey,
              ),
            ),
          )
        : Visibility(
            visible: _isShowButtonClear.value && !widget.isReadOnly,
            child: InkWell(
              onTap: () {
                widget.controller.clear();
                _isShowButtonClear.value = false;
                if (widget.clearText != null) {
                  widget.clearText!();
                }
              },
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: widget.useSuffix ? 0 : 14),
                child: const Icon(
                  Icons.cancel,
                  color: Colors.grey,
                  size: 16,
                ),
              ),
            ),
          );
  }
}
