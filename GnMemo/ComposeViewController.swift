//
//  ComposeViewController.swift
//  GnMemo
//
//  Created by gnun on 2020/08/19.
//  Copyright © 2020 진원 장. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    
    @IBAction func cancel(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
   
    
    @IBOutlet weak var MemoTextView: UITextView!
    
 
    
    
    @IBAction func save(_ sender: Any) {
        
        guard let memo = MemoTextView.text, memo.count > 0  else {
        alert(message: "메모를 입력하세요")
            return
                
        }
        
        let newMemo = Memo(content: memo)
        Memo.dummyMemoList.append(newMemo)
        
        NotificationCenter.default.post(name: ComposeViewController.newMemoDidinsert, object: nil)  // 지정된 이름, 보낸 객체로 노티피케이션을 만들어 노티피케이션 센터에 발송
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension ComposeViewController {
    static let newMemoDidinsert = Notification.Name(rawValue: "newMemoDidInsert")
}
