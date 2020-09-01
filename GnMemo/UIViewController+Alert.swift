//
//  UIViewController+Alert.swift
//  GnMemo
//
//  Created by gnun on 2020/08/20.
//  Copyright © 2020 진원 장. All rights reserved.
//

import UIKit

extension UIViewController {
    func alert(title: String = "알림", message: String) {
    
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        
<<<<<<< HEAD
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
        
=======
>>>>>>> 92aa63d72d33a2eedc190f3f6b06ff3efdfb2500
    }
}
