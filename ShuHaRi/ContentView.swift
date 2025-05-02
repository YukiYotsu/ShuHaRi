import SwiftUI

// グローバル配列
let exhibits = [
    Exhibit(name: "🐧Republic of Penguins", exhibitor: "Yuki Yotsumoto", description: "", tag1: "", tag2: "", tag3: "", imageName: "", startTime: ""),
    // Takibi tales
    Exhibit(name: "Takibi tales", exhibitor: "Sara Kimura", description: "The ancient art of storytelling comes alive again. Just as a grandmother once whispered legends by the takibi - bonfire, I'll be sharing a tale from the rich tapestry of Japanese mythology.", tag1: "oneness", tag2: "storytelling", tag3: "sense of wonder", imageName: "5_takibi_tales", startTime: "15:00")
]

// 出展の情報はここで型を作る
struct Exhibit: Identifiable {
    var id = UUID()
    var name: String
    var exhibitor: String
    var description: String
    var tag1: String
    var tag2: String
    var tag3: String
    var imageName: String // アセット名を指定
    var startTime: String
}

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
                        // 部屋空間ごとにセクションにして分けると見やすそう
                        // 今のところ出展同士がくっついてみえる。
                        HStack {
                            Image(exhibit.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 80)
                                .clipped()
                                .cornerRadius(8)
                            VStack(alignment: .leading) {
                                // タイトルとしてみえるもの
                                Text(exhibit.name)
                                    .font(.headline)
                                // サブタイトル（灰色字）としてみえるもの
                                Text(exhibit.exhibitor)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                Text(exhibit.startTime)
                                    .foregroundColor(colorForTime(exhibit.startTime)) // 色を変更するよう設定しているが、そもそも表示の順序を下にするなどif文で制御したほうがいいかも
                            }
                            
                        }
                        .padding(.vertical, 4)
                    }
                }
                .navigationTitle(localizedString("Home"))
                .searchable(text: $searchText, prompt: localizedString("Search exhibits"))
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
    
    // 色変更関数
    func colorForTime(_ startTime: String) -> Color {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        guard let eventTime = formatter.date(from: startTime) else {
            return .primary // 変換できなければデフォルト色
        }

        // 現在時刻と比較（同じ日付として処理）
        let calendar = Calendar.current

        let now = Date()
        let nowComponents = calendar.dateComponents([.hour, .minute], from: now)
        let eventComponents = calendar.dateComponents([.hour, .minute], from: eventTime)

        if let nowHour = nowComponents.hour,
           let nowMinute = nowComponents.minute,
           let eventHour = eventComponents.hour,
           let eventMinute = eventComponents.minute {

            if (eventHour < nowHour) || (eventHour == nowHour && eventMinute < nowMinute) {
                return .red // 過ぎている
            } else {
                return .green // まだ来ていない
            }
        }
        return .primary
    }

    // 言語対応は全てここに格納可能。
    // 使い方：　Text(localizedString("Tickets"))
    // Ticketsのようにキーを設定した配列である。
    func localizedString(_ key: String) -> String {
        switch selectedLanguage {
        case "🇯🇵日本語":
            return ["Program": "プログラム", "Home": "ホーム", "Browse": "見つける", "Search exhibits": "出展を検索する"][key] ?? key
        case "🇩🇪Deutsch":
            return ["Program": "Programm", "Home": "Startseite", "Browse": "Durchsuchen", "Search exhibits": "Exponate suchen"][key] ?? key
        // それ以外はそのキーのまま返す
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
