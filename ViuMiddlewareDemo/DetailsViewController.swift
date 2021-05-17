//
//  DetailsViewController.swift
//  ViuMiddlewareDemo
//
//  Created by JNWHYJ on 2021/5/17.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController {
    /// property-s
    fileprivate var isTesting = true
    /// vc actions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(titleLabel)
        titleLabel.frame = CGRect(x: 0, y: 10, width: 1920, height: 50)
        
        view.addSubview(backButton)
        backButton.frame = CGRect(x: 50, y: 100, width: 200, height: 50)
        backButton.addTarget(self, action: #selector(didBack), for: .allEvents)
    
        testing()
    }
    deinit {
        TLog()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        isTesting = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        isTesting = false
        DetailsViewController.cancelPreviousPerformRequests(withTarget: self)
    }
    /// testing
    @objc fileprivate func testing(){
        if isTesting {
            didBack()
            perform(#selector(testing), with: nil, afterDelay: 5.0)
        }
    }
    /// event actions
    @objc public func didBack(){
        dismiss(animated: true, completion: nil)
    }
    
    /// lazy property-s
    public lazy var titleLabel:UILabel = {
        let value_ = UILabel()
        value_.backgroundColor = .white
        value_.text = "Detail page"
        value_.font = UIFont.systemFont(ofSize: 28.0)
        value_.textAlignment = .center
        value_.textColor = .red
        return value_
    }()
    public lazy var backButton:UIButton = {
        let value_ = UIButton()
        value_.backgroundColor = .green
        return value_
    }()
    
    /// focus actions
    override var preferredFocusEnvironments: [UIFocusEnvironment] {
        var focus = [UIFocusEnvironment]()
        focus.append(backButton)
        return focus
    }
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if let pre_view = context.previouslyFocusedView {
            if pre_view == backButton {
                backButton.backgroundColor = .green
            }
        }
        if let next_view = context.nextFocusedView {
            if next_view == backButton {
                backButton.backgroundColor = .green
            }
        }
    }
}
