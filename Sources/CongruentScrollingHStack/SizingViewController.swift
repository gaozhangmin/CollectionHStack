import SwiftUI

class MySizedView: UIView {

    private var effectiveWidth: CGFloat = 100

    let myObject: MyObject

    override var intrinsicContentSize: CGSize {
        .init(width: effectiveWidth, height: 200)
    }

    init(myObject: MyObject) {
        self.myObject = myObject
        super.init(frame: .zero)

        myObject.onTransition = { newSize in
            self.effectiveWidth = newSize.width / 2
            self.layoutSubviews()
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        print("Sized view layout")
        invalidateIntrinsicContentSize()
    }
}

class SizingViewController: UIViewController {

    let myObject: MyObject

    init(myObject: MyObject) {
        self.myObject = myObject
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        print("will transition to: \(size)")
        myObject.onTransition(size)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // I don't believe this is the same size that you will get from `viewWillTransition` but it works
        myObject.onTransition(view.bounds.size)
    }
}

// to just basically detect when `layoutSubviews` is called
struct LayoutDetectionView: UIViewRepresentable {

    let myObject: MyObject

    func makeUIView(context: Context) -> some UIView {
        let a = MySizedView(myObject: myObject)
        a.backgroundColor = .red
        a.translatesAutoresizingMaskIntoConstraints = false
        a.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        a.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return a
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

struct SizingView: UIViewControllerRepresentable {

    let myObject: MyObject

    func makeUIViewController(context: Context) -> some UIViewController {
        SizingViewController(myObject: myObject)
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        print("update called")
    }
}

class MyObject: ObservableObject {

    init() {
        self.onTransition = { _ in }
    }

    var onTransition: (CGSize) -> Void
}

struct TestView: View {

    @StateObject
    private var myObject = MyObject()

    var body: some View {
        ZStack {
            SizingView(myObject: myObject)

            LayoutDetectionView(myObject: myObject)
        }
    }
}
