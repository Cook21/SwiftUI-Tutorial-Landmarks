//
//  ProfileHost.swift
//  SwiftUI-Tutorial-Landmarks
//
//  Created by Larry Xia on 2022/1/24.
//

import SwiftUI

struct ProfileHost: View {
    //保存临时数据，便于用户改完了再上传到服务器
    @State private var draftProfile = Profile.default
    //访问当前视图的.editMode成员并储存到一个变量里，该成员表示Edit按钮有没有被激活
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                //留一个取消按钮，让用户选择撤销更改
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        //退出编辑状态
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton() //swiftui自带组件
            }
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost().environmentObject(ModelData())
    }
}
