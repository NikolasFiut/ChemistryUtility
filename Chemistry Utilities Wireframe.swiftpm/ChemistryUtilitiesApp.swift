import SwiftUI

class FuncState:ObservableObject {
    @Published var viewState:Int;
    @Published var utility:String?;
    @Published var chemical:String?;
    @Published var dilutionUnknown:String?;
    @Published var volumeTypeInitial:String?;
    @Published var volumeTypeFinal:String?;
    @Published var volumeInitial:Double?;
    @Published var volumeFinal:Double?;
    @Published var concentrationInitial:Double?;
    @Published var concentrationFinal:Double?;
    @Published var molecularWeight:Double?;
    
    init(viewState:Int) {
        self.chemical = "";
        self.molecularWeight = 0;
        self.viewState = viewState;
        self.concentrationInitial = 0;
        self.concentrationFinal = 0;
        self.volumeInitial = 0;
        self.volumeFinal = 0;
    }
    
    func clearData() {
        self.chemical = "";
        self.molecularWeight = 0;
        self.viewState = viewState;
        self.concentrationInitial = 0;
        self.concentrationFinal = 0;
        self.volumeInitial = 0;
        self.volumeFinal = 0;
    }
}

@main
struct ChemistryUtilitiesApp: App {
    @ObservedObject var funcState:FuncState = FuncState(viewState: 0);
    var body: some Scene {
        WindowGroup {
            VStack {
                if (funcState.viewState == 0) {
                    UtilitySelectorView().environmentObject(funcState);
                } else if (funcState.viewState == 1) {
                    DilutionSelectorView().environmentObject(funcState);
                } else if (funcState.viewState == 2) {
                    MolecularMassView().environmentObject(funcState);
                }else {
                    Text("Invalid View State.");
                }
            }
        }
    }
}
