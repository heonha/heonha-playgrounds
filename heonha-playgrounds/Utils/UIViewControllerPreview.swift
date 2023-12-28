//
//  UIViewControllerPreview.swift
//  chart-practice
//
//  Created by HeonJin Ha on 10/4/23.
//


#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct UIViewControllerPreview<BarChartViewController: UIViewController>: UIViewControllerRepresentable {
    
    let viewController: BarChartViewController
    
    init(_ builder: @escaping () -> BarChartViewController) {
        viewController = builder()
    }
    
    // MARK: - UIViewControllerRepresentable
    func makeUIViewController(context: Context) -> BarChartViewController {
        viewController
    }
    
    func updateUIViewController(_ uiViewController: BarChartViewController, context: Context) {
        
    }
}
#endif
