//
//  MemoHome.swift
//  Memos
//
//  Created by hosem on 2019/10/1.
//  Copyright © 2019 Hosem. All rights reserved.
//

import SwiftUI


struct MemosHome: View {
    
    @State  var showingNewEditMode = false
    
    var addButton: some View {
        Button(action: { self.showingNewEditMode.toggle() }) {
            Image(systemName: "plus.square")
                .imageScale(.large)
                .accessibility(label: Text("Create new memo"))
                .padding()
        }
    }
    
    var body: some View {
        NavigationView{
            MemosList(items: Array(MemoData) )
                .navigationBarTitle(Text("备忘录"))
                .navigationBarItems(trailing: addButton)
                .padding(.top, 20)
        }
    }
}

struct MemoHome_Previews: PreviewProvider {
    static var previews: some View {
        MemosHome()
    }
}
