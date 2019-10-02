//
//  Memos list.swift
//  Memos
//
//  Created by hosem on 2019/10/1.
//  Copyright © 2019 Hosem. All rights reserved.
//

import SwiftUI

struct MemosList: View {
    var items: [Memo]
    
    var body: some View {
        VStack(alignment: .leading){
            ScrollView(.vertical, showsIndicators: false){ //建立滚动视窗
                VStack(alignment: .leading, spacing: 0){
                    ForEach(self.items) { memo in
                        NavigationLink(
                            destination:MemoPage(
                                memo: memo
                            )
                        ){
                            HStack{
                                MemoItem(memo: memo)
                            }
                    }
                }
            }
            .frame(width: 170)
            
        }
    }
}
}

struct MemoItem:View {
    var memo: Memo
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

struct MemosList_Previews: PreviewProvider {
    static var previews: some View {
        MemosList(
            items: Array(MemoData.prefix(4)))
    }
}
