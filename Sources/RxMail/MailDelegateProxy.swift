//
//  MailDelegateProxy.swift
//  FinComPay
//
//  Created by Denis Sancov on 4/24/20.
//  Copyright © 2020 FinComBank. All rights reserved.
//

import RxSwift
import RxCocoa
import MessageUI

typealias ProxyType = DelegateProxy<MFMailComposeViewController, MFMailComposeViewControllerDelegate>

final class MailDelegateProxy: ProxyType, DelegateProxyType, MFMailComposeViewControllerDelegate {
    
    static func currentDelegate(
        for object: MFMailComposeViewController) -> MFMailComposeViewControllerDelegate?
    {
        return object.mailComposeDelegate
    }
    
    static func setCurrentDelegate(
        _ delegate: MFMailComposeViewControllerDelegate?,
        to object: MFMailComposeViewController)
    {
        object.mailComposeDelegate = delegate
    }
    

    init(parentObject: MFMailComposeViewController) {
        super.init(parentObject: parentObject, delegateProxy: MailDelegateProxy.self)
    }

    static func registerKnownImplementations() {
        self.register { MailDelegateProxy(parentObject: $0) }
    }
}
