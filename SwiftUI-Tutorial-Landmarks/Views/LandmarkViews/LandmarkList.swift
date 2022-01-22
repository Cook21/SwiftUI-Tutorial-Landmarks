//
//  LandmarkList.swift
//  SwiftUI-Tutorial-Landmarks
//
//  Created by Larry Xia on 2022/1/12.
//

import SwiftUI

struct LandmarkList: View {
    //@EnvironmentObject在多个view之间共享数据，并且可以作为被观察者
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    //computed property,返回一个计算结果，只读
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    var body: some View {
        //闭包，类似lambda表达式
        NavigationView{
            List {
                //把变量绑定到开关上
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks) {  landmark in
                    //链接到别的view
                    NavigationLink{
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }.navigationTitle("Landmarks")
        }
        
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        //和ContentView一致
        LandmarkList()
            .environmentObject(ModelData())
    }
}
