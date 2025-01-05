//
//  WishlistViewModel.swift
//  ToolsApp
//
//  Created by Роман on 05.01.2025.
//

import Foundation
import CoreData

final class WishlistViewModel: ObservableObject {
    let manager = CoreDataManager.instance
    
    @Published var wishlists: [WishList] = []
    @Published var simpleWishlist: WishList?
    
    @Published var isPresentAddView: Bool = false
    @Published var isPresentWishLView: Bool = false
    
    @Published var isEditMode = false
    
    @Published var toolName: String = ""
    @Published var toolType: String = ""
    
    init() {
        getData()
    }
    
    //MARK: - Clear data
    func clearData() {
        toolName = ""
        toolType = ""
    }
    
    //MARK: - Presetation function
    func presentAddView() {
        isPresentAddView.toggle()
        clearData()
    }
    func presentWishLView() {
        isPresentWishLView.toggle()
    }
    
    //MARK: - Edit mode
    func tapEditButon(){
        presentAddView()
        if let wishList = simpleWishlist{
            isEditMode = true
            toolName = wishList.name ?? ""
            toolType = wishList.type ?? ""
            
        }
       
    }
    //MARK: - CoreData func
    
    func saveEditData() {
        if let wishlist = simpleWishlist{
            wishlist.name = toolName
            wishlist.type = toolType
            saveData()
        }
    }
    
    func deleteList() {
        if let list = simpleWishlist{
            manager.context.delete(list)
            saveData()
        }
        
    }
    
    func confirmList(){
        if let wishlist = simpleWishlist{
            wishlist.confirm.toggle()
            saveData()
        }
        
    }
    
    func addData() {
        let newWishList = WishList(context: manager.context)
        newWishList.name = toolName
        newWishList.type = toolType
        newWishList.confirm = false
        saveData()
    }
    
    func saveData() {
        wishlists.removeAll()
        manager.save()
        getData()
    }
    
    func getData() {
        let request = NSFetchRequest<WishList>(entityName: "WishList")
        do{
            wishlists = try manager.context.fetch(request)
        }catch let error{
            print(error)
        }
    }
}
