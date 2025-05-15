import SwiftUI
import UserNotifications

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
    var startTime: String // 開始時間
    var endTime: String  // 終了時間
    var roomname: String // 部屋空間名
}

// グローバル配列
let exhibits = [
    // Republic of Penguins
    Exhibit(name: "🐧Republic of Penguins", exhibitor: "Yuki Y.", description: "🎉We're collecting your penguins. Express your personality through drawing penguin🐧, which is a common 'language' that everybody knows. \n\n☺️Then fill the room with penguins and enjoy our personality!!", tag1: "drawyourpenguin", tag2: "republicofpenguin", tag3: "firstpenguin", imageName: "27_republic_of_penguins_cover", startTime: "Welcome", endTime: "", roomname: "Networking Lounge"),
    
    // Takibi tales
    Exhibit(name: "Takibi storytelling", exhibitor: "Sara Kimura", description: "Start 10:45, 16:00\nEnd 11:00, 16:30 \n\nThe ancient art of storytelling comes alive again. Just as a grandmother once whispered legends by the takibi - bonfire, I'll be sharing a tale from the rich tapestry of Japanese mythology.", tag1: "oneness", tag2: "storytelling", tag3: "sense of wonder", imageName: "1_takibi_tales", startTime: "10:45", endTime: "16:30", roomname:"Courtyard"),
    
    // Ichiju-Sansai
    Exhibit(name: "Ichiju-Sansai", exhibitor: "Momoko Sato, Keisaku Matsuzaki, Hannah, Airy Yamaguchi", description: "L.O. 13:30 \nClose 14:00 \n\nFor this event, we are adding a unique twist by incorporating elements of German cuisine, creating a Japanese-German fusion experience. \n\nVisitors will be able to explore both cultures by selecting from a variety of Japanese and German dishes to create their own custom Ichiju Sansai plate. Some of the dishes we serve will also highlight the health benefits and scientific background of the ingredients, such as the role of fermented foods or the importance of nutritional balance. Our goal is not to say that 'Japanese food is better,' but rather to encourage people to enjoy and appreciate the differences between food cultures. \n\nWe hope this event becomes a fun and meaningful opportunity to discover new tastes and connect with others through food.", tag1: "culturefusion through food", tag2: "ichiju-sansei experience", tag3: "health and scientific insights", imageName: "2_ichiju_sansai", startTime: "11:00", endTime: "13:30", roomname: "Networking Lounge"),
    
    // Köyri
    Exhibit(name: "Köyri/實り", exhibitor: "Keisuke Jitsuta", description: "Within my daily life, I experience my thoughts and actions as seeds that sprout and bear fruit in the immediate and subsequent moments. I'll be sharing a part of my life as an archive of photos and diary-like entries, capturing the days and moments when I particularly felt this.", tag1: "interwoven", tag2: "archive", tag3: "dependent co-arising", imageName: "3_köyri", startTime: "", endTime: "", roomname: "Seminar Room1"),
    
    // Dullstone・鈍石・Ein Stein
    Exhibit(name: "Dullstone・鈍石・Ein Stein", exhibitor: "Yurika Saito", description: "Experience the cycles of nature and time-touch stones from the sea and forest, walk among fabrics dyed with reused tea leaves from a Berlin restaurant, using the Japanese technique of 'Kusaki-zome', feel the time and rhythm held in what we see and touch.", tag1: "nature", tag2: "natural dye", tag3: "stone", imageName: "4_dullstone", startTime: "", endTime: "", roomname: "Seminar Room3"),
    
    // yadokari picnic
    Exhibit(name: "yadokari picnic", exhibitor: "burco", description: "Just as hermit crabs drift through the ocean of society, we gather under a shared shell. A space to pause, exchange, and to let things unfold - storytelling, music, open dialogues, shared experiences.", tag1: "co-creation", tag2: "spontaneity", tag3: "openness", imageName: "5_yadokari_picnic", startTime: "Welcome", endTime: "", roomname: "Courtyard"),
    
    // Forests
    Exhibit(name: "Forests", exhibitor: "Taiki Ishida", description: "This presentation invites us to realize the complexity and diversity of the word 'forest'.", tag1: "nature", tag2: "environment", tag3: "diversity", imageName: "6_forests", startTime: "", endTime: "", roomname: "Seminar Room3"),
    
    // In the Frame
    Exhibit(name: "In the Frame", exhibitor: "Kosuke Ito", description: "Taking in Structure \n\nI've come to find interesting structures when I walk around cities while thinking about myself and society. Using my photos taken in Cologne and Milan, I'll create a space for thinking about the future together.", tag1: "social structure", tag2: "future", tag3: "self-analysis", imageName: "7_in_the_frame_taking_into_structure", startTime: "14:00", endTime: "14:30", roomname: "Seminar Room2"),
    
    // Today is the first dancing day of the rest of your life
    // ゲリラ開催
    Exhibit(name: "Today is the first dancing day of the rest of your life", exhibitor: "Yuka Yano", description: "I started dancing after I grew up an adult, so it felt too late to make it my special skill. But l've always lived by the motto, 'Today is the youngest you'll ever be,' and kept searching for what I truly want to do. Now, l'm challenging myself to create my own choreography for the first time.", tag1: "dance", tag2: "hiphop", tag3: "", imageName: "8_today_is_the_first_dancing_day", startTime: "", endTime: "", roomname: "Others"),
    
    // Takoyaki
    Exhibit(name: "Takoyaki", exhibitor: "Kiki", description: "Close 16:30\n\nHot, crispy, and oh-so-yummy. Takoyaki time! 🔥🥢Let's all enjoy some delicious takoyaki!", tag1: "osaka", tag2: "delicious", tag3: "cheap", imageName: "9_takoyaki", startTime: "14:30", endTime: "16:30", roomname: "Networking Lounge"),
    
    // 場所不詳 -- ホワイエで可？
    // Ocho25 recycle x skateboard x Art:
    Exhibit(name: "Ocho25 Recycle x Skateboard x Art:", exhibitor: "Kiki", description: "Recycling skateboards and turning them into art pieces.", tag1: "recycle", tag2: "skateboard", tag3: "art", imageName: "10_ocho25_recycle", startTime: "", endTime: "", roomname: "foyer"),
    
    // What does the museum in Berlin want to tell us?
    Exhibit(name: "What does the museum in Berlin want to tell us?", exhibitor: "Honomi Kitaura", description: "Berlin has many museums. And each one of them has a message for us. What do they want to tell us? Through Berlin's museums, we will consider what museums should be.", tag1: "museology", tag2: "expression", tag3: "message", imageName: "11_berlin_museums", startTime: "", endTime: "", roomname: "Meeting Room1"),
    
    // The Pointe of Us
    Exhibit(name: "The Pointe of Us", exhibitor: "Karen Suzuki", description: "A ballet dancer is more than a performer-they express and connect with the world through their body. This project highlights each dancer's passion for ballet and their personal story of living as a dancer. Through their movements and words, we explore how they define themselves and what it means to live through dance. This is a place for all aspirational dancers-for everyone who", tag1: "aspirational dancers", tag2: "identity", tag3: "ballet", imageName: "12_the_pointe_of_us", startTime: "", endTime: "", roomname: "Meeting Room2"),
    
    // 場所不詳
    // A small world in a big world A big world in a small world
    Exhibit(name: "A small world in a big world A big world in a small world", exhibitor: "Ayu Ohiata", description: "In this world, everythings exist are formed of atoms. I express them as many grain circles in my works. When I pause for a moment in the passing time and feel about being here now. I feel very vague and connected but I feel ephemeral and tiny at the same time.", tag1: "atoms", tag2: "tsubumaru", tag3: "daily life", imageName: "13_small_big_world", startTime: "", endTime: "", roomname: "Others"),
    
    // Dancing the Waves of Emotion:
    Exhibit(name: "Dancing the Waves of Emotion", exhibitor: "Rin Houdatsu", description: "Meeting dance allowed the emotions long hidden deep within my heart to be set free. It felt like a door, which had been closed for so long, quietly opening. When the body and emotions connect and begin to communicate with one another, what is born from that moment? This time, through the beauty of Japanese dance, we will explore the deep connection between heart and body, and together, we will experience the moment when emotions transform into movement.", tag1: "expression", tag2: "free", tag3: "body", imageName: "14_dancing_the_waves", startTime: "16:45", endTime: "17:45", roomname: "Hall"),
    
    // Teeraum
    Exhibit(name: "Teeraum", exhibitor: "Sarasa Mikami, Yuta Chatani, Aya Ono", description: "L.O. 17:30 \nClose 18:00 \n\n11:00-11:30 Neri-Kiri Workshop \n12:30-13:00 Matcha Workshop \n14:00-14:30 Matcha Workshop \n15:00-15:30 Neri-Kiri Workshop \n\nA pop-up Japanese tea café offering over 10 kinds of tea, hands-on workshops, tastings, and tea knowledge. Experience Japanese tea culture through all five senses-from wagashi-making to matcha sweets.", tag1: "Japanese tea", tag2: "hospitality", tag3: "tradition", imageName: "15_teeraum_cover", startTime: "10:00", endTime: "17:30", roomname: "Networking Lounge"),
    
    // Inu ga Iru / The absence exists
    Exhibit(name: "Inu ga Iru / The absence exists", exhibitor: "Keian Takahashi", description: "It seems to be there, what is that? Yet it also seems not to be, however I noticed it. The one that's there isn't there, and the one that isn't there is. Those two appear to be connected, yet they also appear to be cut off from each other.", tag1: "geography", tag2: "situationist", tag3: "dérive", imageName: "16_inu_ga_iru", startTime: "", endTime: "", roomname: "Washroom"),
    
    // Hikari no oto -- The sound of light
    Exhibit(name: "Hikari no oto -- The sound of light", exhibitor: "Lily Kurosawa", description: "The world's light and everything it touches is so inexplicably beautiful. I will be painting the world the way I feel it-through my original music.", tag1: "nature", tag2: "sound", tag3: "life", imageName: "17_hikari_no_oto", startTime: "14:30", endTime: "15:15", roomname: "Hall"),
    
    // 場所不詳
    // From Hop to Hope
    Exhibit(name: "From Hop to Hope", exhibitor: "Yukari KITA", description: "This exhibition explores hops cultivation from anthropological view. It's just ingredient of beer but This tiny plant might hold the key to the future of agriculture.", tag1: "agriculture", tag2: "hops", tag3: "cultural anthropology", imageName: "18_from_hop_to_hope", startTime: "", endTime: "", roomname: "Meeting Room1"),
    
    // 共鳴/Resonance
    Exhibit(name: "共鳴/Resonance", exhibitor: "Kaito Kedashiro", description: "Acoustic Guitars are supposed to be played by one player basically. If Speaking tube was added to the guitar so that listeners can join singing into the tube as well as listening, I hope which will lead to more immersive and resonating experience with sounds. Listeners can be players.", tag1: "sound", tag2: "acoustic guitar", tag3: "listen", imageName: "19_resonance", startTime: "", endTime: "", roomname: "foyer"),
    
    // Projekt Trommel
    Exhibit(name: "Projekt Trommel", exhibitor: "Sayaka Katsumoto", description: "Wadaiko (Japanese drums) are traditional percussion instruments that are an essential part of religious ceremonies and festivals. \n\nHowever, particularly in western Japan, tanners and drum artisans have a history of being discriminated against. In a certain region in western Japan where research has been conducted for several years, a Wadaiko group was established in the 1990s and remains actively engaged to this day. \n\nThis sound installation was inspired by small drum toys made from water pipes and small pieces of leather that were created in a children's workshop held there, as well as by the telephone invented in Germany in 1861 by Johann Philipp Reis (1834-1874).", tag1: "Wadaiko", tag2: "sound installation", tag3: "leather", imageName: "20_projekt_trommel", startTime: "", endTime: "", roomname: "Seminar Room2"),
    
    // Rakugo
    Exhibit(name: "OCHIBA -Rakugo in the Tokyo cityscape-", exhibitor: "Wataru Nakayama", description: "OCHIBA is a project that creates temporary rakugo stages in urban spaces, bringing to life a landscape where rakugo naturally blends into everyday life. \n\nRakugo is a storytelling art in which a single performer sits on a cushion and paints vivid scenes using only words and gestures. The goal of our project is to foster a new resonance between Tokyo and rakugo-one that cannot be reached through imagination alone beyond the bounds of the theater.", tag1: "Rakugo", tag2: "temporary stage design", tag3: "urban intervention", imageName: "21_ochiba_rakugo", startTime: "", endTime: "", roomname: "Meeting Room2"),
    
    // Giving form to principles
    Exhibit(name: "Giving form to principles", exhibitor: "Kirari Shigematsu", description: "This is a compilation of my works with my phylosophy; 'Giving form to principles.' This exhibition brings together a wide range of works, from specific architectural proposals to abstract and sculptural explorations.", tag1: "architecture", tag2: "art", tag3: "principles", imageName: "22_giving_form_to_principles", startTime: "", endTime: "", roomname: "Meeting Room1"),
    
    // 場所不詳
    // Tracing the Dynamics
    Exhibit(name: "Structure, Dynamics, Spatial Design", exhibitor: "Wataru Nakayama", description: "This exhibition brings together a series of full-scale explorations - from a washi-paper catenary arch, to stage designs for rakugo and contemporary dance performances, to wooden furniture crafted by tracing the grain patterns of trees. Each work is an attempt to give form to the interaction between force and structure. By tracing the path of the line that defines each shape, I seek the invisible dynamics that resonate through space - tension, gravity, reaction. Structure is not merely something that supports form; it brings rhythm and movement into space.", tag1: "structure", tag2: "Dynamics", tag3: "spatial design", imageName: "33_tracing_the_dynamics", startTime: "", endTime: "", roomname: "Meeting Room1"),
    
    // 場所不詳
    // Architecture in Your hands
    Exhibit(name: "Architecture in Your Hands", exhibitor: "Maro Monto", description: "By distilling the essence of architecture into products, architecture is transformed into something small and tangible—architecture in the hand. \n\nThese products are designed by MaroMonto LLC, a startup founded by students of Kyoto University, aiming to highlight the playful and entertaining side of architecture", tag1: "products", tag2: "architecture", tag3: "Ramma", imageName: "24_architecture_in_your_hands", startTime: "", endTime: "", roomname: "Others"),
    
    // Trustware: Building Ethical Intelligence in the AI Age
    Exhibit(name: "Trustware: Building Ethical Intelligence in the AI Age", exhibitor: "Yuki Y.", description: "The talk show 'Trustware: Building Ethical Intelligence in the AI Age' will explore the critical importance of ethical intelligence in the context of artificial intelligence. \n\nThe presenter will engage in discussions regarding transparency, fairness, and accountability in AI development and usage. The event will highlight specific strategies and best practices (a workshop) for creating trustworthy AI systems, encouraging participants to reflect on the societal impacts of emerging technologies. This dialogue aims to foster a shared understanding of the necessity for ethical AI and promote the sustainable advancement of technology.", tag1: "”TRUSTWARE”", tag2: "ethics", tag3: "AI", imageName: "", startTime: "10:30", endTime: "11:00", roomname: "Hall"),
    
    // Kanji Architecture
    Exhibit(name: "Kanji Architecture", exhibitor: "Hiroki Miyata", description: "Kanji are ideographic characters used in both Japanese and Chinese writing systems. Their forms are deeply connected to the way people in Japan perceive the meanings behind the words they represent. Drawing inspiration from the visual and conceptual qualities of these characters, I developed an architectural design rooted in their shapes.", tag1: "kanji", tag2: "architecture", tag3: "postcard", imageName: "25_kanji_architecture", startTime: "", endTime: "", roomname: "Meeting Room1"),
    
    // 月面/moon
    Exhibit(name: "月面/moon", exhibitor: "Aoi", description: "There are moments when I realise that I am standing in a place that is familiar but new to me, and yet unique. \n\nThe memory of that experience is like the moon, shining and floating in a far-off corner of our minds. \n\nThis is an exhibit of photographs documenting them.", tag1: "place", tag2: "memory", tag3: "photograph", imageName: "26_moon", startTime: "", endTime: "", roomname: "foyer"),
    
    // Sky Jazz (Tiny Theater)
    Exhibit(name: "Tiny Theater -- SKY JAZZ: First Flight-日独LIVE", exhibitor: "Cameron Soesbe", description: "ON 'n' OFF line live performance featuring Acrostic band with singing and dancing in English. Blending Japanese and German inspiration. Ex: JP×DE hit song mash-up.", tag1: "performing", tag2: "borrowedscenery", tag3: "culture collaboration", imageName: "28_sky_jazz", startTime: "15:30", endTime: "15:45", roomname: "Courtyard"),
    
    // From Feeling stuck to the Next Step — Let’s find a Way Together
    Exhibit(name: "Next Step Together", exhibitor: "Ai Ishida", description: "From Feeling stuck to the Next Step -- Let's find a Way Together \nStart 11:30, 15:30 \nEnd 13:00, 17:00 \n\nThe topic of immigration and refugees is attracting growing attention from many people — and we are among them. \n\nHowever, because it is such a complex issue, it often feels difficult to engage with or to make progress in our thinking. \n\nStill, we cannot turn a blind eye to the problems happening right now. We want to step out of our own isolated worlds to take action. What are others thinking? Have they already formed a clear stance? Or are they also not sure? \n\nBy creating opportunities for interaction with many people, we hope this project can help each of us find an opening from our current sense of uncertainty toward the next step forward.", tag1: "open dialogue", tag2: "immigrant", tag3: "refugee", imageName: "29_next_step_together", startTime: "11:30", endTime: "17:00", roomname: "Information Lounge"),
    
    // Embraces
    Exhibit(name: "Embraces", exhibitor: "Toranosuke Sano", description: "“Jumping into a frozen lake is dangerous.” “Dogs are not allowed inside the store.” “I hate snow.” “Silent bathing in the sauna.” “Let’s build a residential area over there.” “Always listen to your parents.” \n\nThese are the kinds of statements I grew up surrounded by. Crossing borders, I’ve explored how I perceive the laws of nature, harmony, black boxes, social norms, activism, human relationships, and culture. This work is a filtered and colored expression of those reflections.", tag1: "harmony", tag2: "society", tag3: "ecology", imageName: "30_embraces", startTime: "", endTime: "", roomname: "Seminar Room2"),
    
    // The Art of Japanese Dance: An Introduction to Nihon Buyo
    // 花柳藍五郎 Aigoro Hanayagi 
    Exhibit(name: "The Art of Japanese Dance: An Introduction to Nihon Buyo", exhibitor: "Aigorou Hanayagi", description: "Nihon Buyo, a form of Japanese classical dance with a history of over 300 years, will be introduced in this program through clear and accessible explanations along with live demonstrations. Discover the meanings behind the use of fans and gestures, the beauty of stillness and movement, and the spirit of Japanese culture expressed through the art of dance.", tag1: "traditional", tag2: "dance", tag3: "kimono", imageName: "31_the_art_of_japanese_dance", startTime: "13:00", endTime: "14:00", roomname: "Hall"),
    
    // Windows to the world on earth
    Exhibit(name: "Windows to the world on earth", exhibitor: "WE", description: "We are all busy with our own worlds, but sometimes we need to pay attention to the world we all share—the world on our Earth. The WE, a small group of students, creates posters highlighting important facts about our planet. May our posters serve as windows to help realize the reality of this Earth.", tag1: "posters", tag2: "student-group", tag3: "social issues", imageName: "32_windows_to_the_world", startTime: "", endTime: "", roomname: "Seminar Room1"),
    
    // The way we have not taken - legacy from 1945 in Berlin and Tokyo
    Exhibit(name: "The way we have not taken - legacy from 1945 in Berlin and Tokyo", exhibitor: "Erika Iwashiro, Hiroki Miyata, Keishi Kato, Sakura Hagata, Tomoka Masuyama", description: "Negative Legacy — Berlin, where the past lingers like a fossil, and Tokyo, once turned to ash. Eighty years after the war, how should we carry these memories forward? \n\nAmid global unrest, we must revisit history’s lessons and reflect on which symbols deserve to endure. Through the intertwined stories of these two cities, our workshop explores what legacy generation then should have left—and how our generation might shape a future rooted in remembrance.", tag1: "legacy", tag2: "1945", tag3: "reformation", imageName: "new_original_legacy_tokyo_berlin", startTime: "11:30", endTime: "12:30", roomname: "Hall"),
]

// 通知スケジュールの雛形
struct Notification: Identifiable {
    let id = UUID() // 雛形を置くことで「一意の識別子」を設定できる
    let title: String
    let body: String
    let hour: Int
    let minute: Int
}

// 通知スケジュール
let notifications = [
    Notification(title: "🧠Trustware: Building Ethical Intelligence in the AI Age", body: "Yuki is speaking at 📍Hall.", hour: 10, minute: 20), // 10分前
    Notification(title: "City of Legacy - what should have remained in Berlin and Tokyo", body: "The new workshop is opening at 📍Hall", hour: 11, minute: 20), // 10分前
    Notification(title: "🎎The Art of Japanese Dance", body: "Experience Nihon Buyo🇯🇵 at 📍Hall", hour: 12, minute: 50), // ご本人の要望により10分前
    Notification(title: "🎹The sound of light", body: "Hikari no Oto at 📍Hall", hour: 14, minute: 20), // 10分前
    Notification(title: "🕺Dancing the Waves of Emotion", body: "Experience the moment when emotions transform into movement. 📍Hall", hour: 16, minute: 35), // 10分前
    Notification(title: "🍵Teeraum", body: "Japanese tea café opened !📍Networking Lounge", hour: 10, minute: 0), // オープン通知なので0分前
    Notification(title: "🍵Teeraum", body: "It's time for last orders.", hour: 17, minute: 25), // 5分前
    Notification(title: "🥢Ichiju-Sansai", body: "Experience Japanese food 📍Networking Lounge", hour: 11, minute: 0), // オープン通知なので0分前
    Notification(title: "🥢Ichiju-Sansai", body: "It's time for last orders.", hour: 13, minute: 55), // L.O.を5分前
    Notification(title: "🥢Ichiju-Sansai", body: "Closes in 10 minutes", hour: 14, minute: 20), // 終了通知を10分前に
    Notification(title: "Takoyaki", body: "Street Snack at 📍Networking Lounge", hour: 14, minute: 30), // オープン通知なので0分前
    Notification(title: "Takoyaki", body: "Closes in 10 minutes", hour: 16, minute: 20), // 終了通知を10分前に
    Notification(title: "Takibi Storytelling❶", body: "Sara is speaking at 📍Courtyard", hour: 10, minute: 40), // 5分前
    Notification(title: "Takibi Storytelling❷", body: "Sara is speaking at 📍Courtyard", hour: 15, minute: 55), // 5分前
    Notification(title: "🎧Tiny theater", body: "Let's listen to Sky Jazz at 📍Courtyard", hour: 15, minute: 25), // 5分前
    Notification(title: "🥋Physical Performance Talkshow", body: "Talkshow at 📍Courtyard", hour: 16, minute: 55), // 5分前
    Notification(title: "📚Next Step Together❶", body: "Join discussion at 📍Information Lounge", hour: 11, minute: 20), // 10分前
    Notification(title: "📚Next Step Together❷", body: "Join discussion at 📍Information Lounge", hour: 15, minute: 20), // 10分前
    Notification(title: "In the Frame", body: "Let's talk at 📍Seminar Room 1&2.", hour: 14, minute: 25), // 5分前
    Notification(title: "Test Notification", body: "Look forward to today's exhibitions!", hour: 19, minute: 30) // イベント30分前
]

// 言語対応は全てここに格納可能。
// 使い方：　Text(localizedString("Tickets"))
func localizedString(_ key: String, selectedLanguage: String) -> String {
    switch selectedLanguage {
    case "🇯🇵日本語":
        return ["Program": "プログラム", "Home": "ホーム", "Links": "リンク一覧", "Search for exhibits": "出展を検索する", "Notifications": "通知設定", "Exhibits": "コンセプト", "Roomnames": "空間通称", "Herzlich willkommen beim Japanisch-Deutschen Zentrum Berlin\nDie gemeinnützige Stiftung hat es sich zur Aufgabe gemacht, den deutsch-japanischen und internationalen Austausch auf den Ebenen von Wirtschaft, Wissenschaft, Kultur, Gesellschaft und Politik zu fördern und zu vertiefen. Damit tragen wir seit 1985 zur politischen und wirtschaftlichen Entwicklung unserer Länder bei. Wir hoffen, Sie bald – physisch oder virtuell – bei uns begrüßen zu können.\n\nExcerpt from the official website." :"ベルリン日独センターへようこそベルリン日独センターは、ビジネス、科学、文化、社会、政治の各分野における日独および国際交流の促進と深化を使命とする非営利財団です。1985年の設立以来、日独両国の政治・経済の発展に貢献しています。公式ウェブサイトより抜粋。", "SHUHARI is an event organized by Japanese youth based in Europe, celebrating expression and dialogue. It will take place in May 2025, featuring over 50 creatives, involving a range of workshops, performances, exhibitions, talks, and authentic Japanese food stalls.\nBy holding space for young people to express and share Japanese culture, we aim to deepen intercultural exchange and lay the groundwork for future international business opportunities. The event is held in cooperation with the Japanese-German Center Berlin and the Tobitate! (Leap for Tomorrow) JAPAN Scholarship Program by the Japanese Ministry of Education, Culture, Sports, Science and Technology (MEXT). We are currently seeking sponsorships from companies and organizations that share our vision, through both financial and in-kind support.":"私たちは、ヨーロッパで過ごす中で、「表現すること」が生活の一部として自然に根付いている文化に出会いました。日常の中で、考えたことをすぐに口に出し、形にしてみる。その繰り返しが、より大きな波紋となって、エネルギーの輪を広げていることを実感しています。一方で、海外に出てはじめて気づいたのは、日本国内に存在する分野間の壁や、「型」への同調圧力が、知らず知らずのうちに私たち自身の表現にブレーキをかけているということです。だからこそ、私たちは思いました。「個人の表現をきっかけに、分野や立場を超えた対話が生まれる場をつくりたい」。\n \n守破離は、日本の伝統的な武道や茶道、芸術などで修行の道筋を示す概念です。この学びのプロセスに、私たちは創造のヒントを見出しました。世界各地で模索を続ける若者たちの問いや表現が、この「守破離」の考えを軸に集まり、新たな出会いと創造が交わる場一それが、本展 SHUHARI 守破離です。", "🖼️Official HP": "🖼️公式HP", "✈️Official HP":"✈️公式HP", "🇩🇪jdzb's Page":"🇩🇪jdzb公式サイトでのお知らせ", "🎟️Get Tickets": "🎟️チケットを入手", "🌊Instagram":"🌊インスタグラム", "📸Instagram":"📸インスタグラム", "About SHUHARI":"守破離とは", "About Tobitate!": "トビタテとは", "The Ministry of Education, Culture, Sports, Science and Technology (MEXT) launched the “Tobitate! Study Abroad Initiative” in 2013, a public-private project for promoting overseas study, with the aim of creating the momentum for all young Japanese university and high school students with the motivation and potential to take the first step toward studying abroad.\n\nIn the first stage (from 2013 to 2022), approximately 9,500 students were selected under Tobitate's scholarship program, Tobitate Young Ambassador Program. They experienced diverse practical activities overseas, and were developed as global leaders.\n\nBased on these achievements, we are implementing the second stage (from 2023 to 2027) with a new vision and concept to continue to strengthen efforts for the development of global leaders by encouraging cooperation among industry, government, and academia.\n\nIn the second stage, we introduce a new vision seeking to build a “society where Japanese youth can take on the challenges of the world, collaborate with people domestically and internationally with ‘candor and determination’, and drive innovation and transformation” together with the concept of “challenge, connect, and co-create”.":"文部科学省は、意欲と能力ある全ての日本の大学生や高校生が、海外留学に自ら一歩を踏み出す機運を醸成することを目的として、2013年に留学促進キャンペーン「トビタテ！留学JAPAN」を開始しました。\n\n第1ステージ（2013年度～2022年度）に実施した海外留学支援制度「日本代表プログラム」においては約9,500人の若者が採択され、海外での多様な実践活動の経験等を経て、グローバル人材としての成長を遂げています。\n\nこのような成果を踏まえ、引き続き、産学官をあげてグローバル人材育成の取組を強化するため、2023年度から新たなビジョン及びコンセプトを掲げた第2ステージ（2023年度～2027年度）を実施しています。","Development":"このアプリの開発について", "Developed by Yuki, \nDesigned by SHUHARI team.\n\n✅There may be updates or changes to some content, but these will NOT be automatically reflected in the app unless manually updated by the developer. Some translation tools are utilized.\n\nFeel free to talk to me if you need help.":"Developed by Yuki, \nDesigned by SHUHARI team.\n\n✅一部コンテンツに更新・変更がある場合がありますが、それらは通常developerの手により反映されない限りこのアプリに自動で更新が加わることはありません。一部翻訳ツールを利用しています。\n\n助けが必要な時は呼んでくださいね！","🐧Dev's Instagram":"🐧開発者のインスタ！", "Only specific parts will be applied. Exhibit content will remain untranslated to prevent mistranslation.":"一部のみ言語対応しています。たとえば出展内容は誤訳を避けるため英語訳のままです。","Settings":"アプリ内設定","Language":"言語設定", "Aigorou Hanayagi":"花柳藍五郎"][key] ?? key
    case "🇩🇪Deutsch":
        return ["Program": "Programm", "Home": "Startseite", "Links": "Links", "Search for exhibits": "Exponate suchen", "Notifications": "Benachrichtigungen", "Exhibits": "Konzept", "Roomnames": "Raumnamen", "Herzlich willkommen beim Japanisch-Deutschen Zentrum Berlin\nDie gemeinnützige Stiftung hat es sich zur Aufgabe gemacht, den deutsch-japanischen und internationalen Austausch auf den Ebenen von Wirtschaft, Wissenschaft, Kultur, Gesellschaft und Politik zu fördern und zu vertiefen. Damit tragen wir seit 1985 zur politischen und wirtschaftlichen Entwicklung unserer Länder bei. Wir hoffen, Sie bald – physisch oder virtuell – bei uns begrüßen zu können.\n\nExcerpt from the official website.":"Herzlich willkommen beim Japanisch-Deutschen Zentrum Berlin\nDie gemeinnützige Stiftung hat es sich zur Aufgabe gemacht, den deutsch-japanischen und internationalen Austausch auf den Ebenen von Wirtschaft, Wissenschaft, Kultur, Gesellschaft und Politik zu fördern und zu vertiefen. Damit tragen wir seit 1985 zur politischen und wirtschaftlichen Entwicklung unserer Länder bei. Wir hoffen, Sie bald – physisch oder virtuell – bei uns begrüßen zu können.\n\nAuszug von der offiziellen Website.",
                "SHUHARI is an event organized by Japanese youth based in Europe, celebrating expression and dialogue. It will take place in May 2025, featuring over 50 creatives, involving a range of workshops, performances, exhibitions, talks, and authentic Japanese food stalls.\nBy holding space for young people to express and share Japanese culture, we aim to deepen intercultural exchange and lay the groundwork for future international business opportunities. The event is held in cooperation with the Japanese-German Center Berlin and the Tobitate! (Leap for Tomorrow) JAPAN Scholarship Program by the Japanese Ministry of Education, Culture, Sports, Science and Technology (MEXT). We are currently seeking sponsorships from companies and organizations that share our vision, through both financial and in-kind support.":
                    "SHUHARI ist eine Veranstaltung, die von japanischen Jugendlichen in Europa organisiert wird, um Ausdruck und Dialog zu fördern. Sie findet im Mai 2025 statt und bietet über 50 Kreativen eine Reihe von Workshops, Performances, Ausstellungen, Gesprächen und authentischen japanischen Essensständen. Indem wir jungen Menschen Raum geben, die japanische Kultur auszudrücken und zu teilen, wollen wir den interkulturellen Austausch vertiefen und den Grundstein für zukünftige internationale Geschäftsmöglichkeiten legen. Die Veranstaltung findet in Zusammenarbeit mit dem Japanisch-Deutschen Zentrum Berlin und dem Tobitate! (Leap for Tomorrow) JAPAN-Stipendienprogramm des japanischen Ministeriums für Bildung, Kultur, Sport, Wissenschaft und Technologie (MEXT). Wir sind derzeit auf der Suche nach Sponsoren aus Unternehmen und Organisationen, die unsere Vision teilen, sowohl durch finanzielle als auch durch Sachspenden.", "🖼️Official HP": "🖼️offizielle HP", "✈️Official HP":"✈️offizielle HP", "🇩🇪jdzb's Page":"🇩🇪jdzd's Page", "🎟️Get Tickets":"🎟️Get Tickets", "🌊Instagram":"🌊Instagram", "📸Instagram":"📸Instagram", "About SHUHARI":"über SHUHARI", "About Tobitate!":"über Tobitate!", "The Ministry of Education, Culture, Sports, Science and Technology (MEXT) launched the “Tobitate! Study Abroad Initiative” in 2013, a public-private project for promoting overseas study, with the aim of creating the momentum for all young Japanese university and high school students with the motivation and potential to take the first step toward studying abroad.\n\nIn the first stage (from 2013 to 2022), approximately 9,500 students were selected under Tobitate's scholarship program, Tobitate Young Ambassador Program. They experienced diverse practical activities overseas, and were developed as global leaders.\n\nBased on these achievements, we are implementing the second stage (from 2023 to 2027) with a new vision and concept to continue to strengthen efforts for the development of global leaders by encouraging cooperation among industry, government, and academia.\n\nIn the second stage, we introduce a new vision seeking to build a “society where Japanese youth can take on the challenges of the world, collaborate with people domestically and internationally with ‘candor and determination’, and drive innovation and transformation” together with the concept of “challenge, connect, and co-create”.":"Das japanische Ministerium für Bildung, Kultur, Sport, Wissenschaft und Technologie (MEXT) hat im Jahr 2013 die „Tobitate! Study Abroad Initiative“ ins Leben gerufen – ein öffentlich-privates Projekt zur Förderung von Auslandsaufenthalten. Ziel ist es, möglichst vielen motivierten und potenzialreichen japanischen Schülerinnen und Studierenden den ersten Schritt ins Ausland zu ermöglichen und damit eine neue Dynamik für internationale Bildung zu schaffen.\n\nIn der ersten Phase (2013–2022) wurden rund 9.500 Teilnehmerinnen im Rahmen des Tobitate Young Ambassador Program ausgewählt. Sie nahmen an vielfältigen praxisorientierten Programmen im Ausland teil und entwickelten sich zu künftigen globalen Führungspersönlichkeiten.\n\nAuf diesen Erfolgen aufbauend wird derzeit die zweite Phase (2023–2027) mit einer neuen Vision und einem weiterentwickelten Konzept umgesetzt. Ziel ist es, die Entwicklung globaler Talente durch verstärkte Zusammenarbeit zwischen Wirtschaft, Staat und Wissenschaft weiter voranzutreiben.\n\nDiese neue Phase steht unter der Vision einer Gesellschaft, in der junge Menschen aus Japan sich mutig den globalen Herausforderungen stellen, mit Offenheit und Entschlossenheit international wie national zusammenarbeiten und gemeinsam Innovation und Wandel vorantreiben – ganz im Sinne des neuen Leitmotivs: Herausfordern, Vernetzen, Mitgestalten.","Developed by Yuki, \nDesigned by SHUHARI team.\n\n✅There may be updates or changes to some content, but these will NOT be automatically reflected in the app unless manually updated by the developer. Some translation tools are utilized.\n\nFeel free to talk to me if you need help.":"Entwickelt von Yuki, \nEntworfen vom SHUHARI-Team.\n\n✅Es kann Aktualisierungen oder Änderungen an bestimmten Inhalten geben, aber diese werden NICHT automatisch in der App angezeigt, es sei denn, sie werden manuell vom Entwickler aktualisiert. Einige Übersetzungstools werden verwendet.\n\nRuf mich an, wenn du Hilfe brauchst!","🐧Dev's Instagram":"🐧Yuki's Instagram","Only specific parts will be applied. Exhibit content will remain untranslated to prevent mistranslation.":"Einige Teile sind nur teilweise übersetzt. Zum Beispiel bleibt der Inhalt der Quellenangabe aus Gründen der Genauigkeit im Englischen.","Settings":"Einstellungen","Language":"Sprache", "Aigorou Hanayagi":"Aigorou Hanayagi"][key] ?? key
    // それ以外はそのキーのまま返す
    default:
        return key
    }
}

// ContentView本体
struct ContentView: View {
    @AppStorage("selectedLanguage") private var selectedLanguage: String = "日本語"
    @State private var searchText: String = ""
    
    // 例としてのroomToExhibitの作成
    let roomToExhibit: [String: [Exhibit]] = Dictionary(grouping: exhibits, by: { $0.roomname })
    
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
                    $0.tag3.localizedCaseInsensitiveContains(searchText) ||
                    $0.roomname.localizedCaseInsensitiveContains(searchText)
                }
            }
        }
    
    var groupedExhibits: [String: [Exhibit]] {
        Dictionary(grouping: filteredExhibits, by: { $0.roomname })
    }

    var body: some View {
        TabView {
            // Programmeタブ
            NavigationView {
                FloorMapView(roomToExhibit: groupedExhibits)
            }.tabItem {
                Image(systemName: "map")
                Text(localizedString("Program", selectedLanguage: selectedLanguage))
            }
            
            // Homeタブ
            NavigationView {
                List {
                // カスタムソートを適用
                let sortedRooms = groupedExhibits.keys.sorted { room1, room2 in
                    if room1 == "Networking Lounge" {
                        return true // "Networking Lounge"を一番上に
                    }
                    if room2 == "Networking Lounge" {
                        return false // 他の部屋より下に
                    }
                    return room1 < room2 // 通常のアルファベット順
                }

                    ForEach(sortedRooms, id: \.self){ room in
                        Section(header: Text(room).font(.headline)) {
                            let exhibits = groupedExhibits[room] ?? []
                            
                            ForEach(exhibits, id: \.id) { exhibit in
                                NavigationLink(destination: ExhibitDetailView(exhibit: exhibit)) {
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
                                            if !exhibit.startTime.isEmpty {
                                                Text(exhibit.startTime)
                                                    .foregroundColor(colorForTime(exhibit.startTime, exhibit.endTime))
                                            }
                                        }
                                    }
                                    .padding(.vertical, 4)
                                }
                            }
                        }
                    }
                }
                .navigationTitle(localizedString("Home", selectedLanguage: selectedLanguage))
                .searchable(text: $searchText, prompt: localizedString("Search for exhibits", selectedLanguage: selectedLanguage))
                .navigationBarItems(trailing:
                                    NavigationLink(destination: SettingsView()) {
                                        Image(systemName: "gear")
                                            .foregroundColor(.blue)
                                    }
                                )
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text(localizedString("Home", selectedLanguage: selectedLanguage))
            }
            
            // ShuHaRiの説明など
            // 何度も見ることは想定されないタブ
            NavigationView{
                List {
                    /* TO-DO ここら辺は日本語訳・ドイツ語訳を準備しておくと良い。*/
                    // 守破離の説明
                    Section(header: Text(localizedString("About SHUHARI", selectedLanguage: selectedLanguage)).font(.headline)) {
                        Image("shuhari_wide_poster")
                            .resizable()
                            .scaledToFit()
                            .clipped()
                            .cornerRadius(8)
                        Image("shuhari_introduction")
                            .resizable()
                            .scaledToFit()
                            .clipped()
                            .cornerRadius(8)
                        Text(localizedString("SHUHARI is an event organized by Japanese youth based in Europe, celebrating expression and dialogue. It will take place in May 2025, featuring over 50 creatives, involving a range of workshops, performances, exhibitions, talks, and authentic Japanese food stalls.\nBy holding space for young people to express and share Japanese culture, we aim to deepen intercultural exchange and lay the groundwork for future international business opportunities. The event is held in cooperation with the Japanese-German Center Berlin and the Tobitate! (Leap for Tomorrow) JAPAN Scholarship Program by the Japanese Ministry of Education, Culture, Sports, Science and Technology (MEXT). We are currently seeking sponsorships from companies and organizations that share our vision, through both financial and in-kind support.", selectedLanguage: selectedLanguage))
                        Link(localizedString("🖼️Official HP",selectedLanguage: selectedLanguage), destination: URL(string: "https://shuhariberlin.github.io/official/")!)
                            .foregroundColor(.blue)
                        Link(localizedString("🇩🇪jdzb's Page", selectedLanguage: selectedLanguage), destination: URL(string: "https://jdzb.de/de/veranstaltungen/tobitate-event-shuhari-berlin-festival-2025")!)
                            .foregroundColor(.blue)
                        Link(localizedString("🎟️Get Tickets", selectedLanguage: selectedLanguage), destination: URL(string: "https://rausgegangen.de/en/events/shuhari-berlin-festival-2025-1/")!)
                            .foregroundColor(.blue)
                        Link(localizedString("🌊Instagram", selectedLanguage: selectedLanguage), destination: URL(string: "https://www.instagram.com/shuhari_berlin/")!)
                            .foregroundColor(.blue)
                        
                    }
                    
                    // 日独ベルリンセンターの説明
                    Section(header: Text("Japanisch-Deutsches Zentrum Berlin").font(.headline)){
                        Image("jdzb_logo")
                            .resizable()
                            .scaledToFit()
                            .clipped()
                            .cornerRadius(8)
                        Text(localizedString("Herzlich willkommen beim Japanisch-Deutschen Zentrum Berlin\nDie gemeinnützige Stiftung hat es sich zur Aufgabe gemacht, den deutsch-japanischen und internationalen Austausch auf den Ebenen von Wirtschaft, Wissenschaft, Kultur, Gesellschaft und Politik zu fördern und zu vertiefen. Damit tragen wir seit 1985 zur politischen und wirtschaftlichen Entwicklung unserer Länder bei. Wir hoffen, Sie bald – physisch oder virtuell – bei uns begrüßen zu können.\n\nExcerpt from the official website.", selectedLanguage: selectedLanguage))
                        Link(localizedString("🖼️Official HP", selectedLanguage: selectedLanguage), destination: URL(string: "https://jdzb.de/de")!)
                            .foregroundColor(.blue)
                        Link(localizedString("📸Instagram", selectedLanguage: selectedLanguage), destination: URL(string: "https://www.instagram.com/jdzb.pr/")!)
                            .foregroundColor(.blue)
                    }
                    
                    // トビタテの説明
                    Section(header: Text(localizedString("About Tobitate!", selectedLanguage: selectedLanguage)).font(.headline)) {
                        Image("tobitate_logo")
                            .resizable()
                            .scaledToFit()
                            .clipped()
                            .cornerRadius(8)
                        Text(localizedString("The Ministry of Education, Culture, Sports, Science and Technology (MEXT) launched the “Tobitate! Study Abroad Initiative” in 2013, a public-private project for promoting overseas study, with the aim of creating the momentum for all young Japanese university and high school students with the motivation and potential to take the first step toward studying abroad.\n\nIn the first stage (from 2013 to 2022), approximately 9,500 students were selected under Tobitate's scholarship program, Tobitate Young Ambassador Program. They experienced diverse practical activities overseas, and were developed as global leaders.\n\nBased on these achievements, we are implementing the second stage (from 2023 to 2027) with a new vision and concept to continue to strengthen efforts for the development of global leaders by encouraging cooperation among industry, government, and academia.\n\nIn the second stage, we introduce a new vision seeking to build a “society where Japanese youth can take on the challenges of the world, collaborate with people domestically and internationally with ‘candor and determination’, and drive innovation and transformation” together with the concept of “challenge, connect, and co-create”.",selectedLanguage: selectedLanguage))
                        Link(localizedString("✈️Official HP", selectedLanguage: selectedLanguage), destination: URL(string: "https://tobitate-mext.jasso.go.jp/about/english.html")!)
                            .foregroundColor(.blue)
                        Link(localizedString("🌊Instagram", selectedLanguage: selectedLanguage), destination: URL(string: "https://www.instagram.com/ryugaku_daizukan/")!)
                            .foregroundColor(.blue)
                        
                    }
                    
                    // 開発者の説明
                    Section(header: Text(localizedString("Development", selectedLanguage: selectedLanguage)).font(.headline)) {
                        Image("dev_photo")
                            .resizable()
                            .scaledToFit()
                            .clipped()
                            .cornerRadius(8)
                        Text(localizedString("Developed by Yuki, \nDesigned by SHUHARI team.\n\n✅There may be updates or changes to some content, but these will NOT be automatically reflected in the app unless manually updated by the developer. Some translation tools are utilized.\n\nFeel free to talk to me if you need help.", selectedLanguage: selectedLanguage))
                        Link("💻Dev's GitHub", destination: URL(string: "https://github.com/YukiYotsu/ShuHaRi/")!)
                            .foregroundColor(.blue)
                        Link(localizedString("🐧Dev's Instagram", selectedLanguage: selectedLanguage), destination: URL(string: "https://www.instagram.com/yuki.yotsu/")!)
                            .foregroundColor(.blue)
                    }
                }
                .navigationTitle(localizedString("Links", selectedLanguage: selectedLanguage))
            }
            .tabItem {
                Image(systemName: "location.fill")
                Text(localizedString("Links", selectedLanguage: selectedLanguage))
            }
        }
        .onAppear {
            requestNotificationAuthorization()
            scheduleNotifications() //
        }
        .onChange(of: selectedLanguage) { print("Selected language changed to: \(selectedLanguage)") }
        
    }
    
    // 色変更関数
    func colorForTime(_ startTime: String, _ endTime: String) -> Color {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        guard let eventTime = formatter.date(from: startTime) else {
            return .primary // 変換できなければデフォルト色
        }
        guard let eventCloseTime = formatter.date(from: endTime) else {
            return .primary // 変換できなければデフォルト色
        }

        // 現在時刻と比較（同じ日付として処理）
        let calendar = Calendar.current

        let now = Date()
        let nowComponents = calendar.dateComponents([.hour, .minute], from: now)
        let eventComponents = calendar.dateComponents([.hour, .minute], from: eventTime)
        let eventCloseComponents = calendar.dateComponents([.hour, .minute], from: eventCloseTime)
        
        if let nowHour = nowComponents.hour,
           let nowMinute = nowComponents.minute,
           let eventHour = eventComponents.hour,
           let eventMinute = eventComponents.minute,
           let eventCloseHour = eventCloseComponents.hour,
           let eventCloseMinute = eventCloseComponents.minute
        {
            
            if (eventCloseHour < nowHour) || (eventCloseHour == nowHour && eventCloseMinute < nowMinute){
                return .red // 終了時間を過ぎている
                
            } else if (eventHour < nowHour) || (eventHour == nowHour && eventMinute < nowMinute) {
                return .orange // 開始時間を過ぎている
            } else {
                return .green // まだ来ていない
            }
            
            
        }
        return .primary
    }
    
    /* ===== これ以降通知設定 ===== */
    func requestNotificationAuthorization() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { granted, error in
            if granted {
                print("Notification permission granted.")
            } else if let error = error {
                print("Error requesting notification permission: \(error.localizedDescription)")
            }
        }
    }

    func scheduleNotifications() {
        
        // for文で中身をひとつずつ取り出す
        for notification in notifications {
            let content = UNMutableNotificationContent()
            content.title = notification.title
            content.body = notification.body
            content.sound = .default

            var dateComponents = DateComponents()
            dateComponents.hour = notification.hour
            dateComponents.minute = notification.minute

            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)

            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print("Error scheduling notification: \(error.localizedDescription)")
                } else {
                    print("Notification scheduled for \(notification.title) at \(notification.hour):\(notification.minute)")
                }
            }
        }
    }

}


struct SettingsView: View {
    @AppStorage("selectedLanguage") private var selectedLanguage: String = "🇯🇵日本語"

    let languages = ["🇯🇵日本語", "🇩🇪Deutsch", "🇬🇧English"]

    var body: some View {
        Form {
            Section(header: Text(localizedString("Language", selectedLanguage: selectedLanguage))) {
                Picker("言語", selection: $selectedLanguage) {
                    ForEach(languages, id: \.self) { language in
                        Text(language).tag(language)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                Text(localizedString("Only specific parts will be applied. Exhibit content will remain untranslated to prevent mistranslation.", selectedLanguage: selectedLanguage))
                    .padding([.horizontal])
                    .foregroundColor(.secondary)
            }

            // 出展の通知設定
            Section(header: Text("Notifications' Schedule")) {
                ForEach(notifications.sorted(by: { ($0.hour, $0.minute) < ($1.hour, $1.minute) })) { notification in
                    let timeString = String(format: "%02d:%02d", notification.hour, notification.minute)
                    VStack(alignment: .leading) {
                        Text(timeString)
                            .font(.subheadline)
                            .foregroundColor(.gray) // 薄字
                        Text(notification.title)
                            .font(.headline)
                        Text(notification.body)
                            .font(.subheadline)
                            .foregroundColor(.gray) // 薄字
                    }
                    .padding(.bottom, 10)
                    .padding(.top, 5) // 上部の余白
                    .background(Color.clear) // 必要に応じて背景を設定
                }
            }
        }
        .navigationTitle(localizedString("Settings", selectedLanguage: selectedLanguage))
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
                Text(exhibit.exhibitor)
                    .padding([.horizontal])
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Text("🕒" + exhibit.startTime)
                    .foregroundColor(colorForTime(exhibit.startTime, exhibit.endTime))
                    .bold()
                    .padding([.horizontal])
                Text("📍" + exhibit.roomname)
                    .padding([.horizontal])
                    .foregroundColor(.secondary)
                Spacer()
                    
                Text(exhibit.description)
                    .font(.body)
                    .padding([.horizontal])
                
                Spacer()
                
            }
            .navigationTitle(exhibit.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    // 色変更関数
    func colorForTime(_ startTime: String, _ endTime: String) -> Color {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        guard let eventTime = formatter.date(from: startTime) else {
            return .primary // 変換できなければデフォルト色
        }
        guard let eventCloseTime = formatter.date(from: endTime) else {
            return .primary // 変換できなければデフォルト色
        }

        // 現在時刻と比較（同じ日付として処理）
        let calendar = Calendar.current

        let now = Date()
        let nowComponents = calendar.dateComponents([.hour, .minute], from: now)
        let eventComponents = calendar.dateComponents([.hour, .minute], from: eventTime)
        let eventCloseComponents = calendar.dateComponents([.hour, .minute], from: eventCloseTime)
        
        if let nowHour = nowComponents.hour,
           let nowMinute = nowComponents.minute,
           let eventHour = eventComponents.hour,
           let eventMinute = eventComponents.minute,
           let eventCloseHour = eventCloseComponents.hour,
           let eventCloseMinute = eventCloseComponents.minute
        {
            
            if (eventCloseHour < nowHour) || (eventCloseHour == nowHour && eventCloseMinute < nowMinute){
                return .red // 終了時間を過ぎている
                
            } else if (eventHour < nowHour) || (eventHour == nowHour && eventMinute < nowMinute) {
                return .orange // 開始時間を過ぎている
            } else {
                return .green // まだ来ていない
            }
            
            
        }
        return .primary
    }
}

// 館内マップビュー
struct FloorMapView: View {
    @State private var showRoomnames = false
    @State private var showExhibits = true
    @State private var selectedExhibit: [Exhibit]? = nil

    @State private var scale: CGFloat = 1.0
    @State private var lastScale: CGFloat = 1.0
    @State private var offset: CGSize = .zero
    @State private var lastOffset: CGSize = .zero

    @State private var showTimetable = false
    
    let roomToExhibit: [String: [Exhibit]]

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Toggle("Exhibits", isOn: $showExhibits)
                        .onChange(of: showExhibits){ newValue in
                            if newValue {
                                showRoomnames = false
                            }
                        }
                    Toggle("Roomnames", isOn: $showRoomnames)
                        .onChange(of: showRoomnames) { newValue in
                            if newValue {
                                showExhibits = false
                            }
                        }
                }
                .padding()

                GeometryReader { geo in
                    ZStack {
                        Image("floor_map_base")
                            .resizable()
                            .scaledToFit()
//                            .frame(width: geo.size.width)
                            .scaleEffect(scale)
                            .offset(offset)
                            .gesture(
                                SimultaneousGesture(
                                    MagnificationGesture()
                                        .onChanged { value in
                                            scale = lastScale * value
                                        }
                                        .onEnded { _ in
                                            lastScale = scale
                                        },
                                    DragGesture()
                                        .onChanged { gesture in
                                            offset = CGSize(
                                                width: lastOffset.width + gesture.translation.width,
                                                height: lastOffset.height + gesture.translation.height
                                            )
                                        }
                                        .onEnded { _ in
                                            lastOffset = offset
                                        }
                                )
                            )


                        if showExhibits {
                            Image("layer_exhibits")
                                .resizable()
                                .scaledToFit()
                                .scaleEffect(scale)
                                .offset(offset)
                                .gesture(
                                    SimultaneousGesture(
                                        MagnificationGesture()
                                            .onChanged { value in
                                                scale = lastScale * value
                                            }
                                            .onEnded { _ in
                                                lastScale = scale
                                            },
                                        DragGesture()
                                            .onChanged { gesture in
                                                offset = CGSize(
                                                    width: lastOffset.width + gesture.translation.width,
                                                    height: lastOffset.height + gesture.translation.height
                                                )
                                            }
                                            .onEnded { _ in
                                                lastOffset = offset
                                            }
                                    )
                                )

                        }

                        if showRoomnames {
                            Image("layer_roomnames")
                                .resizable()
                                .scaledToFit()
//                                .frame(width:
                                .scaleEffect(scale)
                                .offset(offset)
                                .gesture(
                                    SimultaneousGesture(
                                        MagnificationGesture()
                                            .onChanged { value in
                                                scale = lastScale * value
                                            }
                                            .onEnded { _ in
                                                lastScale = scale
                                            },
                                        DragGesture()
                                            .onChanged { gesture in
                                                offset = CGSize(
                                                    width: lastOffset.width + gesture.translation.width,
                                                    height: lastOffset.height + gesture.translation.height
                                                )
                                            }
                                            .onEnded { _ in
                                                lastOffset = offset
                                            }
                                    )
                                )

                        }
                    }
                }
                Spacer()
                TimetableButtonWrapper()
                    .frame(height: 44) // 高さ調整
                    .padding(.horizontal)
                Text("Search for your favorite on the 'Home' page.")
                    .padding([.horizontal])
                    .foregroundColor(.secondary)
                Spacer()
                Spacer()
                Spacer()
            }
            .onReceive(NotificationCenter.default.publisher(for: Foundation.Notification.Name("ShowTimetableImage"))) { _ in
                showTimetable = true
            }
            .sheet(isPresented: $showTimetable) {
                ZoomableImageView(imageName: "Timetable")
            }
            
            
        }
    }
    
}

// Timetable表示するボタンの設定Wrap
struct TimetableButtonWrapper: UIViewRepresentable {
    func makeUIView(context: Context) -> TimetableButtonView {
        return TimetableButtonView()
    }

    func updateUIView(_ uiView: TimetableButtonView, context: Context) {
        // 何もしない
    }
}

// Timetable表示用View
struct ZoomableImageView: View {
    let imageName: String
    
    // Zoom用State
    @State private var scale: CGFloat = 1.0
    @State private var lastScale: CGFloat = 1.0
    // Swipe用State
    @State private var offset: CGSize = .zero
    @State private var lastOffset: CGSize = .zero

    var body: some View {
        VStack {
            Text("📅Timetable")
                .font(.title)
                .padding()

            GeometryReader { geometry in
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(scale)
                    .offset(offset)
                    .gesture(
                        SimultaneousGesture(
                            MagnificationGesture()
                                .onChanged { value in
                                    scale = lastScale * value
                                }
                                .onEnded { _ in
                                    lastScale = scale
                                },
                            DragGesture()
                                .onChanged { gesture in
                                    offset = CGSize(
                                        width: lastOffset.width + gesture.translation.width,
                                        height: lastOffset.height + gesture.translation.height
                                    )
                                }
                                .onEnded { _ in
                                    lastOffset = offset
                                }
                        )
                    )
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
