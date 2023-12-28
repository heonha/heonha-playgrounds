//
//  ViewController.swift
//  chart-practice
//
//  Created by HeonJin Ha on 10/4/23.
//

import UIKit
import DGCharts

class BarChartViewController: UIViewController {
    
    // MARK: Main View
    private lazy var barChartView: BarChartView = createChart()

    override func viewDidLoad() {
        super.viewDidLoad()
        chartAxis()
        configureLegend()
        setData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layout()
    }
    
    private func layout() {
        view.addSubview(barChartView)
    }
    
    // MARK: - Chart View 생성
    private func createChart() -> BarChartView {
        
        let width = view.frame.size.width
        let frame = CGRect(x: 0, y: 0, width: width, height: width)
        let barChartView = BarChartView(frame: frame)
        barChartView.center = view.center
        barChartView.fitBars = true
        barChartView.delegate = self
        return barChartView
    }
    
    // MARK: - Axis Layout : 범례 객체
    private func chartAxis() {
        // MARK: AXIS (선 / font, line, color 등등 구성 변경)
        let xAxis = barChartView.xAxis
        xAxis.gridLineWidth = 0
        
        let rightAxis = barChartView.rightAxis
        rightAxis.gridColor = .blue
        rightAxis.gridLineWidth = 0

        let leftAxis = barChartView.leftAxis
        leftAxis.gridColor = .red
        leftAxis.gridLineWidth = 0
    }
    
    // MARK: - `Legend`: 범례 객체
    private func configureLegend() {
        let legend = barChartView.legend
        legend.form = .circle
        legend.direction = .rightToLeft
      
    }
    
    // MARK: - DATA ENTRY (데이터)
    private func setData() {
        var entries = [BarChartDataEntry]()
        for x in 0..<10 {
            let entry = BarChartDataEntry(x: Double(x),
                                          y: Double.random(in: 0...30))
            entries.append(entry)
        }
        
        // MARK: SET
        let set = BarChartDataSet(entries: entries, label: "Cost")
        set.colors = ChartColorTemplates.material()
        
        // MARK: DATA
        let data = BarChartData(dataSet: set)
        data.barWidth = 0.8
        data.isHighlightEnabled = true
        
        // 데이터 적용
        barChartView.data = data
    }

}

// MARK: - Chart View DELEGATE
extension BarChartViewController: ChartViewDelegate {
    
}

// MARK: - Previewer
#if DEBUG
import SwiftUI
import DGCharts

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            BarChartViewController()
        }
        .ignoresSafeArea()
    }
}
#endif

