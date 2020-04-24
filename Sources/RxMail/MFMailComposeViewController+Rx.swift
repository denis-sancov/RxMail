//
//  MFMailComposeViewController+Rx.swift
//  FinComPay
//
//  Created by Denis Sancov on 4/24/20.
//  Copyright © 2020 FinComBank. All rights reserved.
//

import RxSwift
import RxCocoa
import MessageUI

extension Reactive where Base: MFMailComposeViewController {
    var mailDelegate: MailDelegateProxy {
        return MailDelegateProxy.proxy(for: base)
    }

    var didFinish: Observable<MFMailComposeResult> {
        return mailDelegate
            .methodInvoked(
                #selector(MFMailComposeViewControllerDelegate.mailComposeController(_:didFinishWith:error:))
            )
            .map { a in
                return a[1] as! MFMailComposeResult
            }
    }
}
