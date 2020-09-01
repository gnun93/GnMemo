//
//  DetailViewController.swift
//  GnMemo
//
//  Created by gnun on 2020/08/20.
//  Copyright © 2020 진원 장. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

<<<<<<< HEAD
    @IBOutlet weak var memoTableView: UITableView!
    
    var memo: Memo?
    
    
    
    
    
=======
    
    var memo: Memo?
    
>>>>>>> 92aa63d72d33a2eedc190f3f6b06ff3efdfb2500
    let formatter: DateFormatter = {
    let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        f.locale = Locale(identifier: "Ko_kr")
        return f
    }()
    
<<<<<<< HEAD
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination.children.first as? ComposeViewController{
        // destination : 세그의 대상 뷰컨트롤러
        // children : 현재 뷰컨트롤러의 자식인 뷰 컨트롤러의 배열
            vc.editTarget = memo
        }
    }
    
    var token: NSObjectProtocol?
    
    deinit {
        if let token  = token {
            NotificationCenter.default.removeObserver(token)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        token = NotificationCenter.default.addObserver(forName: ComposeViewController.memoDidChange, object: nil, queue: OperationQueue.main, using: { [weak self] (noti) in
            self?.memoTableView.reloadData()
        })
=======
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
>>>>>>> 92aa63d72d33a2eedc190f3f6b06ff3efdfb2500
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
<<<<<<< HEAD
=======

>>>>>>> 92aa63d72d33a2eedc190f3f6b06ff3efdfb2500
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:
        IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell", for: indexPath)
            
            cell.textLabel?.text = memo?.content
            
            
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell", for: indexPath)
            
            
            cell.textLabel?.text = formatter.string(for: memo?.insertDate)
            
            return cell
            
        default:
            fatalError()   // 주어진 메시지를 무조건 인쇄하고 실행을 중지

        }
    }
    
 }
