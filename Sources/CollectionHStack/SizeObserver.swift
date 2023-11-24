import SwiftUI

// TODO: also pass in safe area insets?

class SizeObserver: ObservableObject {

    var onSizeChanged: (CGSize) -> Void

    init() {
        self.onSizeChanged = { _ in }
    }
}

struct SizeObserverView: UIViewControllerRepresentable {

    let sizeObserver: SizeObserver

    func makeUIViewController(context: Context) -> some UIViewController {
        SizeObserverViewController(sizeObserver: sizeObserver)
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}

class SizeObserverViewController: UIViewController {

    let sizeObserver: SizeObserver

    init(sizeObserver: SizeObserver) {
        self.sizeObserver = sizeObserver
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        sizeObserver.onSizeChanged(size)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Necessary as this is the first size call
        // I don't believe this is the same size that you will get from `viewWillTransition` but it works
        sizeObserver.onSizeChanged(view.bounds.size)
    }
}
