import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:file_picker/file_picker.dart';

class TextEditor extends StatefulWidget {
  TextEditor({
    Key? key,
    this.controller,
  }) : super(key: key);
  final HtmlEditorController? controller;
  @override
  _TextEditorState createState() => _TextEditorState();
}

class _TextEditorState extends State<TextEditor> {
  HtmlEditorController? _controller;
  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          HtmlEditor(
            controller: _controller ?? HtmlEditorController(),
            htmlEditorOptions: HtmlEditorOptions(
              hint: 'Your text here...',
              shouldEnsureVisible: true,
              //initialText: "<p>text content initial, if any</p>",
            ),
            htmlToolbarOptions: HtmlToolbarOptions(
              toolbarPosition: ToolbarPosition.aboveEditor, //by default
              toolbarType: ToolbarType.nativeScrollable, //by default
              onButtonPressed:
                  (ButtonType type, bool? status, Function? updateStatus) {
                print(
                    "button '${describeEnum(type)}' pressed, the current selected status is $status");
                return true;
              },
              onDropdownChanged: (DropdownType type, dynamic changed,
                  Function(dynamic)? updateSelectedItem) {
                print("dropdown '${describeEnum(type)}' changed to $changed");
                return true;
              },
              mediaLinkInsertInterceptor: (String url, InsertFileType type) {
                print(url);
                return true;
              },
              textStyle: TextStyle(color: Colors.black),
              mediaUploadInterceptor:
                  (PlatformFile file, InsertFileType type) async {
                print(file.name); //filename
                print(file.size); //size in bytes
                print(file.extension); //file extension (eg jpeg or mp4)
                return true;
              },
            ),
            otherOptions: OtherOptions(height: 550),
            callbacks: Callbacks(onBeforeCommand: (String? currentHtml) {
              print('html before change is $currentHtml');
            }, onChangeContent: (String? changed) {
              print('content changed to $changed');
            }, onChangeCodeview: (String? changed) {
              print('code changed to $changed');
            }, onChangeSelection: (EditorSettings settings) {
              print('parent element is ${settings.parentElement}');
              print('font name is ${settings.fontName}');
            }, onDialogShown: () {
              print('dialog shown');
            }, onEnter: () {
              print('enter/return pressed');
            }, onFocus: () {
              print('editor focused');
            }, onBlur: () {
              print('editor unfocused');
            }, onBlurCodeview: () {
              print('codeview either focused or unfocused');
            }, onInit: () {
              print('init');
            },
                //this is commented because it overrides the default Summernote handlers
                /*onImageLinkInsert: (String? url) {
                    print(url ?? "unknown url");
                  },
                  onImageUpload: (FileUpload file) async {
                    print(file.name);
                    print(file.size);
                    print(file.type);
                    print(file.base64);
                  },*/
                onImageUploadError:
                    (FileUpload? file, String? base64Str, UploadError error) {
              print(describeEnum(error));
              print(base64Str ?? '');
              if (file != null) {
                print(file.name);
                print(file.size);
                print(file.type);
              }
            }, onKeyDown: (int? keyCode) {
              print('$keyCode key downed');
            }, onKeyUp: (int? keyCode) {
              print('$keyCode key released');
            }, onMouseDown: () {
              print('mouse downed');
            }, onMouseUp: () {
              print('mouse released');
            }, onPaste: () {
              print('pasted into editor');
            }, onScroll: () {
              print('editor scrolled');
            }),
            plugins: [
              SummernoteAtMention(
                  getSuggestionsMobile: (String value) {
                    var mentions = <String>['test1', 'test2', 'test3'];
                    return mentions
                        .where((element) => element.contains(value))
                        .toList();
                  },
                  mentionsWeb: ['test1', 'test2', 'test3'],
                  onSelect: (String value) {
                    print(value);
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
