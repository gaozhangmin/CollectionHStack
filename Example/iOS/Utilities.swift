import Foundation
import SwiftUI

let colors: [Color] = [
    .pink,
    .orange,
    .yellow,
    .green,
    .blue,
    .indigo,
    .purple,
]

func colorWheel(radius: Int) -> Color {
    Color(hue: Double(radius) / 360, saturation: 1, brightness: 1)
}

extension Array {

    subscript(mod i: Int) -> Element {
        self[i % count]
    }

    func random(in range: Range<Int>) -> [Element] {
        shuffled()
            .prefix(Int.random(in: range))
            .shuffled()
    }
}

extension View {

    @ViewBuilder
    @inlinable
    func `if`(_ condition: Bool, transform: (Self) -> some View) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }

    @ViewBuilder
    func scrollDisabledBackport(_ disabled: Bool) -> some View {
        if #available(iOS 16, *) {
            self.scrollDisabled(disabled)
        } else {
            self
        }
    }
}

protocol InterfaceIdiomView: View {

    associatedtype iPadBody: View
    associatedtype iPhoneBody: View

    var iPadBody: iPadBody { get }
    var iPhoneBody: iPhoneBody { get }
}

extension InterfaceIdiomView {

    var body: some View {
        if UIDevice.current.userInterfaceIdiom == .pad {
            AnyView(self.iPadBody)
        } else {
            AnyView(self.iPhoneBody)
        }
    }
}
