//
//  ComposeViewController.swift
//  GnMemo
//
//  Created by gnun on 2020/08/19.
//  Copyright © 2020 진원 장. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
<<<<<<< HEAD
    
    var editTarget: Memo?
    var originalMemoContent: String?
    
    
    @IBAction func close(_ sender: Any) {
=======

    
    @IBAction func cancel(_ sender: Any) {
>>>>>>> 92aa63d72d33a2eedc190f3f6b06ff3efdfb2500
        
        dismiss(animated: true, completion: nil)
    }
    
<<<<<<< HEAD
    
    
    @IBOutlet weak var memoTextView: UITextView!
    
    
=======
   
    
    @IBOutlet weak var MemoTextView: UITextView!
    
 
>>>>>>> 92aa63d72d33a2eedc190f3f6b06ff3efdfb2500
    
    
    @IBAction func save(_ sender: Any) {
        
<<<<<<< HEAD
        guard let memo = memoTextView.text, memo.count > 0  else {
            alert(message: "메모를 입력하세요")
            return
            
        }
        
        //        let newMemo = Memo(content: memo)
        //        Memo.dummyMemoList.append(newMemo)
        if let target = editTarget {
            target.content = memo
            DataManager.shared.saveContext()
            NotificationCenter.default.post(name: ComposeViewController.memoDidChange, object: nil)
        } else {
            DataManager.shared.addNewMemo(memo)
            NotificationCenter.default.post(name: ComposeViewController.newMemoDidinsert, object: nil)
            // 지정된 이름, 보낸 객체로 노티피케이션을 만들어 노티피케이션 센터에 발송
        }
        
=======
        guard let memo = MemoTextView.text, memo.count > 0  else {
        alert(message: "메모를 입력하세요")
            return
                
        }
        
        let newMemo = Memo(content: memo)
        Memo.dummyMemoList.append(newMemo)
        
        NotificationCenter.default.post(name: ComposeViewController.newMemoDidinsert, object: nil)  // 지정된 이름, 보낸 객체로 노티피케이션을 만들어 노티피케이션 센터에 발송
>>>>>>> 92aa63d72d33a2eedc190f3f6b06ff3efdfb2500
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
        
        if let memo = editTarget {
            navigationItem.title =  "메모 편집"
            memoTextView.text = memo.content
            originalMemoContent = memo.content
        } else {
            navigationItem.title = "새 메모"
            memoTextView.text = ""
        }
        memoTextView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.presentationController?.delegate = self
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.presentationController?.delegate = nil
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

extension ComposeViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if let original = originalMemoContent, let edited = textView.text {
            if #available(iOS 13.0, *) {
                isModalInPresentation = original != edited
            } else {
                // Fallback on earlier versions
            }
        }
            
    }
}
extension ComposeViewController: UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidAttemptToDismiss(_ presentationController: UIPresentationController) {
        let alert = UIAlertController(title: "알림", message: "편집한 내용을 저장할까요?", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default) { [weak self] (action)  in
            self?.save(action)
        }
        alert.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel) { [weak self] (action) in
            self?.close(action)
        }
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
        
    }
=======

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

>>>>>>> 92aa63d72d33a2eedc190f3f6b06ff3efdfb2500
}


extension ComposeViewController {
    static let newMemoDidinsert = Notification.Name(rawValue: "newMemoDidInsert")
<<<<<<< HEAD
    static let memoDidChange = Notification.Name(rawValue: "memoDidChange")
=======
>>>>>>> 92aa63d72d33a2eedc190f3f6b06ff3efdfb2500
}
