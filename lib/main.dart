// ===== FF AJWAN - FINAL & REVIEWED CODE =====
// This file contains the entire application code, reviewed and ready for build.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

// ===================================================================
// MAIN FUNCTION: APP'S STARTING POINT
// ===================================================================
void main() {
  runApp(const MyApp());
}

// ===================================================================
// ROOT WIDGET: THE MAIN APP STRUCTURE
// ===================================================================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FF Ajwan',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        
        primaryColor: Colors.red,
        colorScheme: const ColorScheme.dark(
          primary: Colors.red,
          secondary: Colors.redAccent,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[900],
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold,
        cardTheme: CardTheme(
          color: Colors.grey[900],
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.red.withOpacity(0.5)),
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

// ===================================================================
// SCREEN 1: SPLASH SCREEN
// ===================================================================
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
            SizedBox(height: 20),
            Text(
              'FF Ajwan',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

// ===================================================================
// SCREEN 2: HOME SCREEN (THE MAIN MENU)
// ===================================================================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {'icon': Icons.headset_mic, 'title': 'دليل الهيدشوت', 'screen': const HeadshotGuideScreen()},
      {'icon': Icons.settings, 'title': 'إعداداتك الخاصة', 'screen': const SettingsGuideScreen()},
      {'icon': Icons.shield, 'title': '👑 قاهر الرومات', 'screen': const RoomConquerorScreen()},
      {'icon': Icons.auto_awesome_motion, 'title': '🔫 موسوعة الأسلحة', 'screen': const WeaponEncyclopediaScreen()},
      {'icon': Icons.people, 'title': '🦸‍♂️ دليل الشخصيات', 'screen': const CharacterGuideScreen()},
      {'icon': Icons.newspaper, 'title': '📰 الأخبار والأكواد', 'screen': const NewsAndCodesScreen()},
      {'icon': Icons.map, 'title': '🗺️ خرائط الباتل رويال', 'screen': const BattleRoyaleMapsScreen()},
      {'icon': Icons.diamond, 'title': '💎 اقتصاد الجواهر', 'screen': const DiamondEconomyScreen()},
      {'icon': Icons.pets, 'title': '🐾 دليل الحيوانات', 'screen': const PetGuideScreen()},
      {'icon': Icons.emoji_events, 'title': '🏆 الإنجازات', 'screen': const AchievementsScreen()},
      {'icon': Icons.videocam, 'title': '🎥 صانع المحتوى', 'screen': const ContentCreatorScreen()},
      {'icon': Icons.construction, 'title': '🛠️ أسرار وخفايا', 'screen': const SecretsScreen()},
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: const Text('FF Ajwan'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.2,
          ),
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            final item = menuItems[index];
            return GestureDetector(
              onTap: () => _navigateTo(context, item['screen']),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.red.withOpacity(0.7), width: 1.5),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item['icon'], size: 40, color: Colors.white),
                    const SizedBox(height: 10),
                    Text(
                      item['title'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// ===================================================================
// PAGE 3: HEADSHOT & PRO GUIDE
// ===================================================================
class HeadshotGuideScreen extends StatelessWidget {
  const HeadshotGuideScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('دليل الهيدشوت والاحتراف')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          GuideSection(
            title: '1. الزبدة: كيف تجي الهيدشوت؟',
            content: 'الهيدشوت في فري فاير ما هي حظ. هي حركة بسيطة: ترفع زر الضرب لفوق وأنت تطلق. الفكرة إنك تخلي الرصاصة تبدأ من جسم الخصم وتكمل طريقها لراسه. السرعة والقوة في رفعة إصبعك هي اللي تحدد كل شي.',
            icon: Icons.psychology,
          ),
          GuideSection(
            title: '2. وين تحط الإيم قبل ما تطلق؟',
            content: 'لا تحط نقطة الإيم الحمرا على راس الخصم مباشرة، هذا أكبر غلط. خلها دايماً تحت شوي، عند صدره أو بطنه. ليش؟ عشان لما ترفع زر الضرب، الرصاصة تاخذ مسارها الطبيعي وتصعد للراس. لو حطيتها على الراس من البداية، رصاصك بيطير فوقه.',
            icon: Icons.gps_fixed,
          ),
          GuideSection(
            title: '3. فن الرفعة (السحب): متى ترفع بسرعة ومتى بشويش؟',
            content: 'هنا السر كله:\n\n• إذا الخصم قريب منك (مواجهة شوتقن): ارفع زر الضرب بقوة وبسرعة قصوى لفوق. حركة سريعة ومفاجئة.\n\n• إذا الخصم بعيد عنك (سلاح AR): ارفع زر الضرب بهداوة وبشكل تدريجي. رفعة ناعمة وطويلة.\n\n• إذا الخصم يركض يمين أو يسار: ارفع زر الضرب بشكل منحني، كأنك ترسم حرف J. اسحب إصبعك مع اتجاه حركته.',
            icon: Icons.touch_app,
          ),
          GuideSection(
            title: '4. حجم ومكان زر الضرب',
            content: 'ما فيه حجم واحد صح للكل، بس القاعدة الذهبية هي: بين 40 و 60. هذا الحجم يعطيك مساحة كافية للسحب بدون ما يغطي الشاشة. حطه في مكان مريح لإصبع إبهامك، بحيث تكون حركة الرفع طبيعية وسهلة.',
            icon: Icons.fullscreen,
          ),
        ],
      ),
    );
  }
}

// ===================================================================
// PAGE 4: CUSTOM SETTINGS GUIDE
// ===================================================================
class SettingsGuideScreen extends StatelessWidget {
  const SettingsGuideScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final settings = {
      'iPhone 15 Pro Max': {'عام': '95', 'نقطة حمراء': '100', 'سكوب 2': '100', 'سكوب 4': '100', 'سكوب قناص': '80', 'DPI': '120', 'حجم زر الضرب': '55%'},
      'Galaxy A05s': {'عام': '98', 'نقطة حمراء': '100', 'سكوب 2': '95', 'سكوب 4': '90', 'سكوب قناص': '70', 'DPI': '480', 'حجم زر الضرب': '60%'},
      'محاكي BlueStacks': {'عام': '80', 'نقطة حمراء': '85', 'سكوب 2': '88', 'سكوب 4': '88', 'سكوب قناص': '60', 'DPI': '800', 'حجم زر الضرب': '15%'},
    };

    return Scaffold(
      appBar: AppBar(title: const Text('إعداداتك الخاصة')),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: settings.length,
        itemBuilder: (context, index) {
          String deviceName = settings.keys.elementAt(index);
          Map<String, String> deviceSettings = settings[deviceName]!;
          return Card(
            child: ExpansionTile(
              title: Text(deviceName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              children: deviceSettings.entries.map((entry) {
                return ListTile(
                  title: Text(entry.key, style: const TextStyle(color: Colors.redAccent)),
                  trailing: Text(entry.value, style: const TextStyle(fontSize: 16)),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}

// ===================================================================
// PAGE 5: ROOM CONQUEROR GUIDE
// ===================================================================
class RoomConquerorScreen extends StatelessWidget {
  const RoomConquerorScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> guideSections = [
      {'title': 'أساسيات لازم تعرفها (قوانين الشرف)', 'content': 'في رومات الحقد، فيه قوانين غير مكتوبة:\n\n• ممنوع القنابل (Grenades).\n• ممنوع قاذف القنابل (Launcher).\n• ممنوع استخدام شخصيات يعتبرونها "لعب نوب" مثل سكايلر أو وكونغ (اسأل قبل ما تبدأ).\n\nاكسر هذي القوانين ويعتبرونك خاسر حتى لو فزت.'},
      {'title': 'كيف تختار سلاحك صح؟', 'content': 'الزبدة: سلاحين بس.\n\n1. سلاح للمسافة القريبة: شوتقن طلقتين (M1887) أو UMP.\n2. سلاح للمسافة المتوسطة/البعيدة: نسر الصحراء (Desert Eagle) أو النقار (Woodpecker).\n\nلا تشيل قناص أو AR إلا لو متفقين. هدفك سلاح ينهي المواجهة بسرعة.'},
      {'title': 'فن الحركة: كيف تكون خفيف وصعب الصيد', 'content': '• لا تمشي بخط مستقيم أبد. تحرك يمين ويسار بشكل عشوائي.\n• استخدم حركة "النط ثم الطلق": نط، وأول ما رجلك تلمس الأرض، اطلق النار. هذا يخلي إيمك أدق.\n• بعد كل طلقة شوتقن، حط ثلجة فوراً. لا تنتظر تشوف إذا دمجته أو لا. اضرب، ثلج، تحرك. هذي تصير عادة.'},
      {'title': 'حرب الثلج: كيف تبني صح وتكسر صح', 'content': '• ثلجة الهجوم: حطها قريبة من خصمك عشان تحشره وتاخذ عليه الأفضلية.\n• ثلجة الدفاع: حطها قدامك مباشرة وأنت جالس (crouch) عشان تغطيك بالكامل.\n• خدعة الثلجة الوهمية: حط ثلجة على يمينك، ولف من اليسار. خصمك بيركز على الثلجة وأنت تباغته.'},
      {'title': 'الخدع النفسية (لعب العقول)', 'content': '• الإيم الوهمي: سو نفسك بتطلق عليه من بعيد بالديزرت عشان تخليه يحط ثلجة ويضيع موارده.\n• الاستفزاز بالحركة: سوي رقصة سريعة ورا الثلجة عشان تخليه يعصب ويطلع من مكانه بشكل غبي.\n• الصمت القاتل: إذا كنت متقدم عليه بالنتيجة، العب بهدوء وخليه هو اللي يغلط. الضغط عليه مو عليك.'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('👑 قاهر الرومات')),
      body: ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: guideSections.length,
        itemBuilder: (context, index) {
          final section = guideSections[index];
          return Card(
            child: ExpansionTile(
              title: Text(section['title']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
              iconColor: Colors.red,
              collapsedIconColor: Colors.white,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(section['content']!, style: TextStyle(color: Colors.grey[300], fontSize: 16, height: 1.6)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ===================================================================
// PAGE 6: WEAPON ENCYCLOPEDIA
// ===================================================================
class WeaponEncyclopediaScreen extends StatelessWidget {
  const WeaponEncyclopediaScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final weaponDetails = {
      'M1887': {'usage': 'في الرومات، وفي الهجوم على البيوت. هو أقوى شوتقن باللعبة.', 'secret': 'الطلقة الأولى تكسر الدرع والثلج، والثانية تنهي الخصم. اضرب، حط ثلجة، تحرك.', 'drawback': 'طلقتين بس. إذا ضيعتها، أنت في ورطة.'},
      'UMP': {'usage': 'ملك المسافات القريبة والمتوسطة. ينفع بكل الأوقات.', 'secret': 'يخترق الدرع بسهولة. دمجك بيكون عالي حتى لو خصمك لابس درع لفل 4.', 'drawback': 'أضعف قليلاً من الشوتقن في المواجهات وجه لوجه.'},
      'Desert Eagle': {'usage': 'للمواجهات بطلقة واحدة من بعيد. سلاح الهيدشوت الأسطوري.', 'secret': 'لا تطلق بسرعة. خذ وقتك، ثبت الإيم، وارفع. طلقة واحدة في الراس كافية.', 'drawback': 'صعب التحكم فيه إذا كنت متوتراً.'},
    };
    return Scaffold(
      appBar: AppBar(title: const Text('🔫 موسوعة الأسلحة')),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: weaponDetails.length,
        itemBuilder: (context, index) {
          String weaponName = weaponDetails.keys.elementAt(index);
          Map<String, String> details = weaponDetails[weaponName]!;
          return Card(
            child: ExpansionTile(
              title: Text(weaponName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              children: [
                _buildDetailCard('متى تستخدمه؟', details['usage']!, Icons.games),
                _buildDetailCard('سره الخاص', details['secret']!, Icons.star),
                _buildDetailCard('عيبه', details['drawback']!, Icons.warning),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ===================================================================
// PAGE 7: CHARACTER GUIDE
// ===================================================================
class CharacterGuideScreen extends StatelessWidget {
  const CharacterGuideScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final characterDetails = {
      'Alok': {'ability': 'قدرته "Drop the Beat" تسوي دائرة تزيد سرعة الحركة وتعالج 5 نقاط صحة كل ثانية. هي القدرة المتكاملة لأي مهاجم.', 'combo': 'كيلي (لزيادة السرعة).\nهياتو (لزيادة اختراق الدرع).\nموكو (لكشف مكان العدو بعد دمجه).'},
      'Skyler': {'ability': 'قدرته "Riptide Rhythm" تطلق موجة تدمر ثلج الأعداء. وكل ما تحط ثلجة، يعالج دمك.', 'combo': 'نيري (لجعل ثلجتك أقوى).\nكيلي (للسرعة).\nهياتو (للمواجهات الحاسمة).'},
      'Chrono': {'ability': 'قدرته "Time Turner" تنشئ درعاً لا يمكن اختراقه يحجب 800 ضرر. لا يمكنك إطلاق النار من الداخل.', 'combo': 'يستخدم للهروب أو لإنعاش صديق بأمان. لا يصلح للهجوم المباشر.'},
    };
    return Scaffold(
      appBar: AppBar(title: const Text('🦸‍♂️ دليل الشخصيات')),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: characterDetails.length,
        itemBuilder: (context, index) {
          String charName = characterDetails.keys.elementAt(index);
          Map<String, String> details = characterDetails[charName]!;
          return Card(
            child: ExpansionTile(
              title: Text(charName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              children: [
                _buildDetailCard('قدرة الشخصية', details['ability']!, Icons.bolt),
                _buildDetailCard('أفضل كومبو معه', details['combo']!, Icons.group_work),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ===================================================================
// PAGE 8: NEWS & CODES
// ===================================================================
class NewsAndCodesScreen extends StatelessWidget {
  const NewsAndCodesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final codes = {'XT25-S34W-7KL0': 'فعال - يعطي سكن سلاح مؤقت', 'FF11-NJN5-YS3E': 'منتهي الصلاحية'};
    return Scaffold(
      appBar: AppBar(title: const Text('📰 الأخبار والأكواد')),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: codes.length,
        itemBuilder: (context, index) {
          String code = codes.keys.elementAt(index);
          String status = codes[code]!;
          return Card(
            child: ListTile(
              title: Text(code, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              subtitle: Text(status, style: TextStyle(color: status.contains('فعال') ? Colors.greenAccent : Colors.grey)),
              trailing: IconButton(
                icon: const Icon(Icons.copy),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: code));
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تم نسخ الكود!')));
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

// ===================================================================
// PAGE 9: BATTLE ROYALE MAPS
// ===================================================================
class BattleRoyaleMapsScreen extends StatelessWidget {
  const BattleRoyaleMapsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final mapTips = {
      'برمودا': 'أفضل مكان للنزول هو "البيك" للمواجهات السريعة، أو "الميل" للوت الآمن.',
      'كالاهاري': 'استغل المرتفعات. من يسيطر على الأماكن العالية يسيطر على اللعبة.',
      'البرزخ': 'الخريطة مليئة بالمباني. تعلم القفز من النوافذ لمباغتة الأعداء.',
    };
    return Scaffold(
      appBar: AppBar(title: const Text('🗺️ خرائط الباتل رويال')),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: mapTips.length,
        itemBuilder: (context, index) {
          String mapName = mapTips.keys.elementAt(index);
          String tip = mapTips[mapName]!;
          return Card(child: ListTile(title: Text(mapName), subtitle: Text(tip)));
        },
      ),
    );
  }
}

// ===================================================================
// PAGE 10: DIAMOND ECONOMY
// ===================================================================
class DiamondEconomyScreen extends StatelessWidget {
  const DiamondEconomyScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('💎 اقتصاد الجواهر')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildInfoCard(title: 'القاعدة الذهبية', content: 'لا تصرف على أي شي! قبل ما تشتري أي سكن، اسأل نفسك: "هل هذا السكن بيطور من لعبي؟". إذا الجواب لا، فكر مرة ثانية.', icon: Icons.shield, color: Colors.red),
          _buildInfoCard(title: '1. الفاير باس (Elite Pass)', content: 'أفضل استثمار لجواهرك. يعطيك سكنات ورقصات وجوائز لا نهائية بقيمة تتجاوز 10,000 جوهرة، بسعر 500 جوهرة فقط.', icon: Icons.whatshot, color: Colors.purple),
          _buildInfoCard(title: '2. عروض التخفيضات (المتجر الغامض)', content: 'انتظر العروض الكبيرة مثل "المتجر الغامض" أو "خصم هايبر". تقدر تاخذ سكنات أسطورية بخصم يصل إلى 90%.', icon: Icons.percent, color: Colors.teal),
          _buildInfoCard(title: '3. الشخصيات والحيوانات الأليفة', content: 'استثمر في الشخصيات والحيوانات اللي قدراتها بتفيد أسلوب لعبك. هذي هي الأشياء الوحيدة اللي تطور من أدائك فعلياً.', icon: Icons.pets, color: Colors.amber),
        ],
      ),
    );
  }
}

// ===================================================================
// PAGE 11: PET GUIDE
// ===================================================================
class PetGuideScreen extends StatelessWidget {
  const PetGuideScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final petTips = {
      'السيد واجور': 'يصنع لك ثلجة كل 100 ثانية إذا كان معك أقل من ثلجتين. أفضل حيوان للرومات.',
      'فالكو': 'يزيد سرعة الهبوط بالمظلة. أساسي في الباتل رويال، لا فائدة منه في الكلاش سكواد.',
      'روكي': 'يقلل وقت تبريد (cooldown) القدرات الفعالة مثل ألوك وكرونو.',
    };
    return Scaffold(
      appBar: AppBar(title: const Text('🐾 دليل الحيوانات')),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: petTips.length,
        itemBuilder: (context, index) {
          String petName = petTips.keys.elementAt(index);
          String tip = petTips[petName]!;
          return Card(child: ListTile(title: Text(petName), subtitle: Text(tip)));
        },
      ),
    );
  }
}

// ===================================================================
// PAGE 12: ACHIEVEMENTS
// ===================================================================
class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final achievements = {
      'قاهر الرومات': 'احترف جميع استراتيجيات الرومات في التطبيق.',
      'خبير الأسلحة': 'اطلع على تفاصيل 10 أسلحة مختلفة.',
      'مهندس الشخصيات': 'اكتشف أفضل كومبو لـ 5 شخصيات مختلفة.',
    };
    return Scaffold(
      appBar: AppBar(title: const Text('🏆 الإنجازات')),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: achievements.length,
        itemBuilder: (context, index) {
          String title = achievements.keys.elementAt(index);
          String desc = achievements[title]!;
          return Card(child: ListTile(leading: const Icon(Icons.star, color: Colors.amber), title: Text(title), subtitle: Text(desc)));
        },
      ),
    );
  }
}

// ===================================================================
// PAGE 13: CONTENT CREATOR GUIDE
// ===================================================================
class ContentCreatorScreen extends StatelessWidget {
  const ContentCreatorScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('🎥 دليل صانع المحتوى')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildStepCard(stepNumber: '1', title: 'اختر فكرتك', content: '• فيديوهات جلد (Montage)\n• فيديوهات تعليمية\n• فيديوهات تحديات\n• فيديوهات كوميدية', icon: Icons.lightbulb_outline),
          _buildStepCard(stepNumber: '2', title: 'سجل لعبك', content: '• استخدم مسجل الشاشة المدمج في جوالك.\n• تأكد من أن جودة التسجيل عالية (720p أو 1080p).', icon: Icons.videocam),
          _buildStepCard(stepNumber: '3', title: 'سوي المونتاج', content: 'أفضل برامج المونتاج للجوال:\n• CapCut: سهل ومجاني.\n• KineMaster: احترافي أكثر.\n• VN Video Editor: بسيط للمبتدئين.', icon: Icons.cut),
          _buildStepCard(stepNumber: '4', title: 'انشر الفيديو', content: '• يوتيوب: للفيديوهات الطويلة.\n• تيك توك وإنستغرام ريلز: للفيديوهات القصيرة.\n• استخدم عنواناً جذاباً وصورة مصغرة قوية.', icon: Icons.upload_file),
        ],
      ),
    );
  }
}

// ===================================================================
// PAGE 14: GAME SECRETS & TRICKS
// ===================================================================
class SecretsScreen extends StatelessWidget {
  const SecretsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final secrets = {
      'سرعة تغيير السلاح': 'في إعدادات التحكم، قم بتفعيل خيار "Quick Weapon Switch". هذا يضيف زراً يسمح لك بالتبديل بين سلاحين بسرعة خيالية.',
      'إلغاء إعادة التلقيم': 'إذا بدأت في إعادة تلقيم السلاح بالخطأ، اضغط على زر تغيير السلاح بسرعة. هذا سيلغي العملية ويسمح لك بالرد فوراً.',
      'القفزة الصامتة': 'عندما تقفز من مكان مرتفع، وقبل أن تلمس الأرض بلحظة، اضغط على زر استخدام السلاح. هذا سيلغي صوت الهبوط بالكامل.',
    };
    return Scaffold(
      appBar: AppBar(title: const Text('🛠️ أسرار وخفايا اللعبة')),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: secrets.length,
        itemBuilder: (context, index) {
          String title = secrets.keys.elementAt(index);
          String desc = secrets[title]!;
          return Card(child: ListTile(title: Text(title), subtitle: Text(desc)));
        },
      ),
    );
  }
}

// ===================================================================
// HELPER WIDGETS (Used by multiple pages to avoid repeating code)
// ===================================================================

// Helper for Headshot Guide
class GuideSection extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;
  const GuideSection({super.key, required this.title, required this.content, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.red, size: 24),
              const SizedBox(width: 10),
              Expanded(child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold))),
            ],
          ),
          const SizedBox(height: 15),
          Text(content, style: TextStyle(color: Colors.grey[300], fontSize: 16, height: 1.5)),
        ],
      ),
    );
  }
}

// Helper for Weapon/Character Details
Widget _buildDetailCard(String title, String content, IconData icon) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.red, size: 24),
            const SizedBox(width: 10),
            Text(title, style: const TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
        const Divider(height: 20, color: Colors.grey),
        Text(content, style: const TextStyle(color: Colors.white, fontSize: 16, height: 1.5)),
      ],
    ),
  );
}

// Helper for Diamond Economy
Widget _buildInfoCard({required String title, required String content, required IconData icon, required Color color}) {
  return Card(
    shape: RoundedRectangleBorder(
      side: BorderSide(color: color, width: 2),
      borderRadius: BorderRadius.circular(12),
    ),
    margin: const EdgeInsets.only(bottom: 15),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Icon(icon, size: 40, color: color),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text(content, style: TextStyle(color: Colors.grey[400], fontSize: 14, height: 1.4)),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

// Helper for Content Creator Guide
Widget _buildStepCard
