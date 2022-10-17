import SwiftUI

struct DataView: View {
    @EnvironmentObject var funcState:FuncState;
    
    var body: some View {
        VStack {
            if (funcState.chemical != "") {
                Text("Chemical: \(funcState.chemical!)").font(.caption).foregroundColor(.teal);
            }
            if (funcState.utility != "" && funcState.viewState != 0) {
                Text("Utility Selected: \(funcState.utility!)").font(.caption).foregroundColor(.teal);
            }
            if (funcState.molecularWeight != 0) {
                Text("Molecular Weight: \(funcState.molecularWeight!)").font(.caption).foregroundColor(.teal);
            }
            if (funcState.viewState != 0) {
                Button("Utility Home") {
                    funcState.viewState = 0;
                }.font(.largeTitle).foregroundColor(.teal);
            }
        }
    }
}
