//
//  MemoPage.swift
//  Memos
//
//  Created by hosem on 2019/10/1.
//  Copyright © 2019 Hosem. All rights reserved.
//

import SwiftUI

struct MemoPage: View {
    var memo: Memo
    
    var body: some View {
        VStack(alignment: .leading){
            Text(memo.title)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            Divider()
            Text(memo.text)
            Spacer()
            
        }
}
}

struct MemoPage_Previews: PreviewProvider {
    static var previews: some View {
        MemoPage(memo: Memo.default)
    }
}
