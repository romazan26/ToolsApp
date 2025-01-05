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
    @Published var isPresentPlanView: Bool = false
    @Published var isPresentEditPlan: Bool = false
    @Published var isPresentShare = false
    
    @Published var plainngs: [Plan] = []
    @Published var simplePlan: Plan?
    
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
    
    //MARK: - Edit func
    func tapEditButton(){
        if let plan = simplePlan{
            simplePlanType = getTypePlan(type: plan.type ?? "")
            simplePlanName = plan.name ?? ""
        }
        presentPlanView()
        presentEditPlanView()
    }
    func getTypePlan(type: String) ->PlanType{
        switch type{
        case "Home Repairs": return .home
        case "Car Repairs": return .car
        case "Welding Projects" : return .walding
        case "Garden Repairs" : return .garden
        default: return .home
        }
    }
    
    //MARK: - Iscomplet plan
    func getStatusPlan(plan: Plan) -> Bool{
        var status = 0
        if let powers = plan.power?.allObjects as? [PowerTool]{
            var powerStatus = 0
            
            for power in powers{
                if power.complet{
                    powerStatus += 1
                }
            }
            if powerStatus == powers.count{
                status += 1
            }
        }
        
        if let hands = plan.hand?.allObjects as? [HandTool]{
            var handStatus = 0
            for hand in hands{
                if hand.complet{
                    handStatus += 1
                }
            }
            if handStatus == hands.count{
                status += 1
            }
        }
        
        if let workers = plan.worker?.allObjects as? [Worker]{
            var workerStatus = 0
            for worker in workers{
                if worker.complet{
                    workerStatus += 1
                }
            }
            if workerStatus == workers.count{
                status += 1
            }
        }
        if status == 3{
            return true
        }else {return false}
    }
    
    //MARK: - CoreData function
    
    func saveEditPlan(){
        if let plan = simplePlan{
            plan.name = simplePlanName
            plan.type = simplePlanType.title
            for power in simplePowerTools{
                addOnePower(power: power, plan: plan)
            }
            for hand in simpleHandTools{
                addOneHand(hand: hand, plan: plan)
            }
            for worker in simpleWorkers{
                addOneWorker(worker: worker, plan: plan)
            }
            simplePlan = plan
        }
        saveData()
        clearData()
        presentEditPlanView()
        presentPlanView()
        
    }
    
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
    
    func deletePower(power: PowerTool){
        manager.context.delete(power)
        saveData()
    }
    
    func deleteHand(hand: HandTool){
        manager.context.delete(hand)
        saveData()
    }
    
    func deleteWorkerForEdit(worker: Worker){
        manager.context.delete(worker)
        saveData()
    }
    
    func deletePlan(){
        if let works = simplePlan?.worker?.allObjects as? [Worker]{
            for work in works{
                manager.context.delete(work)
            }
        }
        if let powers = simplePlan?.power?.allObjects as? [PowerTool]{
            for power in powers{
                manager.context.delete(power)
            }
        }
        if let hands = simplePlan?.hand?.allObjects as? [HandTool]{
            for hand in hands{
                manager.context.delete(hand)
            }
        }
        if let plan = simplePlan{
            manager.context.delete(plan)
        }
        
        saveData()
        presentPlanView()
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
    func presentPlanView(){
        isPresentPlanView.toggle()
    }
    func presentEditPlanView(){
        isPresentEditPlan.toggle()
    }
    
    //MARK: - Workers
    func completeWorkers(worker: Worker){
        worker.complet.toggle()
        saveData()
    }
    
    func getCompletedWorkers(workers: [Worker]) -> Int {
        var completedWorkers: Int = 0
        for worker in workers{
            if worker.complet{
                completedWorkers += 1
            }
        }
        return completedWorkers
    }
    
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
    func completeHandTools(handTool: HandTool){
        handTool.complet.toggle()
        saveData()
    }
    
    func getCompletedHandTools(handTools: [HandTool]) -> Int {
        var completedHandTools: Int = 0
        for handTool in handTools{
            if handTool.complet{
                completedHandTools += 1
            }
        }
        return completedHandTools
    }
    
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
    func completePowerTools(power: PowerTool){
        power.complet.toggle()
        saveData()
    }
    
    func getCompletedPowerTools(powerTools: [PowerTool]) -> Int {
        var completedPowerTools: Int = 0
        for powerTool in powerTools{
            if powerTool.complet{
                completedPowerTools += 1
            }
        }
        return completedPowerTools
    }
    
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
