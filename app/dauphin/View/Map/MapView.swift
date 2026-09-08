@preconcurrency import MapKit
import SwiftUI

struct MapView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @State private var position: MapCameraPosition = .camera(
        .init(
            centerCoordinate: .init(latitude: 25.17553, longitude: 121.45063), distance: 1600,
            heading: 90, pitch: 35))
    @State private var selectedLocation: L2GData?
    @State private var overviewPosition: MapCameraPosition?
    @State private var isLocationListPresented = (UIDevice.current.userInterfaceIdiom != .phone)
    @State private var detailSheetDetent: PresentationDetent = .fraction(0.39)
    @State private var shouldRestoreOverviewOnDetailDismiss = true

    var body: some View {
        if horizontalSizeClass == .regular {
            let columnVisibilityBinding = Binding<NavigationSplitViewVisibility>(
                get: {
                    isLocationListPresented ? .all : .detailOnly
                },
                set: { newVisibility in
                    isLocationListPresented = (newVisibility != .detailOnly)
                }
            )

            // iPad/Mac layout with sidebar
            NavigationSplitView(columnVisibility: columnVisibilityBinding) {
                LocationListView(
                    locations: campusLocations,
                    didClose: { isLocationListPresented = false },
                    didSelect: { location in
                        selectLocation(location)
                    }
                )
                    .presentationDragIndicator(.hidden)
                    .toolbar(removing: .sidebarToggle)
            } detail: {
                Map(position: $position) {
                    ForEach(campusLocations) { location in
                        let isSelected = selectedLocation?.id == location.id
                        
                        Annotation(location.name, coordinate: location.coordinate, anchor: .bottom) {
                            Button {
                                shouldRestoreOverviewOnDetailDismiss = true
                                selectLocation(location)
                            } label: {
                                Image(systemName: "mappin.circle.fill").font(isSelected ? .title : .title2)
                                    .foregroundStyle(isSelected ? .red : .secondary).shadow(
                                        radius: isSelected ? 3 : 1)
                            }.accessibilityLabel(Text(verbatim: "\(location.name) \(location.code)"))
                                .accessibilityHint(Text("Show location details")).accessibilityIdentifier(
                                    "map.annotation.\(location.code)"
                                ).buttonStyle(.plain)
                        }
                    }
                }.mapStyle(.standard).mapControls {
                    MapCompass()
                    MapPitchToggle()
                    MapScaleView()
                }.safeAreaInset(edge: .leading) {
                    if isLocationListPresented == false {
                        VStack {
                            Button(
                                action: { isLocationListPresented = true }
                            ) {
                                Label("Locations", systemImage: "list.bullet")
                            }
                            .buttonStyle(.borderedProminent)
                            .padding(.horizontal, 16)
                            .padding(.bottom, 12)

                            Spacer()
                        }
                    }
                }
                .inspector(isPresented: Binding(get: {selectedLocation != nil}, set: {_ in })) {
                    if let location = selectedLocation {
                        MarkerDetailView(
                            layout: .inspector,
                            location: location,
                            didClearSelection: {
                                selectedLocation = nil
                            },
                            didReturnToList: returnToLocationList
                        )
                            .presentationBackgroundInteraction(.enabled)
                    }
                }
                .toolbar(.hidden)
            }
            .navigationSplitViewStyle(.balanced)
        } else {
            Map(position: $position) {
                ForEach(campusLocations) { location in
                    let isSelected = selectedLocation?.id == location.id
                    
                    Annotation(location.name, coordinate: location.coordinate, anchor: .bottom) {
                        Button {
                            shouldRestoreOverviewOnDetailDismiss = true
                            selectLocation(location)
                        } label: {
                            Image(systemName: "mappin.circle.fill").font(isSelected ? .title : .title2)
                                .foregroundStyle(isSelected ? .red : .secondary).shadow(
                                    radius: isSelected ? 3 : 1)
                        }.accessibilityLabel(Text(verbatim: "\(location.name) \(location.code)"))
                            .accessibilityHint(Text("Show location details")).accessibilityIdentifier(
                                "map.annotation.\(location.code)"
                            ).buttonStyle(.plain)
                    }
                }
            }.mapStyle(.standard).mapControls {
                MapCompass()
                MapPitchToggle()
                MapScaleView()
            }.safeAreaInset(edge: .bottom) {
                HStack {
                    Spacer()
                    Button {
                        isLocationListPresented = true
                    } label: {
                        Label("Locations", systemImage: "list.bullet")
                    }.buttonStyle(.borderedProminent).padding(.horizontal, 16).padding(.bottom, 12)
                }
            }.sheet(item: $selectedLocation, onDismiss: restoreOverviewCamera) { location in
                MarkerSheetView(
                    location: location,
                    didClearSelection: { selectedLocation = nil },
                    didReturnToList: returnToLocationList
                ).presentationDetents([.fraction(0.39), .medium], selection: $detailSheetDetent)
                    .presentationDragIndicator(.hidden)
            }.sheet(isPresented: $isLocationListPresented) {
                LocationListView(
                    locations: campusLocations, didClose: { isLocationListPresented = false },
                    didSelect: { location in
                        isLocationListPresented = false
                        selectLocation(location)
                    }
                ).presentationDragIndicator(.hidden)
            }
        }
    }

    private func selectLocation(_ location: L2GData) {
        withAnimation(.easeInOut(duration: 0.2)) {
            if selectedLocation == nil { overviewPosition = position }
            detailSheetDetent = .fraction(0.39)
            selectedLocation = location
            position = focusedPosition(for: location)
        }
    }

    private func focusedPosition(for location: L2GData) -> MapCameraPosition {
        .camera(.init(centerCoordinate: location.coordinate, distance: 500, heading: 0, pitch: 35))
    }

    private func restoreOverviewCamera() {
        if shouldRestoreOverviewOnDetailDismiss, let overviewPosition {
            withAnimation(.easeInOut(duration: 0.2)) { position = overviewPosition }
        }
        shouldRestoreOverviewOnDetailDismiss = true
        self.overviewPosition = nil
    }

    private func returnToLocationList() {
        shouldRestoreOverviewOnDetailDismiss = false
        selectedLocation = nil
        isLocationListPresented = true
    }
}

#Preview { MapView() }
