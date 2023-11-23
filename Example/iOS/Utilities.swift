import Foundation
import SwiftUI

let colors: [Color] = [
    .red,
    .orange,
    .yellow,
    .green,
    .blue,
    .indigo,
    .purple,
    .pink,
    .cyan,
    .teal,
    .mint,
]

func colorWheel(radius: Int) -> Color {
    Color(hue: Double(radius % 360) / 360, saturation: 1, brightness: 1)
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
    func scrollDisabledBackport(_ disabled: Bool) -> some View {
        if #available(iOS 16, *) {
            self.scrollDisabled(disabled)
        } else {
            self
        }
    }
}
