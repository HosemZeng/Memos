//
//  blankMemoPage.swift
//  Memos
//
//  Created by hosem on 2019/10/2.
//  Copyright © 2019 Hosem. All rights reserved.
//


import SwiftUI

struct TextViewInEditor: UIViewRepresentable {
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

            var parent: TextViewInEditor

            init(_ uiTextView: TextViewInEditor) {
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

struct MemoPageEditor: View {
    @Binding var memo : MemoStruct
    
    var body: some View {
        VStack(alignment: .leading){
            ScrollView{                 //这个办法太绝了
            TextField("Title", text:$memo.title)
                .font(.title)
                .padding(.leading, 15)
            Divider()
            TextViewInEditor(text:$memo.text)
                .padding(.leading, 15)
                .frame(height: textHeight)
            }
            Spacer()                   //给keyBoard留出空间
        }

    }
}

struct MemoPageEditor_Previews: PreviewProvider {
    static var previews: some View {
        MemoPage(memo: MemoStruct.default, draftMemo: MemoStruct.default)
    }
}

