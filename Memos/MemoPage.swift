//
//  MemoPage.swift
//  Memos
//
//  Created by hosem on 2019/10/1.
//  Copyright © 2019 Hosem. All rights reserved.
//

import SwiftUI

struct MemoPage: View {
    @State var memo: Memo

    @Environment(\.editMode) var mode
    @State var draftMemo = Memo.default
    
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
                    .padding(.top, -20)
                Divider()
                Text(memo.text)
                    .padding(.leading, 15)
                    .lineLimit(22)
                Spacer()
            } else {
                MemoPageEditor(memo: $draftMemo)
                    .onAppear {
                        self.draftMemo = self.memo
                    }
                    .onDisappear {
                        self.memo = self.draftMemo
                    }
            }
        }

        .padding(.top, 0)
        .padding(.bottom, -80)
}
}

struct MemoPage_Previews: PreviewProvider {
    static var previews: some View {
        MemoPage(memo: Memo.default)
    }
}
