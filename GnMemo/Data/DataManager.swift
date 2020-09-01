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
        
        return persistentContainer.viewContext
        //객체 콘텍스트 얻기
    }
    
    
    var memoList = [Memo]() //메모리스트에 메모 배열 생성
        func fetchMemo() {
            let request: NSFetchRequest<Memo> = Memo.fetchRequest()
            //NSFetchRequest는 코어 데이터에서 가져 오는 역할을 담당하는 클래스
            //데이터베이스에서 데이터를 읽어올때는 FetchRequest 생성
            let sortByDateDesc = NSSortDescriptor(key: "insertDate", ascending: false) // key값 기준으로 내림차로 정렬
            request.sortDescriptors = [sortByDateDesc]
            
            do {
                memoList = try mainContenxt.fetch(request)
                // context가 제공하는 fetch메소드 throws 예외가 발생할수도 있음.
                // 예외처리 do-catch
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
