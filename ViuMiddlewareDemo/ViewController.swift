//
//  ViewController.swift
//  ViuMiddlewareDemo
//
//  Created by JNWHYJ on 2021/5/17.
//

import UIKit

class ViewController: UIViewController {

    fileprivate var isTesting = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(titleLabel)
        titleLabel.frame = CGRect(x: 0, y: 10, width: 1920, height: 50)
        
        view.addSubview(homeButton)
        homeButton.frame = CGRect(x: 50, y: 100, width: 200, height: 50)
        homeButton.addTarget(self, action: #selector(showDetailsPage), for: .allEvents)
        
        testing()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        isTesting = false
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        isTesting = false
    }
    @objc fileprivate func testing(){
        if isTesting {
            showDetailsPage()
            perform(#selector(testing), with: nil, afterDelay: 5.0)
        }else{
            perform(#selector(testing), with: nil, afterDelay: 5.0)
        }
    }
    ///
    @objc public func showDetailsPage(){
        let result_:UIViewController? = MW().showDetailPage(callback: { (value) in
            print("--->show temp (\(value) )")
        })
        guard let target_ = result_ as? DetailsViewController else {
            return
        }
        topViewController().present(target_, animated: true, completion: nil)
    }
    
    /// lazy property-s
    public lazy var titleLabel:UILabel = {
        let value_ = UILabel()
        value_.backgroundColor = .white
        value_.text = "Home Page"
        value_.font = UIFont.systemFont(ofSize: 28.0)
        value_.textAlignment = .center
        value_.textColor = .red
        return value_
    }()
    public lazy var homeButton:UIButton = {
        let value_ = UIButton()
        value_.backgroundColor = .red
        return value_
    }()
    
    
    override var preferredFocusEnvironments: [UIFocusEnvironment] {
        var focus = [UIFocusEnvironment]()
        focus.append(homeButton)
        return focus
    }
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if let pre_view = context.previouslyFocusedView {
            if pre_view == homeButton {
                homeButton.backgroundColor = .red
            }
        }
        if let next_view = context.nextFocusedView {
            if next_view == homeButton {
                homeButton.backgroundColor = .red
            }
        }
    }
}

