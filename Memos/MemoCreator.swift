//
//  NewMemoPageEditor.swift
//  Memos
//
//  Created by hosem on 2019/10/5.
//  Copyright © 2019 Hosem. All rights reserved.
//

import SwiftUI

let newTextEditorHeight = textHeight

struct TextViewInCreator: UIViewRepresentable {
    @Binding var text: String

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UITextView {

        let textView = UITextView()
        textView.delegate = context.coordinator
        textView.layer.borderWidth = 0
        textView.font = UIFont(name: "HelveticaNeue", size: 18)
        textView.keyboardType = UIKeyboardType.default
        textView.isScrollEnabled = true
        textView.contentInset = UIEdgeInsets(top: -11, left: -6, bottom: 0, right: 0);
        textView.isEditable = true
        textView.isUserInteractionEnabled = true
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }

    class Coordinator : NSObject, UITextViewDelegate {

        var parent: TextViewInCreator

        init(_ uiTextView: TextViewInCreator) {
            self.parent = uiTextView
        }

        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            return true
        }
        
        func textViewDidChange(_ textView: UITextView) {
            print("text now: \(String(describing: textView.text!))")
            self.parent.text = textView.text
        }
    }
}

struct MemoCreator: View {
    
   @Binding var memo: MemoStruct      
/* func initDraft(to memoInMemoPage : Memo) -> some View{      //第一次调用时初始化MemoPage
        if memo != memoInMemoPage {
            memo = memoInMemoPage
        }
        return self
    }
*/
    
    var body: some View {
        VStack{
            ScrollView{
                Divider()
                TextField("Title", text: $memo.title )
                .font(.title)
                .padding(.leading, 15)
                Divider()
                TextViewInCreator(text: $memo.text)
                    .padding(.leading, 15)
                    .frame(height: newTextEditorHeight*0.4)
                Spacer()        //给keyBoard留出空间
                }
            .frame(height: newTextEditorHeight) //滚动视图高度
        }
    }
}

struct MemoCreator_Previews: PreviewProvider {
    static var previews: some View {
        MemoPage(memo: MemoStruct.default, draftMemo: MemoStruct.default)
    }
}
