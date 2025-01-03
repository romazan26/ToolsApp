//
//  PlainingViewModel.swift
//  ToolsApp
//
//  Created by Роман on 03.01.2025.
//
import Foundation
import CoreData

final class PlainingViewModel: ObservableObject {
    let manager = CoreDataManager.instance
    @Published var isPresentAddPlaining: Bool = false
    
    @Published var plainngs: [Plan] = []
    
    @Published var simplePlanType: PlanType = .home
    @Published var simplePlanName: String = ""
    @Published var simplePowerTools: [String] = []
    @Published var simplePowerTool: String = ""
    @Published var simpleHandTools: [String] = []
    @Published var simpleHandTool: String = ""
    @Published var simpleWorkers: [String] = []
    @Published var simpleWorker: String = ""
    
    init(){
        getData()
    }
    
    
    //MARK: - CoreData function
    func clearData(){
        simplePlanType = .home
        simplePlanName = ""
        simplePowerTools = []
        simplePowerTool = ""
        simpleHandTools = []
        simpleHandTool = ""
        simpleWorkers = []
        simpleWorker = ""
    }
    
    func addData(){
        let newPlan = Plan(context: manager.context)
        newPlan.name = simplePlanName
        newPlan.type = simplePlanType.title
        for power in simplePowerTools{
            addOnePower(power: power, plan: newPlan)
        }
        for hand in simpleHandTools{
            addOneHand(hand: hand, plan: newPlan)
        }
        for worker in simpleWorkers{
            addOneWorker(worker: worker, plan: newPlan)
        }
        saveData()
        clearData()
    }
    
    func addOneWorker(worker: String, plan: Plan){
        let newWorker = Worker(context: manager.context)
        newWorker.name = worker
        newWorker.plan = plan
        saveData()
    }
    
    func addOneHand(hand: String, plan: Plan){
        let newHand = HandTool(context: manager.context)
        newHand.name = hand
        newHand.plan = plan
        saveData()
    }
    
    func addOnePower(power: String, plan: Plan){
        let newPower = PowerTool(context: manager.context)
        newPower.name = power
        newPower.plan = plan
        saveData()
    }
    
    func saveData() {
        plainngs.removeAll()
        manager.save()
        getData()
    }
    
    func getData() {
        let request = NSFetchRequest<Plan>(entityName: "Plan")
        do{
            plainngs = try manager.context.fetch(request)
        }catch let error{
            print("Error fetching data \(error)")
        }
    }
    
    //MARK: - Presented View
    func presentAddPlaining() {
        isPresentAddPlaining.toggle()
    }
    
    //MARK: - Workers
    func addWorkers() {
        if !simpleWorker.isEmpty{
            simpleWorkers.append(simpleWorker)
            simpleWorker = ""
        }
    }
    func deleteWorkers(index: Int) {
        simpleWorkers.remove(at: index)
    }
    
    //MARK: - Hand tools
    func addHandTools() {
        if !simpleHandTool.isEmpty{
            simpleHandTools.append(simpleHandTool)
            simpleHandTool = ""
        }
    }
    func deleteHandTools(index: Int) {
        simpleHandTools.remove(at: index)
    }
    
    //MARK: - Power tools
    func addPowerTools() {
        if !simplePowerTool.isEmpty{
            simplePowerTools.append(simplePowerTool)
            simplePowerTool = ""
        }
    }
    func deletePowerTools(index: Int) {
        simplePowerTools.remove(at: index)
    }
}
