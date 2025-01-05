//
//  PlanningView.swift
//  ToolsApp
//
//  Created by Роман on 31.12.2024.
//

import SwiftUI

struct PlanningView: View {
    
    @StateObject var vm = PlainingViewModel()
    
    var body: some View {
        VStack{
            HStack{
                Text("Planning")
                    .font(.system(size: 32))
                Spacer()
            }
            Divider()
            //MARK: - Add button
            HStack{
                Text("You plans")
                    .foregroundStyle(.black)
                    .font(.system(size: 22))
                Spacer()
                Button(action: {vm.presentAddPlaining()}) {
                    Image(systemName: "plus")
                        .foregroundColor(.black)
                }
            }
            
            //MARK: - List plaining
            if vm.plainngs.isEmpty {
                VStack{
                    Image(.emptyPlaining)
                        .resizable()
                        .frame(width: 128, height: 128)
                    Text("You don't have anything planned yet.")
                        .foregroundStyle(.black)
                        .font(.system(size: 16))
                }
            }else{
                ScrollView {
                    ForEach(vm.plainngs) { plan in
                        Button {
                            vm.presentPlanView()
                            vm.simplePlan = plan
                        } label: {
                            PlanCellView(plan: plan, vm: vm)
                        }

                        
                    }
                }
            }
            Spacer()
        }
        .padding()
        .sheet(isPresented: $vm.isPresentAddPlaining) {
            AddPlainingView(vm: vm)
                .presentationDetents([.fraction(0.75)])
                .presentationDragIndicator(.visible)
        }
        .sheet(isPresented: $vm.isPresentPlanView) {
            PlanView(vm: vm)
                .presentationDetents([.fraction(0.75)])
                .presentationDragIndicator(.visible)
        }
        .sheet(isPresented: $vm.isPresentEditPlan) {
            EditPlanView(vm: vm)
                .presentationDetents([.fraction(0.75)])
                .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    PlanningView()
}
