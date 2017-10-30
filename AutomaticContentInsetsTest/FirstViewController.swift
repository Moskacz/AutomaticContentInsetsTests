//
//  FirstViewController.swift
//  AutomaticContentInsetsTest
//
//  Created by Michal Moskala on 30.10.2017.
//  Copyright © 2017 Michal Moskala. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    private func setupTableView() {
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    fileprivate func cellColor(row: Int) -> UIColor {
        let normalizedRow = row % colors.count
        return colors[normalizedRow]
    }
    
    private lazy var colors = [#colorLiteral(red: 1, green: 0.8016421199, blue: 0.3784946501, alpha: 1), #colorLiteral(red: 0.3313965797, green: 0.8434479833, blue: 1, alpha: 1), #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)]
}

extension FirstViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = "{\(indexPath.section)}{\(indexPath.row)}"
        cell.contentView.backgroundColor = cellColor(row: indexPath.row)
        return cell
    }
}

extension FirstViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(section)"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondVC = storyboard!.instantiateViewController(withIdentifier: "SecondViewController")
        secondVC.automaticallyAdjustsScrollViewInsets = false
        show(secondVC, sender: self)
    }
}

