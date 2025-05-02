import SwiftUI

// グローバル配列
let exhibits = [
    Exhibit(name: "🐧Republic of Penguins", exhibitor: "Yuki Yotsumoto", description: "", tag1: "", tag2: "", tag3: "", imageName: ""),
    // Takibi tales
    Exhibit(name: "Takibi tales", exhibitor: "Sara Kimura", description: "The ancient art of storytelling comes alive again. Just as a grandmother once whispered legends by the takibi - bonfire, I'll be sharing a tale from the rich tapestry of Japanese mythology.", tag1: "oneness", tag2: "storytelling", tag3: "sense of wonder", imageName: "5_takibi_tales")
]

struct ContentView: View {
    @AppStorage("selectedLanguage") private var selectedLanguage: String = "日本語"
    @State private var searchText: String = ""
    
    var filteredExhibits: [Exhibit] {
            if searchText.isEmpty {
                return exhibits
            } else {
                // 検索結果制御
                return exhibits.filter {
                            $0.name.localizedCaseInsensitiveContains(searchText) ||
                            $0.exhibitor.localizedCaseInsensitiveContains(searchText) ||
                            $0.description.localizedCaseInsensitiveContains(searchText) ||
                            $0.tag1.localizedCaseInsensitiveContains(searchText) ||
                            $0.tag2.localizedCaseInsensitiveContains(searchText) ||
                            $0.tag3.localizedCaseInsensitiveContains(searchText)
                        }
            }
        }

    var body: some View {
        TabView {
            // Programmeタブ
            NavigationView {
                VStack {
                    
                }
                .navigationTitle(localizedString("Program"))
                
            }.tabItem {
                Image(systemName: "map")
                Text(localizedString("Program"))
            }
            
            // Homeタブ
            NavigationView {
                // filteredExhibitsにすることで検索結果だけに絞る
                List(filteredExhibits) { exhibit in
                    NavigationLink(destination: ExhibitDetailView(exhibit: exhibit)) {
                        // 部屋空間ごとに分けてあげたい
                        // 今のところ出展同士がくっついてみえる。
                        HStack {
                            Image(exhibit.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 80)
                                .clipped()
                                .cornerRadius(8)
                            VStack(alignment: .leading) {
                                Text(exhibit.name)
                                    .font(.headline)
                                Text(exhibit.exhibitor)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                
                            }
                            
                        }
                        .padding(.vertical, 4)
                    }
                }
                .navigationTitle(localizedString("Home"))
                .searchable(text: $searchText, prompt: "Search exhibits") // 🔍 検索バーを追加
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
            
            // Ticketsタブ
            NavigationView{
                VStack {
                    
                }
                .navigationTitle(localizedString("Tickets"))
            }
            .tabItem {
                Image(systemName: "ticket.fill")
                Text(localizedString("Tickets"))
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

struct Exhibit: Identifiable {
    var id = UUID()
    var name: String
    var exhibitor: String
    var description: String
    var tag1: String
    var tag2: String
    var tag3: String
    var imageName: String // アセット名を指定
}

// 出展ページの遷移先・詳細
struct ExhibitDetailView: View {
    var exhibit: Exhibit
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // 出展画像の表示
                Image(exhibit.imageName) // アセットカタログから画像を読み込む
                    .resizable()
                    .scaledToFit()
                    // .frame(height: 300)
                    .cornerRadius(15)
                    .padding()

                Text(exhibit.name)
                    .font(.largeTitle)
                    .bold()
                    .padding([.top, .horizontal])
                
                Text(exhibit.description)
                    .font(.body)
                    .padding([.horizontal])
                
                Spacer()
                
//                // Buy Me a Coffeeのリンク
//                Link(destination: URL(string: exhibit.buyMeACoffeeLink)!) {
//                    Text("Support this Exhibit")
//                        .font(.title2)
//                        .fontWeight(.semibold)
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                }
//                .padding([.horizontal, .bottom])
            }
            .navigationTitle(exhibit.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    ContentView()
}
