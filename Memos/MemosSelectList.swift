//
//  MemosSelectList.swift
//  Memos
//
//  Created by hosem on 2019/10/7.
//  Copyright © 2019 Hosem. All rights reserved.
//

import SwiftUI

struct MemosSelectList: View {
    @ObservedObject var items: Memos    //监听items（即memoData），必须  //引用传递
    
    @Binding var selectedMemoArray : [Int]
    
    var body: some View {
            VStack(alignment: .leading){
                ScrollView(.vertical, showsIndicators: false){ //建立滚动视窗
                    VStack(alignment: .leading, spacing: 0){
                        ForEach(self.items.memos) { memo in
                                HStack{
                                    Button(action: {
                                        if !self.selectedMemoArray.contains(memo.id){   //点击按钮，如果数组中不包含id则添加
                                            self.selectedMemoArray.append(memo.id)
                                        }
                                        else{   //点击按钮，如果数组中包含了该id就将其删除（用filter）
                                            self.selectedMemoArray = self.selectedMemoArray.filter { $0 != memo.id }
                                        }
                                        //print(self.selectedMemoArray)
                                    }){
                                        if !self.selectedMemoArray.contains(memo.id){
                                            VStack(alignment: .leading){
                                            Image(systemName: "square")
                                                .resizable()
                                                .frame(width:155, height: 155)
                                                .cornerRadius(5)
                                            Text(memo.title)
                                                .font(.caption)
                                            Spacer()
                                            }
                                        }
                                        else{
                                            Image(systemName: "checkmark.square")
                                                .resizable()
                                                .frame(width:155, height: 155)
                                                .cornerRadius(5)
                                            Text(memo.title)
                                                .font(.caption)
                                        }
                                    }
                                }
                    }
                }
                .frame(width: 160)
            }
        }
    }
    
}


