//
//  MemoPage.swift
//  Memos
//
//  Created by hosem on 2019/10/1.
//  Copyright © 2019 Hosem. All rights reserved.
//

import SwiftUI

let screenRect = UIScreen.main.bounds
let textHeight = screenRect.size.height*0.905 - 190

struct TextView: UIViewRepresentable {
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
        textView.isEditable = false
        textView.isUserInteractionEnabled = true
        return textView
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

struct MemoPage: View {
    @State var memo: MemoStruct
    @State var draftMemo : MemoStruct         //必须初始化一次draftMemo
    @Environment(\.editMode) var mode

    
 /*   var deleteButton : some View {
        Button
    }
 */
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                if self.mode?.wrappedValue == .active {
                    Button("Cancel") {
                        self.draftMemo = self.memo
                        self.mode?.animation().wrappedValue = .inactive
                    }
                        .padding(.leading, 10)
                        .padding(.bottom, 20)
                }
                Spacer()
                EditButton()
                    .padding(.trailing, 10)
                    .padding(.bottom, 20)
            }
                .frame(height:20)
            if self.mode?.wrappedValue == .inactive {
                Text(memo.title)
                    .font(.title)
                    .padding(.leading, 15)
                Divider()
                TextView(text:$memo.text)
                    .padding(.leading, 15)
                    .frame(height: textHeight)
                Spacer()
            } else {
                MemoPageEditor(memo: $draftMemo)
                    .onAppear {
                        self.draftMemo = self.memo
                    }
                    .onDisappear {
                        self.memo = self.draftMemo
                        memoData.memos[self.memo.id] = self.memo
                        print(memoData.memos)
                        update(memoData.memos)
                    }
            }
        }
        .padding(.top, 0)
       // .navigationBarItems(trailing: deleteButton)
}
}

struct MemoPage_Previews: PreviewProvider {
    static var previews: some View {
        MemoPage(memo: MemoStruct.default, draftMemo: MemoStruct.default)
    }
}
