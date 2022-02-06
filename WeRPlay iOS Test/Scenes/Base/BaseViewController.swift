//
//  BaseViewController.swift
//  WeRPlay iOS Test
//
//  Created by Muneeb on 05/02/2022.
//

import Foundation
import UIKit


typealias success = (Bool) -> Void


class BaseViewController: UIViewController {
    
    //MARK: - Variables
    
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        setViewUI()
        bindViews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //MARK: - Setup Methods
    func setViewUI() {
    }
    
    func bindViews() {
    }
}
