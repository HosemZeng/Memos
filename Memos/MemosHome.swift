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
    @State var selectMode = false
    
    @State var blankMemo = MemoStruct.default
    @State var selectedMemoArray : [Int] = []   //记录被选中的id
    
    var selectButton : some View {
        Button(action: { self.selectMode.toggle() }) {
            if self.selectMode == false{
                Image(systemName: "list.dash")
                    .imageScale(.large)
                    .accessibility(label: Text("Select items"))
                    .padding()
            }
            else{
                Image(systemName: "trash")
                    .imageScale(.large)
                    .accessibility(label: Text("Check"))
                    .padding()
            }
    }
    }
    
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
            if self.selectMode == false{
                NavigationView{
                    MemosList(items: memoData)
                        .navigationBarTitle(Text("备忘录"))    //？？蜜汁警报1
                        .navigationBarItems(leading: selectButton, trailing: addButton)
                        .padding(.top, 20)
                }
            }
            else{
                NavigationView{
                    MemosSelectList(items: memoData, selectedMemoArray: $selectedMemoArray)     //蜜汁警报2
                            .navigationBarTitle(Text("备忘录"))
                            .navigationBarItems(leading: selectButton, trailing: addButton)
                            .padding(.top, 20)
                }
                .onDisappear{
                    print(memoData.memos)
                    memoData.memos = memoData.memos.filter{
                        return !self.selectedMemoArray.contains($0.id)  //返回id不存在于selected的新数组
                    }
                    print(memoData.memos)
                    self.selectedMemoArray = []     //初始化数组
                    update(memoData.memos)
                }
            }
            if self.showingNewEditMode{
                MemoCreator(memo: $blankMemo)
                    .onDisappear(){
                        if memoData.memos.count != 0{
                        self.blankMemo.id = memoData.memos.last!.id + 1
                        }
                        else{
                            self.blankMemo.id = 0
                        }
                        memoData.memos.append(self.blankMemo)
                        self.blankMemo = MemoStruct.default
                        //print(memoData.memos)
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
