import SwiftUI

struct MolecularMassView: View {
    @EnvironmentObject var funcState:FuncState;
    @State var element:String;
    @State var quantity:String;
    
    init() {
        self.element = "Hydrogen";
        self.quantity = "";
    }
    
    var body: some View {
        VStack {
            HStack {
                Image("Molecular Mass").resizable().frame(width: 100, height: 100);
                VStack {
                    DataView().environmentObject(funcState);
                }
            }
            Image("White Table").resizable().frame(height: 1000);
            Text("Element Selected: \(element)").font(.caption).foregroundColor(.teal);
            HStack {
                Spacer();
                Text("\(element) Quantity: ").font(.caption).foregroundColor(.teal);
                TextField("Enter quantity of \(element)", text: $quantity).font(.caption).foregroundColor(.teal);
            }
            Button("Calculate"){
                funcState.molecularWeight = 1.008 * Double(quantity)!;
            }
        }
        Spacer();
    }
}
