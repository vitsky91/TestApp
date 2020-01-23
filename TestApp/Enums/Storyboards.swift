//
//  Storyboards.swift
//  MyWeather
//
//  Created by Vitalii Sydorskyi on 1/20/20.
//  Copyright © 2020 Vitalii Sydorskyi. All rights reserved.
//
import UIKit

enum Storyboard: String {
    
    //place storyboard name's, to have one place for changing if needed
    case MainViewController = "MainViewController"
    
    func storyboard() -> UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: nil)
    }
    
    func initialController() -> UIViewController? {
        let storyboard = UIStoryboard(name: self.rawValue, bundle: nil)
        let initialController = storyboard.instantiateInitialViewController()
        return initialController
    }
    
    func viewControllerWithID(_ identifier: ViewControllerID) -> UIViewController {
        return storyboard().instantiateViewController(withIdentifier: identifier.rawValue)
    }
    
    struct SegueID {
        //place here segues id's, to have one place for changing if needed
        static let formA = "FormA"
        static let formB = "FormB"
    }
    
    enum ViewControllerID: String {
        //place here ViewController id's, to have one place for changing if needed
        
        case mainVC = "mainVC"
    }
    
    func show() {
        guard let controller = self.initialController() else { return }
        (UIApplication.shared.keyWindow?.rootViewController as? UINavigationController)?.show(controller, sender: nil)
    }
}
