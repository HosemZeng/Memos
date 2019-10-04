#  iOS备忘录学习开发总结

##  日程
1. 在九月三十日傍晚在[^菜鸟教程]学习Swift语法
2. 在十月一日选择用SwiftUI进行开发，认真学习了[^苹果官方教程]，对开发流程有了一定的认识，加深了对面向对象语言的理解。在傍晚开始仿照前述教程的项目结构建立新的备忘录项目。在十二点前完成进度：确定了Memo结构体，完成了对MemoItem，MemoList的设计，初步开发了MemoHome界面。
3.  在十月二日，针对MemoPage的开发对教程进行深度学习，巩固和加深了对面向对象语言的操作认识，对语言中的类，属性和方法有了更深的了解。同时明白了SwiftUI中@State，@Environment，@Binding，@ObservedObject属性装饰器的作用，还有[^官方文档]的重要作用。在中午前完成进度：向MemoHome中添加了一个创建memo的button，初步开发了MemoItem的导航目标MemoPage的标题与正文板块。在下午五点前完成进度：创建了本地git仓库，于Xcode中关联了Github账户，并将项目仓库上传到了[^Github]。开发了MemoPage的Edit按钮，可切换到MemoPage的子视图MemoPageEditor。
##  开发流程
Memo Struct —>  MemoItem —> MemoList —> MemoHome —> MemoPage —> MemoHome.Button —> MemoPage.EditButton —> MemoPageEditor —> MemoPage.Button ("Cancel")  —> MemoPage.Text —> MemoPageEditor.TextField ——> MemoPageEditor.UITextView——>修改，保存功能
##  对开发中遇到的困难和挑战的各种吐槽
1. 第一天晚上第一次深入接触面向对象的语言感觉到有点怕怕，不过听说Swift不是很难小学生都在学，再看了一眼菜鸟教程感觉也还在能理解的范畴，做一个备忘录而已应该不难吧。美美地睡上一觉。
2.  第二天早上打开SwiftUI官方教程一看？？为什么一个大括号里面要套这么多层代码，这些熟悉的单词怎么一个个都看不懂......好不容易照着教程把各种model和view写好了？？怎么显示不出来/效果不对，原来是没把写好的view套对地方。第二天一个晚上踩了各种坑，尤其是排版问题，aaaaa，为了MemoHome的排版问题从晚上9点半肝到了12点半（疯狂吐槽SwiftUI的排版系统。
3.  第三天早上9点起床开肝代码，往MemoPage添加一个创建button，然后开始写MemoPage和MemoPageEditor。aaaaa该死的排版，在Goggle上搜Text的方法...两个小时过去了。开始写Edit按钮，设计PageEditor，??aaaaa该死的排版，开始搜TextField的方法...搜了一个半小时还没搜到合适的方法，然后各种骚操作调试无解？？这个TextField就是个孤儿。转身求助于UITextView，？？我怎么又看不懂了，时间有点晚了先把笔记写了明早上再开始学吧（肝哭。

[^菜鸟教程]: https://www.runoob.com/swift/swift-tutorial.html
[^苹果官方教程]: https://developer.apple.com/tutorials/swiftui/creating-and-combining-views
[^官方文档]: https://developer.apple.com/documentation/swiftui
[^Github]: https://github.com/HosemZeng/Memos

