import Foundation

enum CongruentScrollingHStackLayout {

    case columns(Int, trailingInset: CGFloat)
    case fractionalColumns(CGFloat)
    case minimumWidth(CGFloat)
    case selfSizing
}
