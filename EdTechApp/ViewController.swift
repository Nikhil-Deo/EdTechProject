//
//  ViewController.swift
//  EdTechApp
//
//  Created by Nikhil Deo on 11/15/19.
//  Copyright © 2019 LexTalk. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {
    @IBOutlet weak var lineChart: LineChartView!
    var dbArr:[Double]  = [0.0]
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func startButton(_ sender: Any) {
//        var num = appDelegate.dataPointsToTrack
//        for i in 0 ... num {
//            dbArr.append(Double(appDelegate.queue[i]))
//            updateGraph()
//            num += 1
//            if (dbArr.count > 99) {
//                dbArr.remove(at: dbArr.startIndex)
//            }
//        }
        while (appDelegate.queue.count < 10000) {
            for i in appDelegate.queue {
                dbArr.append(Double(i))
            }
            updateGraph();
        }
    }
    
    func updateGraph() {
        var LineChartEntry = [ChartDataEntry]()
        for i in 0..<dbArr.count {
            let val = ChartDataEntry(x: Double(i), y: dbArr[i])
            LineChartEntry.append(val)
        }
        let line1 = LineChartDataSet(entries: LineChartEntry, label: "Test")
        line1.colors = [NSUIColor.blue]
        
        let data = LineChartData()
        data.addDataSet(line1)
        
        lineChart.data = data
    }
    

}

