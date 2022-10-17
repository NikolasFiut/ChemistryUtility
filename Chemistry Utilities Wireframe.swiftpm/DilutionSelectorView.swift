import SwiftUI

struct DilutionSelectorView: View {
    @EnvironmentObject var funcState:FuncState;
    @State var concentrationInitial:String;
    @State var concentrationFinal:String;
    @State var volumeInitial:String;
    @State var volumeFinal:String;
    
    init() {
        self.concentrationInitial = "";
        self.concentrationFinal = "";
        self.volumeInitial = "";
        self.volumeFinal = "";
    }
    
    var body: some View {
        VStack {
            DataView().environmentObject(funcState);
            Image("Dilution").resizable().frame(width: 300, height: 300);
            VStack {
                HStack {
                    Text("Initial Concentration: ").font(.caption).foregroundColor(.teal);
                    if (funcState.concentrationInitial != 0) {
                        Text("\(funcState.concentrationInitial!)").font(.caption).foregroundColor(.teal);
                    } else {
                        TextField("Enter initial concentration in M", text: $concentrationInitial).font(.caption).foregroundColor(.teal);
                    }
                }
                HStack {
                    Text("Final Concentration: ").font(.caption).foregroundColor(.teal);
                    if (funcState.concentrationFinal != 0) {
                        Text("\(funcState.concentrationFinal!)").font(.caption).foregroundColor(.teal);
                    } else {
                        TextField("Enter final concentration in M", text: $concentrationFinal).font(.caption).foregroundColor(.teal);
                    }
                }
                HStack {
                    Text("Initial Volume: ").font(.caption).foregroundColor(.teal);
                    if (funcState.volumeInitial != 0) {
                        Text("\(funcState.volumeInitial!)").font(.caption).foregroundColor(.teal);
                    } else {
                        TextField("Enter initial volume in L", text: $volumeInitial).font(.caption).foregroundColor(.teal);
                    }
                }
                HStack {
                    Text("Final Volume: ").font(.caption).foregroundColor(.teal);
                    if (funcState.volumeFinal != 0) {
                        Text("\(funcState.volumeFinal!)").font(.caption).foregroundColor(.teal);
                    } else {
                        TextField("Enter final volume in L", text: $volumeFinal).font(.caption).foregroundColor(.teal);
                    }
                }
            }
            if (funcState.concentrationInitial != 0 || funcState.concentrationFinal != 0 || funcState.volumeFinal != 0 || funcState.volumeInitial != 0) {
                Button("Clear Dilution Values"){
                    concentrationInitial = "";
                    concentrationFinal = "";
                    volumeFinal = "";
                    volumeInitial = "";
                    funcState.concentrationInitial = 0;
                    funcState.concentrationFinal = 0;
                    funcState.volumeFinal = 0;
                    funcState.volumeInitial = 0;
                }
            } else {
                Button("Calculate Dilution"){
                    funcState.concentrationInitial = Double(concentrationInitial);
                    funcState.volumeInitial = Double(volumeInitial);
                    if (concentrationFinal == "" && volumeFinal != "") {
                        funcState.volumeFinal = Double(volumeFinal);
                        funcState.concentrationFinal = funcState.concentrationInitial! * funcState.volumeInitial! / funcState.volumeFinal!;
                    } else if (volumeFinal == "" && concentrationFinal != "") {
                        funcState.concentrationFinal = Double(concentrationFinal);
                        funcState.volumeFinal = funcState.concentrationInitial! * funcState.volumeInitial! / funcState.concentrationFinal!;
                    } //Add failure to enter data clause here
                }
            }
        }
        Spacer();
    }
}
