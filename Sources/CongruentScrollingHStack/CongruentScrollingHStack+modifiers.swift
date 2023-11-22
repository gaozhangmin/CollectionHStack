import SwiftUI

public extension CongruentScrollingHStack {

    func allowScrolling(_ value: Bool) -> Self {
        copy(modifying: \.allowScrolling, to: .constant(value))
    }

    func allowScrolling(_ binding: Binding<Bool>) -> Self {
        copy(modifying: \.allowScrolling, to: binding)
    }

    func asCarousel() -> Self {
        copy(modifying: \.isCarousel, to: true)
    }

    func clipsToBounds(_ value: Bool) -> Self {
        copy(modifying: \.clipsToBounds, to: value)
    }

    func didScrollToItems(_ action: @escaping ([Item]) -> Void) -> Self {
        copy(modifying: \.didScrollToItems, to: action)
    }

    func horizontalInset(_ inset: CGFloat) -> Self {
        copy(modifying: \.horizontalInset, to: inset)
    }

    func itemSpacing(_ spacing: CGFloat) -> Self {
        copy(modifying: \.itemSpacing, to: spacing)
    }

    func onReachedLeadingEdge(offset: CGFloat = 0, _ action: @escaping () -> Void) -> Self {
        copy(modifying: \.onReachedLeadingSide, to: action)
            .copy(modifying: \.onReachedLeadingSideOffset, to: offset)
    }

    func onReachedTrailingEdge(offset: CGFloat = 0, _ action: @escaping () -> Void) -> Self {
        copy(modifying: \.onReachedTrailingEdge, to: action)
            .copy(modifying: \.onReachedTrailingEdgeOffset, to: offset)
    }

    func scrollBehavior(_ scrollBehavior: CongruentScrollingHStackScrollBehavior) -> Self {
        copy(modifying: \.scrollBehavior, to: scrollBehavior)
    }

    func verticalInsets(top: CGFloat = 0, bottom: CGFloat = 0) -> Self {
        copy(modifying: \.bottomInset, to: bottom)
            .copy(modifying: \.topInset, to: top)
    }
}
