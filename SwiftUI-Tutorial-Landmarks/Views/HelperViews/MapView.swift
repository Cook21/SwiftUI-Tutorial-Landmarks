//
//  MapView.swift
//  SwiftUI-Tutorial-Landmarks
//
//  Created by Larry Xia on 2022/1/12.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    //加上@State之后就能在不止一个view中修改
    @State private var region = MKCoordinateRegion()
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
    var body: some View {
        //By prefixing a state variable with $, you pass a binding, which is like a reference to the underlying value. When the user interacts with the map, the map updates the region value
        Map(coordinateRegion: $region)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
