import MapKit
import SwiftUI

enum MarkerDetailViewLayout: String, CaseIterable {
    case sheet
    case inspector
}

struct MarkerDetailView: View {
    let layout: MarkerDetailViewLayout
    let location: L2GData
    let didClearSelection: () -> Void
    let didReturnToList: () -> Void

    var body: some View {
        let landmarkViewLayout: LandmarkViewLayout =
            switch layout {
            case .sheet:
                .hstack
            case .inspector:
                .vstack
            }

        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    if layout == .inspector {
                        HStack {
                            Text(location.name)
                                .font(.headline)

                            Spacer()

                            Button(action: didClearSelection) {
                                Image(systemName: "xmark")
                            }
                            .accessibilityLabel(
                                Text("Close")
                            )
                            .accessibilityIdentifier("map.detail.close")
                        }
                    }

                    Text(
                        verbatim: (
                            location.code == "ZZZ"
                                ? ""
                                : location.code
                        )
                    )
                        .font(.subheadline)
                        .foregroundStyle(.secondary)

                    LandmarkView(
                        layout: landmarkViewLayout,
                        coordinate: location.coordinate,
                        didReturnToList: didReturnToList
                    )
                }
                .padding(.horizontal, 24)
                .padding(.top, 12)
            }
        }
        .accessibilityIdentifier("map.markerSheet.\(location.code)")
    }
}

struct MarkerSheetView: View {
    let location: L2GData
    let didClearSelection: () -> Void
    let didReturnToList: () -> Void

    var body: some View {
        NavigationStack {
            MarkerDetailView(
                layout: .sheet,
                location: location,
                didClearSelection: didClearSelection,
                didReturnToList: didReturnToList
            )
                .navigationTitle(location.name)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: didClearSelection) {
                            Image(systemName: "xmark")
                        }
                        .accessibilityLabel(
                            Text("Close")
                        )
                        .accessibilityIdentifier("map.detail.close")
                    }
                }
        }
    }
}

#Preview("MarkerSheetView") {
    MarkerSheetView(
        location: L2GData(
            code: "ZZZ",
            name: "書卷廣場",
            coordinate: CLLocationCoordinate2D(latitude: 25.17553, longitude: 121.45063)),
        didClearSelection: {},
        didReturnToList: {}
    )
}
