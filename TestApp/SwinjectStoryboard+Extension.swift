//
//  SwinjectStoryboard+Extension.swift
//  TestApp
//
//  Created by Vitalii Sydorskyi on 1/21/20.
//  Copyright © 2020 Vitalii Sydorskyi. All rights reserved.
//

import Swinject
import SwinjectStoryboard
import SwinjectAutoregistration

final class ApplicationAssembly {
    
    class var assembler: Assembler {
        
        let networkService = NetworkService()
        
        return Assembler([
            MainViewAssembly(network: networkService),
            SearchCityAssembly(network: networkService),
            MapAssembler(network: networkService)
        ])
    }
    
    var assembler: Assembler
    
    init(with assemblies: [Assembly]) {
        assembler = Assembler(assemblies)
    }
}

// Inject dependency in Main Storyboard
extension SwinjectStoryboard {
    @objc class func setup() {
        
        defaultContainer = ApplicationAssembly.assembler.resolver as! Container
        Container.loggingFunction = nil
        
    }
}
