//
//  Memos list.swift
//  Memos
//
//  Created by hosem on 2019/10/1.
//  Copyright © 2019 Hosem. All rights reserved.
//

import SwiftUI

struct MemosList: View {
    @ObservedObject var items: Memos    //监听items（即memoData），必须  //引用传递
    
    var body: some View {
        VStack(alignment: .leading){
            ScrollView(.vertical, showsIndicators: false){ //建立滚动视窗
                VStack(alignment: .leading, spacing: 0){
                    ForEach(self.items.memos) { memo in
                        NavigationLink(
                            destination:MemoPage(
                                memo: memo,
                                draftMemo: memo
                            )
                        ){
                            HStack{
                                MemoItem(memo: memo)
                            }
                    }
                }
            }
            .frame(width: 160)
            
        }
    }
}
}

struct MemoItem:View {
    var memo: MemoStruct
    var body: some View {
        VStack(alignment: .leading){
            memo.image
                .resizable()
                .frame(width:155, height: 155)
                .cornerRadius(5)
            Text(memo.title)
                .font(.caption)
            Spacer()
        }
    }
}


