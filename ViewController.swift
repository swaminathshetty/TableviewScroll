//
//  ViewController.swift
//  tableview2
//
//  Created by Swaminath on 1/28/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView_Main: UITableView!
    @IBOutlet weak var segmentFirst: UISegmentedControl!
    fileprivate var indexPath1Based: IndexPath = [0, 0]
    fileprivate var indexPath2Based: IndexPath = [0, 0]

    let segment1Array = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "A", "B", "C", "D", "E", "F", "G", "H", "I", "A", "B", "C", "D", "E", "F", "G", "H", "I", "A", "B", "C", "D", "E", "F", "G", "H", "I", "A", "B", "C", "D", "E", "F", "G", "H", "I"]
    let segment2Array = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "1", "2", "3", "4", "5", "6", "7", "8", "9", "1", "2", "3", "4", "5", "6", "7", "8", "9", "1", "2", "3", "4", "5", "6", "7", "8", "9", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func firstSegment(_ sender: UISegmentedControl) {
        self.tableView_Main.reloadData()
        if sender.selectedSegmentIndex == 0 {
            self.tableView_Main.scrollToRow(at: indexPath1Based as IndexPath, at: .top, animated: true)
        } else {
            self.tableView_Main.scrollToRow(at: indexPath2Based as IndexPath, at: .top, animated: true)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return segmentFirst.selectedSegmentIndex == 0 ? self.segment1Array.count : self.segment2Array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "Cell")
        cell.accessoryType = .disclosureIndicator
        if segmentFirst.selectedSegmentIndex == 0 {
            cell.textLabel?.text = segment1Array[indexPath.row]
        } else {
            cell.textLabel?.text = segment2Array[indexPath.row]
        }
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        if segmentFirst.selectedSegmentIndex == 0 {
            indexPath1Based = (self.tableView_Main.indexPathsForVisibleRows?.first)!
        } else {
            indexPath2Based = (self.tableView_Main.indexPathsForVisibleRows?.first)!
        }
    }
}
