//
//  Checker.swift
//  StorageService
//
//  Created by Сергей Топильский on 11.03.2023.
//

import UIKit

final public class Checker: LoginViewControllerDelegateProtocol {

    static public let shared: LoginViewControllerDelegateProtocol = Checker()

        private let login = "HCL"
        private let password = "123"

        private init() { }

        public func check(login: String, password: String) -> Bool {
            return login == self.login && password == self.password
        }
}











//protocol Service0Protocol {
//    func doSomeForService0()
//}
//
//class Service0: Service0Protocol {
//    func doSomeForService0() {}
//}
//
//protocol Service1Protocol {
//    func doSomeForService1()
//}
//
//class Service1: Service1Protocol {
//    func doSomeForService1() {}
//}
//
//protocol SingletonProtocol {
//    func doSome()
//
//    var service0: Service0Protocol { get }
//}
//
//final class SingletonWithServices: SingletonProtocol {
//
//    static let shared: SingletonProtocol = SingletonWithServices()
//
//    lazy var service0: Service0Protocol = Service0()
//    lazy var service1: Service1Protocol = Service1()
//
//    private init () {}
//
//    func doSome () {}
//}
//
//
//final class VC: UIViewController {
//
//    private let serviceManager: SingletonProtocol
//    let presenter: Presenter
//
//    init(with serviceManager: SingletonProtocol) {
//        super.init(nibName: nil, bundle: nil)
//        self.serviceManager = serviceManager
//
//    }
//
//    required init?(coder: NSCoder) {
//        self.serviceManager = SingletonWithServices.shared
//        presenter = Presenter(service: serviceManager.service0)
//
//        super.init(coder: coder)
//
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        SingletonWithServices.shared.doSome()
//        presenter.doSomePresentation()
//    }
//}
//
//final class Presenter {
//
//    private let service: Service0Protocol
//
//    init(service: Service0Protocol) {
//        self.service = service
//    }
//
//    func doSomePresentation() {
//        SingletonWithServices.shared.service0.doSomeForService0()    }
//}
