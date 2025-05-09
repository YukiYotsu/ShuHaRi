import SwiftUI

// 出展の情報はここで型を作る
struct Exhibit: Identifiable { // Identifiableにより配列にIDを振ることができる
    var id = UUID()
    var name: String
    var exhibitor: String
    var description: String
    var tag1: String
    var tag2: String
    var tag3: String
    var imageName: String // アセット名を指定
    var startTime: String
    var isNotified: Bool = false // 通知フラグデフォルト・偽
}

// グローバル配列
let exhibits = [
    // Republic of Penguins
    Exhibit(name: "🐧Republic of Penguins", exhibitor: "Yuki Yotsumoto", description: "", tag1: "", tag2: "", tag3: "", imageName: "", startTime: ""),
    // Takibi tales
    Exhibit(name: "Takibi storytelling", exhibitor: "Sara Kimura", description: "The ancient art of storytelling comes alive again. Just as a grandmother once whispered legends by the takibi - bonfire, I'll be sharing a tale from the rich tapestry of Japanese mythology.", tag1: "oneness", tag2: "storytelling", tag3: "sense of wonder", imageName: "", startTime: ""),
    // Ichiju-Sansai
    Exhibit(name: "Ichiju-Sansai", exhibitor: "Momoko Sato, Keisaku Matsuzaki, Hannah, Airy Yamaguchi", description: "For this event, we are adding a unique twist by incorporating elements of German cuisine, creating a Japanese-German fusion experience. Visitors will be able to explore both cultures by selecting from a variety of Japanese and German dishes to create their own custom Ichiju Sansai plate. Some of the dishes we serve will also highlight the health benefits and scientific background of the ingredients, such as the role of fermented foods or the importance of nutritional balance. Our goal is not to say that 'Japanese food is better,' but rather to encourage people to enjoy and appreciate the differences between food cultures. We hope this event becomes a fun and meaningful opportunity to discover new tastes and connect with others through food.", tag1: "culturefusion through food", tag2: "ichiju-sansei experience", tag3: "health and scientific insights", imageName: "", startTime: ""),
    // Köyri
    Exhibit(name: "Köyri/實り", exhibitor: "Keisuke Jitsuta", description: "Within my daily life, I experience my thoughts and actions as seeds that sprout and bear fruit in the immediate and subsequent moments. I'll be sharing a part of my life as an archive of photos and diary-like entries, capturing the days and moments when I particularly felt this.", tag1: "interwoven", tag2: "archibe", tag3: "dependent co-arising", imageName: "", startTime: ""),
    // Dullstone・鈍石・Ein Stein
    Exhibit(name: "Dullstone・鈍石・Ein Stein", exhibitor: "Yurika Saito", description: "Experience the cycles of nature and time-touch stones from the sea and forest, walk among fabrics dyed with reused tea leaves from a Berlin restaurant, using the Japanese technique of 'Kusaki-zome', feel the time and rhythm held in what we see and touch.", tag1: "nature", tag2: "natural dye", tag3: "stone", imageName: "", startTime: ""),
    // yadokari picnic
    Exhibit(name: "yadokari picnic", exhibitor: "burco", description: "Just as hermit crabs drift through the ocean of society, we gather under a shared shell. A space to pause, exchange, and to let things unfold - storytelling, music, open dialogues, shared experiences.", tag1: "co-creation", tag2: "spontaneity", tag3: "openness", imageName: "", startTime: ""),
    // Forests
    Exhibit(name: "Forests", exhibitor: "Taiki Ishida", description: "This presentation invites us to realize the complexity and diversity of the word 'forest'.", tag1: "nature", tag2: "environment", tag3: "diversity", imageName: "", startTime: ""),
    // In the Frame
    Exhibit(name: "In the Frame", exhibitor: "Kosuke Ito", description: "I've come to find interesting structures when I walk around cities while thinking about myself and society. Using my photos taken in Cologne and Milan, I'll create a space for thinking about the future together.", tag1: "social structure", tag2: "future", tag3: "self-analysis", imageName: "", startTime: ""),
    // Today is the first dancing day of the rest of your life
    Exhibit(name: "Today is the first dancing day of the rest of your life", exhibitor: "Yuka Yano", description: "I started dancing after I grew up an adult, so it felt too late to make it my special skill. But l've always lived by the motto, 'Today is the youngest you'll ever be,' and kept searching for what I truly want to do. Now, l'm challenging myself to create my own choreography for the first time.", tag1: "dance", tag2: "hiphop", tag3: "", imageName: "", startTime: ""),
    // Takoyaki
    Exhibit(name: "Takoyaki", exhibitor: "Kiki", description: "Hot, crispy, and oh-so-yummy. Takoyaki time! 🔥🥢Let's all enjoy some delicious takoyaki!", tag1: "osaka", tag2: "delicious", tag3: "cheap", imageName: "", startTime: ""),
    // Ocho25 recycle x skateboard x Art:
    Exhibit(name: "Ocho25 Recycle x Skateboard x Art:", exhibitor: "Kiki", description: "Recycling skateboards and turning them into art pieces.", tag1: "recycle", tag2: "skateboard", tag3: "art", imageName: "", startTime: ""),
    // What does the museum in Berlin want to tell us?
    Exhibit(name: "What does the museum in Berlin want to tell us?", exhibitor: "Honomi Kitaru", description: "Berlin has many museums. And each one of them has a message for us. What do they want to tell us? Through Berlin's museums, we will consider what museums should be.", tag1: "museology", tag2: "expression", tag3: "message", imageName: "", startTime: ""),
    // The Pointe of Us
    Exhibit(name: "The Pointe of Us", exhibitor: "Karen Suzuki", description: "A ballet dancer is more than a performer-they express and connect with the world through their body. This project highlights each dancer's passion for ballet and their personal story of living as a dancer. Through their movements and words, we explore how they define themselves and what it means to live through dance. This is a place for all aspirational dancers-for everyone who", tag1: "aspirational dancers", tag2: "identity", tag3: "ballet", imageName: "", startTime: ""),
    // A small world in a big world A big world in a small world
    Exhibit(name: "A small world in a big world A big world in a small world", exhibitor: "Ayu Ohiata", description: "In this world, everythings exist are formed of atoms. I express them as many grain circles in my works. When I pause for a moment in the passing time and feel about being here now. I feel very vague and connected but I feel ephemeral and tiny at the same time.", tag1: "atoms", tag2: "tsubumaru", tag3: "daily life", imageName: "", startTime: ""),
    // Dancing the Waves of Emotion:
    Exhibit(name: "Dancing the Waves of Emotion", exhibitor: "Rin Houdatsu", description: "MMeeting dance allowed the emotions long hidden deep within my heart to be set free. It felt like a door, which had been closed for so long, quietly opening. When the body and emotions connect and begin to communicate with one another, what is born from that moment? This time, through the beauty of Japanese dance, we will explore the deep connection between heart and body, and together, we will experience the moment when emotions transform into movement.", tag1: "expression", tag2: "free", tag3: "body", imageName: "", startTime: ""),
    // Teeraum
    Exhibit(name: "Teeraum", exhibitor: "Sarasa Mikami, Yuta Chatani, Aya Ono", description: "A pop-up Japanese tea café offering over 10 kinds of tea, hands-on workshops, tastings, and tea knowledge. Experience Japanese tea culture through all five senses-from wagashi-making to matcha sweets.", tag1: "Japanese tea", tag2: "hospitality", tag3: "tradition", imageName: "", startTime: ""),
    // Inu ga Iru / The absence exists
    Exhibit(name: "Inu ga Iru / The absence exists", exhibitor: "Keian Takahashi", description: "It seems to be there, what is that? Yet it also seems not to be, however I noticed it. The one that's there isn't there, and the one that isn't there is. Those two appear to be connected, yet they also appear to be cut off from each other.", tag1: "geography", tag2: "situationist", tag3: "dérive", imageName: "", startTime: ""),
    // Hikari no oto
    Exhibit(name: "Hikari no oto", exhibitor: "Lily Kurosawa", description: "The world's light and everything it touches is so inexplicably beautiful. I will be painting the world the way I feel it-through my original music.", tag1: "nature", tag2: "sound", tag3: "life", imageName: "", startTime: ""),
    // From Hop to Hope
    Exhibit(name: "From Hop to Hope", exhibitor: "Yukari KITA", description: "This exhibition explores hops cultivation from anthropological view. It's just ingredient of beer but This tiny plant might hold the key to the future of agriculture.", tag1: "agriculture", tag2: "hops", tag3: "cultural anthropology", imageName: "", startTime: ""),
    // 共鳴/Resonance
    Exhibit(name: "共鳴/Resonance", exhibitor: "Kaito Kedashiro", description: "Acoustic Guitars are supposed to be played by one player basically. If Speaking tube was added to the guitar so that listeners can join singing into the tube as well as listening, I hope which will lead to more immersive and resonating experience with sounds. Listeners can be players.", tag1: "sound", tag2: "acoustic guitar", tag3: "listen", imageName: "", startTime: ""),
    // Projekt Trommel
    Exhibit(name: "Projekt Trommel", exhibitor: "Sayaka Katsumoto", description: "Wadaiko (Japanese drums) are traditional percussion instruments that are an essential part of religious ceremonies and festivals. However, particularly in western Japan, tanners and drum artisans have a history of being discriminated against. In a certain region in western Japan where research has been conducted for several years, a Wadaiko group was established in the 1990s and remains actively engaged to this day. This sound installation was inspired by small drum toys made from water pipes and small pieces of leather that were created in a children's workshop held there, as well as by the telephone invented in Germany in 1861 by Johann Philipp Reis (1834-1874).", tag1: "Wadaiko", tag2: "sound installation", tag3: "leather", imageName: "", startTime: ""),
    // Rakugo
    Exhibit(name: "OCHIBA -Rakugo in the Tokyo cityscape-", exhibitor: "Wataru Nakayama", description: "OCHIBA is a project that creates temporary rakugo stages in urban spaces, bringing to life a landscape where rakugo naturally blends into everyday life. Rakugo is a storytelling art in which a single performer sits on a cushion and paints vivid scenes using only words and gestures. The goal of our project is to foster a new resonance between Tokyo and rakugo-one that cannot be reached through imagination alone beyond the bounds of the theater.", tag1: "Rakugo", tag2: "temporary stage design", tag3: "urban intervention", imageName: "", startTime: ""),
    // Giving form to principles
    Exhibit(name: "Giving form to principles", exhibitor: "Kirari Shigematsu", description: "This is a compilation of my works with my phylosophy; 'Giving form to principles.' This exhibition brings together a wide range of works, from specific architectural proposals to abstract and sculptural explorations.", tag1: "architecture", tag2: "art", tag3: "principles", imageName: "", startTime: ""),
    // Tracing the Dynamics
    Exhibit(name: "Structure, Dynamics, Spatial Design", exhibitor: "Wataru Nakayama", description: "This exhibition brings together a series of full-scale explorations - from a washi-paper catenary arch, to stage designs for rakugo and contemporary dance performances, to wooden furniture crafted by tracing the grain patterns of trees. Each work is an attempt to give form to the interaction between force and structure. By tracing the path of the line that defines each shape, I seek the invisible dynamics that resonate through space - tension, gravity, reaction. Structure is not merely something that supports form; it brings rhythm and movement into space.", tag1: "structure", tag2: "Dynamics", tag3: "spatial design", imageName: "", startTime: "")
]


// ContentView本体
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
                                if !exhibit.startTime.isEmpty {
                                    Text(exhibit.startTime)
                                        .foregroundColor(colorForTime(exhibit.startTime)) //色を変更するよう設定しているが、そもそも表示の順序を下にするなどif文で制御したほうがいいかも
                                }
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
        .onAppear {
            requestNotificationPermission()
        }
    }
    // 言語対応は全てここに格納可能。
    // 使い方：　Text(localizedString("Tickets"))
    // Ticketsのようにキーを設定した配列である。
    func localizedString(_ key: String) -> String {
        switch selectedLanguage {
        case "🇯🇵日本語":
            return ["Program": "プログラム", "Home": "ホーム", "Browse": "見つける", "Search exhibits": "出展を検索する", "Notifications": "通知設定"][key] ?? key
        case "🇩🇪Deutsch":
            return ["Program": "Programm", "Home": "Startseite", "Browse": "Durchsuchen", "Search exhibits": "Exponate suchen", "Notifications": "Benachrichtigungen"][key] ?? key
        // それ以外はそのキーのまま返す
        default:
            return key
        }
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
    
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("Notification permission error: \(error.localizedDescription)")
            }
        }
    }

}

struct SettingsView: View {
    @AppStorage("selectedLanguage") private var selectedLanguage: String = "日本語"
    @State private var notifiedExhibitIDs: Set<UUID> = []
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
            
            // 出展の通知設定
            Section(header: Text("Notifications")) {
                List(exhibits) { exhibit in
                    Toggle(isOn: Binding(
                        get: { notifiedExhibitIDs.contains(exhibit.id) },
                        set: { isOn in
                            if isOn {
                                notifiedExhibitIDs.insert(exhibit.id)
                                scheduleNotification(for: exhibit)
                            } else {
                                notifiedExhibitIDs.remove(exhibit.id)
                                removeScheduledNotification(for: exhibit)
                            }
                        }
                    )) {
                        Text(exhibit.name)
                    }
                }
            }

        }
        .navigationTitle("Setting")
        
    }
    
    func removeScheduledNotification(for exhibit: Exhibit) {
        UNUserNotificationCenter.current()
            .removePendingNotificationRequests(withIdentifiers: [exhibit.id.uuidString])
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

func scheduleNotification(for exhibit: Exhibit) {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"
    
    guard let eventTime = formatter.date(from: exhibit.startTime) else { return }

    // 今日の日付に時刻を組み合わせる
    let calendar = Calendar.current
    let now = Date()
    var components = calendar.dateComponents([.year, .month, .day], from: now)
    let eventComponents = calendar.dateComponents([.hour, .minute], from: eventTime)
    components.hour = eventComponents.hour
    components.minute = eventComponents.minute

    guard let eventDate = calendar.date(from: components) else { return }
    let notificationDate = eventDate.addingTimeInterval(-600) // 10分前

    if notificationDate < now {
        return // 過去の通知はスキップ
    }

    let content = UNMutableNotificationContent()
    content.title = exhibit.name
    content.body = "Starts in 10 minutes: \(exhibit.name)"
    content.sound = .default

    let trigger = UNCalendarNotificationTrigger(dateMatching: calendar.dateComponents([.year, .month, .day, .hour, .minute], from: notificationDate), repeats: false)
    
    let request = UNNotificationRequest(identifier: exhibit.id.uuidString, content: content, trigger: trigger)
    
    UNUserNotificationCenter.current().add(request) { error in
        if let error = error {
            print("通知のスケジュール失敗: \(error.localizedDescription)")
        }
    }
}

func removeScheduledNotification(for exhibit: Exhibit) {
    UNUserNotificationCenter.current()
        .removePendingNotificationRequests(withIdentifiers: [exhibit.id.uuidString])
}


#Preview {
    ContentView()
}
