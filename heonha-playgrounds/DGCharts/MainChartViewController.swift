//
//  MainChartViewController.swift
//  chart-practice
//
//  Created by HeonJin Ha on 10/4/23.
//

import UIKit

final class MainChartViewController: UITabBarController {
    
    private let barChartVC = BarChartViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    private func configure() {
        self.view.backgroundColor = .systemBackground
        
        self.tabBar.tintColor = .label
        
        let barChartNC = UINavigationController(rootViewController: barChartVC)
        let barChartItem = UITabBarItem(title: "BarChart", image: UIImage(systemName: "chart.bar.xaxis"), tag: 0)
        barChartNC.tabBarItem = barChartItem
        self.viewControllers = [barChartNC]
    }
    
}
