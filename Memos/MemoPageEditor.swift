//
//  blankMemoPage.swift
//  Memos
//
//  Created by hosem on 2019/10/2.
//  Copyright © 2019 Hosem. All rights reserved.
//


import SwiftUI

struct TextView: UIViewRepresentable {
    @Binding var text: String

        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }

        func makeUIView(context: Context) -> UITextView {

            let myTextView = UITextView()
            myTextView.delegate = context.coordinator

            myTextView.font = UIFont(name: "HelveticaNeue", size: 15)
            myTextView.isScrollEnabled = true
            myTextView.isEditable = true
            myTextView.isUserInteractionEnabled = true
            return myTextView
        }

        func updateUIView(_ uiView: UITextView, context: Context) {
            uiView.text = text
        }

        class Coordinator : NSObject, UITextViewDelegate {

            var parent: TextView

            init(_ uiTextView: TextView) {
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
    @Binding var memo : Memo

    var body: some View {
        VStack{
            TextField("Title", text:$memo.title)
                .font(.title)
                .padding(.leading, 15)
                .padding(.top, -20)
            Divider()
            TextView(text:$memo.text)
            Spacer()
        }
    }
}

struct MemoPageEditor_Previews: PreviewProvider {
    static var previews: some View {
        MemoPage(memo: Memo.default)
    }
}

