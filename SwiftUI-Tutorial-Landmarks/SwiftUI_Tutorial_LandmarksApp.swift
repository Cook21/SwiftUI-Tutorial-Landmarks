//
//  SwiftUI_Tutorial_LandmarksApp.swift
//  SwiftUI-Tutorial-Landmarks
//
//  Created by Larry Xia on 2022/1/12.
//

import SwiftUI

@main
//
struct SwiftUI_Tutorial_LandmarksApp: App {
    //@StateObject让成员在对象生命周期内只初始化一次
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(modelData)
        }
    }
}
