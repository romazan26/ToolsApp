//
//  ToolsViewModel.swift
//  ToolsApp
//
//  Created by Роман on 31.12.2024.
//

import Foundation
import CoreData

final class ToolsViewModel: ObservableObject {
    let manager = CoreDataManager.instance
    
    @Published var tools: [Tool] = []
    @Published var sortesTools: [Tool] = []
    @Published var simpleTool: Tool?
    
    @Published var isPresentAddToolView: Bool = false
    @Published var isPresentToolView: Bool = false
    @Published var isPresentTagsView: Bool = false
    
    @Published var simpleToolName: String = ""
    @Published var simpleToolManufactures: String = ""
    @Published var simpleToolPrice: String = ""
    @Published var simpleToolManual: String = ""
    @Published var simpleCard: Card = .compass
    @Published var simpleToolCondition: Condition = .new
    @Published var simpleType: TypeTools = .hand
    @Published var simpleAnotherType: String = ""
    
    @Published var coditionTags: [String] = []
    @Published var typeTags: [String] = []
    
    @Published var isEditeMode = false
    
    init(){
        getData()
        getSortTools()
    }
    
    //MARK: - Sorted function
    func getSortTools(){
        sortesTools.removeAll()
        if coditionTags.isEmpty && typeTags.isEmpty{
            sortesTools = tools
        }else{
            for tool in tools{
                if coditionTags.contains(tool.condition ?? "") || typeTags.contains(tool.type ?? ""){
                    sortesTools.append(tool)
                }
            }
        }
    }
    
    //MARK: - Make tags
    func addConitionAll(){
        coditionTags.removeAll()
    }
    func addConditionTags(condition: Condition){
        if !coditionTags.contains(condition.name){
            coditionTags.append(condition.name)
        }else{
            if let index = coditionTags.firstIndex(of: condition.name){
                coditionTags.remove(at: index)
            }
        }
    }
    func deleteTypeTags(tag: String){
        if let index = typeTags.firstIndex(of: tag){
            typeTags.remove(at: index)
        }
    }
    func deleteConditionTags(tag: String){
        if let index = coditionTags.firstIndex(of: tag){
            coditionTags.remove(at: index)
        }
    }
    func cheackConditionTags(condition: Condition) -> Bool{
        return coditionTags.contains(condition.name)
    }
    func addTypeAll(){
        typeTags.removeAll()
    }
    func addTypeTags(type: TypeTools){
        if !typeTags.contains(type.name){
            typeTags.append(type.name)
        }else{
            if let index = typeTags.firstIndex(of: type.name){
                typeTags.remove(at: index)
            }
        }
    }
    func cheackTypeTags(type: TypeTools) -> Bool{
        return typeTags.contains(type.name)
    }
    
    //MARK: - Presented func
    func presentAddToolView() {
        isPresentAddToolView.toggle()
    }
    func presentedToolView() {
        isPresentToolView.toggle()
    }
    func presentesTagsView() {
        isPresentTagsView.toggle()
    }
    
    //MARK: - Tap button
    func tapEditeButton(){
        isEditeMode = true
        presentedToolView()
        presentAddToolView()
    }
    
    func tapSaveEdite(){
        isEditeMode = false
        editData()
        presentAddToolView()
        presentedToolView()
    }
    
    func getCard(card: String) ->Card{
        switch card{
        case "ruler" : return .ruler
        case "compass" : return .compass
        case "scissors": return .scissors
        case "paintbrush": return .paintbrush
        case "hammer": return .hammer
        case "screwdriver": return .screwdriver
        case "wrench": return .wrench
        default: return .ruler
        }
    }
    
    func getCondition(condition: String) ->Condition{
        switch condition{
        case "New": return .new
        case "Functional": return .functional
        case "Needs Maintenance": return .needsMaintenance
        case "In Use": return .inUse
        default: return .new
        }
    }
    
    func getTypeTools(type: String) ->TypeTools{
        switch type{
        case "Hand Tool": return .hand
        case "Power Tool": return .power
        case "Measuring Tool": return .measuring
        case "Cutting Tool": return .cutting
        default: return .hand
        }
    }
    //MARK: - CoreData finctions
    func feelData(){
        if let tool = simpleTool{
            simpleToolName = tool.name ?? ""
            simpleToolManufactures = tool.manufactures ?? ""
            simpleToolPrice = String(tool.price)
            simpleToolManual = tool.manual ?? ""
            simpleCard = getCard(card: tool.card ?? "")
            simpleToolCondition = getCondition(condition: tool.condition ?? "")
            simpleAnotherType = tool.anoutherType ?? ""
            simpleType = getTypeTools(type: tool.type ?? "")
            
        }
    }
    
    func editData(){
        if let tool = simpleTool{
            tool.name = simpleToolName
            tool.manufactures = simpleToolManufactures
            tool.price = Double(simpleToolPrice) ?? 0
            tool.manual = simpleToolManual
            tool.card = simpleCard.rawValue
            tool.condition = simpleToolCondition.name
            tool.type = simpleType.name
            tool.anoutherType = simpleAnotherType
            saveData()
        }
    }
    
    func deleteData(){
        if let tool = simpleTool{
            manager.context.delete(tool)
        }
        saveData()
        clearData()
        getSortTools()
    }
    
    func addData(){
        let newTool = Tool(context: manager.context)
        newTool.name = simpleToolName
        newTool.manufactures = simpleToolManufactures
        newTool.price = Double(simpleToolPrice) ?? 0
        newTool.manual = simpleToolManual
        newTool.card = simpleCard.rawValue
        newTool.condition = simpleToolCondition.name
        newTool.type = simpleType.name
        newTool.anoutherType = simpleAnotherType
        
        saveData()
        clearData()
        getSortTools()
    }
    
    func clearData(){
        simpleToolName = ""
        simpleToolManufactures = ""
        simpleToolPrice = ""
        simpleToolManual = ""
        simpleCard = .compass
        simpleToolCondition = .new
        simpleType = .hand
        simpleAnotherType = ""
    }
    
    func getData(){
        let request = NSFetchRequest<Tool>(entityName: "Tool")
        do{
            tools = try manager.context.fetch(request)
        }catch let error{
            print("Error fetching data: \(error)")
        }
    }
    
    func saveData(){
        tools.removeAll()
        manager.save()
        getData()
    }
    
    //MARK: - Cheak isActive tool
    func cheakIsActiveCard(card: Card) -> Bool {
        if card == simpleCard {
            return true
        }else{
            return false
        }
    }
    
    func cheakIsActiveCondition(condition: Condition) -> Bool {
        if condition == simpleToolCondition {
            return true
        }else{
            return false
        }
    }
    
    func cheatIsActiveType(type: TypeTools) -> Bool {
        if type == simpleType {
            return true
        }else{
            return false
        }
    }
}
