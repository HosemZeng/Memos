//
//  MemoHome.swift
//  Memos
//
//  Created by hosem on 2019/10/1.
//  Copyright © 2019 Hosem. All rights reserved.
//

import SwiftUI

struct MemosHome: View {
    var body: some View {
        NavigationView{
            MemosList(items: Array(MemoData))
                .navigationBarTitle(Text("备忘录"))
        }
    }
}

struct MemoHome_Previews: PreviewProvider {
    static var previews: some View {
        MemosHome()
    }
}
