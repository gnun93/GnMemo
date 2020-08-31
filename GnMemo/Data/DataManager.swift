//
//  DataManager.swift
//  GnMemo
//
//  Created by 장진원 on 2020/08/31.
//  Copyright © 2020 진원 장. All rights reserved.
//

import Foundation
import CoreData

class DataManager {
    static let shared = DataManager()
    private init() {       // 싱글톤 앱 전체에서 하나의 인스턴스를 공유
        
    }
    
    var mainContenxt: NSManagedObjectContext {
        //managed objects를 생성하고, Core Data 저장소에서 무엇이든 저장하고, 가져오는(fetch) 작업같은 걸 제공
        return persistentContainer.viewContext
        // 관리되는 객체 컨텍스트
        // 영구 컨테이너의 뷰 컨텍스트 객체를 반환, 이 뷰 컨텍스트는 ManagedObjectContext 클래스 유형의 속성 이름입니다
    }
    
    
    var memoList = [Memo]()
        func fetchMemo() {
            let request: NSFetchRequest<Memo> = Memo.fetchRequest()
            //NSFetchRequest는 코어 데이터에서 가져 오는 역할을 담당하는 클래스
            let sortByDateDesc = NSSortDescriptor(key: "insertDate", ascending: false)
            request.sortDescriptors = [sortByDateDesc]
            
            do {
                memoList = try mainContenxt.fetch(request)
            } catch {
                print(error)
                
            }
            
        }
    
    
    func addNewMemo(_ memo: String) {
        let newMemo = Memo(context: mainContenxt)
        newMemo.content = memo
        newMemo.insertDate = Date()
        
        
        memoList.insert(newMemo, at: 0)
        saveContext()
    }
    
    
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "GnMemo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {

                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    
}
