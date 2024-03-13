import SwiftUI

public extension CollectionHStack {

    func allowBouncing(_ value: Bool) -> Self {
        copy(modifying: \.allowBouncing, to: .constant(value))
    }

    func allowBouncing(_ binding: Binding<Bool>) -> Self {
        copy(modifying: \.allowBouncing, to: binding)
    }

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

    func dataPrefix(_ prefix: Int?) -> Self {
        copy(modifying: \.dataPrefix, to: .constant(prefix))
    }

    func dataPrefix(_ binding: Binding<Int?>) -> Self {
        copy(modifying: \.dataPrefix, to: binding)
    }

    // TODO: add once behavior defined
//    func didScrollToElements(_ action: @escaping ([Element]) -> Void) -> Self {
//        copy(modifying: \.didScrollToElements, to: action)
//    }

    func insets(_ insets: EdgeInsets) -> Self {
        copy(modifying: \.insets, to: insets)
    }

    func insets(horizontal: CGFloat = 0, vertical: CGFloat = 0) -> Self {
        copy(modifying: \.insets, to: .init(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal))
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

    func proxy(_ proxy: CollectionHStackProxy<Element>) -> Self {
        copy(modifying: \.proxy, to: proxy)
    }

    func scrollBehavior(_ scrollBehavior: CollectionHStackScrollBehavior) -> Self {
        copy(modifying: \.scrollBehavior, to: scrollBehavior)
    }
}
