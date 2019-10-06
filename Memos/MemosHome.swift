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
    @State var blankMemo = MemoStruct.default
    
    var addButton: some View {
        Button(action: { self.showingNewEditMode.toggle() }) {
            if self.showingNewEditMode == false{
            Image(systemName: "plus.square")
                .imageScale(.large)
                .accessibility(label: Text("Create new memo"))
                .padding()
            }
            else{
                Image(systemName: "checkmark.square")
                    .imageScale(.large)
                    .accessibility(label: Text("Finish"))
                    .padding()
                }
            }
    }
    
    var body: some View {
        VStack{
        NavigationView{
            MemosList(items: memoData )
                .navigationBarTitle(Text("备忘录"))
                .navigationBarItems(trailing: addButton)
                .padding(.top, 20)
        }
        if self.showingNewEditMode == true{
            NewMemoPageEditor(memo: $blankMemo)
                .onDisappear(){
                    self.blankMemo.id = memoData.memos.count
                    memoData.memos.append(self.blankMemo)
                    self.blankMemo = MemoStruct.default
                    print(memoData.memos)
                    update(memoData.memos)
            }
        }
    }
}
}
struct MemoHome_Previews: PreviewProvider {
    static var previews: some View {
        MemosHome()
    }
}
