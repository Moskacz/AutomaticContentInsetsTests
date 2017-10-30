//
//  ThirdViewController.swift
//  AutomaticContentInsetsTest
//
//  Created by Michal Moskala on 30.10.2017.
//  Copyright © 2017 Michal Moskala. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "third"
        addChildController()
    }
    
    private func addChildController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let childVC = storyboard.instantiateViewController(withIdentifier: "ChildViewController")
        addChildViewController(childVC)
        childVC.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(childVC.view)
        NSLayoutConstraint.activate([
            childVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            childVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            childVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            childVC.view.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        childVC.didMove(toParentViewController: self)
    }
}
