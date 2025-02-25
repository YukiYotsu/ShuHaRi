import SwiftUI

struct ContentView: View {
    @AppStorage("selectedLanguage") private var selectedLanguage: String = "日本語"

    var body: some View {
        TabView {
            // Programmeタブ
            VStack {
                Image(systemName: "map")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text(localizedString("Program"))
            }
            .tabItem {
                Image(systemName: "map")
                Text(localizedString("Program"))
            }
            
            // Homeタブ
            NavigationView {
                VStack {
                    Image(systemName: "house")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text(localizedString("Home"))
                }
                .navigationTitle(localizedString("Home"))
                .navigationBarItems(trailing:
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gear")
                            .foregroundColor(.blue)
                    }
                )
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text(localizedString("Home"))
            }
            
            // Browseタブ
            VStack {
                Image(systemName: "folder")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text(localizedString("Browse"))
            }
            .tabItem {
                Image(systemName: "folder.fill")
                Text(localizedString("Browse"))
            }
        }
        .onChange(of: selectedLanguage) { print("Selected language changed to: \(selectedLanguage)") }
    }
    
    func localizedString(_ key: String) -> String {
        switch selectedLanguage {
        case "🇯🇵日本語":
            return ["Program": "プログラム", "Home": "ホーム", "Browse": "見つける"][key] ?? key
        case "🇩🇪Deutsch":
            return ["Program": "Programm", "Home": "Startseite", "Browse": "Durchsuchen"][key] ?? key
        default:
            return key
        }
    }
}

struct SettingsView: View {
    @AppStorage("selectedLanguage") private var selectedLanguage: String = "日本語"
    let languages = ["🇯🇵日本語", "🇩🇪Deutsch", "🇬🇧English"]

    var body: some View {
        Form {
            Section(header: Text("Language")) {
                Picker("言語", selection: $selectedLanguage) {
                    ForEach(languages, id: \ .self) { language in
                        Text(language).tag(language)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
        }
        .navigationTitle("Setting")
    }
}

#Preview {
    ContentView()
}
