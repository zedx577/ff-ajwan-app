// ===== FF AJWAN - FINAL CORRECTED CODE v2 =====
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

// MAIN FUNCTION
void main() {
  runApp(const MyApp());
}

// ROOT WIDGET
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
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
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

// SPLASH SCREEN
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
            Icon(Icons.local_fire_department, color: Colors.red, size: 100),
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

// HOME SCREEN
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

// ALL OTHER PAGES AND HELPERS
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
            title: '3. فن الرفعة (السحب)',
            content: '• إذا الخصم قريب منك (مواجهة شوتقن): ارفع زر الضرب بقوة وبسرعة قصوى لفوق.\n\n• إذا الخصم بعيد عنك (سلاح AR): ارفع زر الضرب بهداوة وبشكل تدريجي.\n\n• إذا الخصم يركض يمين أو يسار: ارفع زر الضرب بشكل منحني، كأنك ترسم حرف J.',
            icon: Icons.touch_app,
          ),
          GuideSection(
            title: '4. حجم ومكان زر الضرب',
            content: 'القاعدة الذهبية هي: بين 40 و 60. هذا الحجم يعطيك مساحة كافية للسحب بدون ما يغطي الشاشة. حطه في مكان مريح لإصبع إبهامك.',
            icon: Icons.fullscreen,
          ),
        ],
      ),
    );
  }
}

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

class RoomConquerorScreen extends StatelessWidget {
  const RoomConquerorScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> guideSections = [
      {'title': 'أساسيات (قوانين الشرف)', 'content': '• ممنوع القنابل (Grenades).\n• ممنوع قاذف القنابل (Launcher).\n• ممنوع استخدام شخصيات يعتبرونها "لعب نوب" مثل سكايلر أو وكونغ.'},
      {'title': 'اختيار السلاح', 'content': '1. سلاح للمسافة القريبة: شوتقن طلقتين (M1887) أو UMP.\n2. سلاح للمسافة المتوسطة/البعيدة: نسر الصحراء (Desert Eagle) أو النقار (Woodpecker).'},
      {'title': 'فن الحركة', 'content': '• لا تمشي بخط مستقيم.\n• استخدم حركة "النط ثم الطلق".\n• بعد كل طلقة شوتقن، حط ثلجة فوراً.'},
      {'title': 'حرب الثلج', 'content': '• ثلجة الهجوم: قريبة من خصمك.\n• ثلجة الدفاع: قدامك وأنت جالس.\n• خدعة الثلجة الوهمية: حط ثلجة يمين، ولف من اليسار.'},
      {'title': 'الخدع النفسية', 'content': '• الإيم الوهمي.\n• الاستفزاز بالحركة.\n• الصمت القاتل.'},
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

class WeaponEncyclopediaScreen extends StatelessWidget {
  const WeaponEncyclopediaScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final weaponDetails = {
      'M1887': {'usage': 'في الرومات، وفي الهجوم على البيوت.', 'secret': 'الطلقة الأولى تكسر الدرع والثلج، والثانية تنهي الخصم.', 'drawback': 'طلقتين بس. إذا ضيعتها، أنت في ورطة.'},
      'UMP': {'usage': 'ملك المسافات القريبة والمتوسطة.', 'secret': 'يخترق الدرع بسهولة.', 'drawback': 'أضعف قليلاً من الشوتقن في المواجهات وجه لوجه.'},
      'Desert Eagle': {'usage': 'للمواجهات بطلقة واحدة من بعيد.', 'secret': 'لا تطلق بسرعة. خذ وقتك، ثبت الإيم، وارفع.', 'drawback': 'صعب التحكم فيه إذا كنت متوتراً.'},
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

class CharacterGuideScreen extends StatelessWidget {
  const CharacterGuideScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final characterDetails = {
      'Alok': {'ability': 'قدرته "Drop the Beat" تسوي دائرة تزيد سرعة الحركة وتعالج 5 نقاط صحة كل ثانية.', 'combo': 'كيلي (لزيادة السرعة).\nهياتو (لزيادة اختراق الدرع).\nموكو (لكشف مكان العدو).'},
      'Skyler': {'ability': 'قدرته "Riptide Rhythm" تطلق موجة تدمر ثلج الأعداء. وكل ما تحط ثلجة، يعالج دمك.', 'combo': 'نيري (لجعل ثلجتك أقوى).\nكيلي (للسرعة).\nهياتو (للمواجهات الحاسمة).'},
      'Chrono': {'ability': 'قدرته "Time Turner" تنشئ درعاً لا يمكن اختراقه. لا يمكنك إطلاق النار من الداخل.', 'combo': 'يستخدم للهروب أو لإنعاش صديق بأمان.'},
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

class DiamondEconomyScreen extends StatelessWidget {
  const DiamondEconomyScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('💎 اقتصاد الجواهر')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildInfoCard(title: 'القاعدة الذهبية', content: 'لا تصرف على أي شي! قبل ما تشتري أي سكن، اسأل نفسك: "هل هذا السكن بيطور من لعبي؟".', icon: Icons.shield, color: Colors.red),
          _buildInfoCard(title: '1. الفاير باس (Elite Pass)', content: 'أفضل استثمار لجواهرك. يعطيك جوائز لا نهائية بقيمة تتجاوز 10,000 جوهرة.', icon: Icons.whatshot, color: Colors.purple),
          _buildInfoCard(title: '2. عروض التخفيضات', content: 'انتظر العروض الكبيرة مثل "المتجر الغامض". تقدر تاخذ سكنات أسطورية بخصم يصل إلى 90%.', icon: Icons.percent, color: Colors.teal),
        ],
      ),
    );
  }
}

class PetGuideScreen extends StatelessWidget {
  const PetGuideScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final petTips = {
      'السيد واجور': 'يصنع لك ثلجة كل 100 ثانية إذا كان معك أقل من ثلجتين. أفضل حيوان للرومات.',
      'فالكو': 'يزيد سرعة الهبوط بالمظلة. أساسي في الباتل رويال.',
      'روكي': 'يقلل وقت تبريد القدرات الفعالة مثل ألوك وكرونو.',
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

class ContentCreatorScreen extends StatelessWidget {
  const ContentCreatorScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('🎥 دليل صانع المحتوى')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildStepCard(stepNumber: '1', title: 'اختر فكرتك', content: '• فيديوهات جلد (Montage)\n• فيديوهات تعليمية\n• فيديوهات تحديات', icon: Icons.lightbulb_outline),
          _buildStepCard(stepNumber: '2', title: 'سجل لعبك', content: '• استخدم مسجل الشاشة المدمج في جوالك.\n• تأكد من أن جودة التسجيل عالية.', icon: Icons.videocam),
          _buildStepCard(stepNumber: '3', title: 'سوي المونتاج', content: 'أفضل برامج المونتاج للجوال:\n• CapCut: سهل ومجاني.\n• KineMaster: احترافي أكثر.', icon: Icons.cut),
          _buildStepCard(stepNumber: '4', title: 'انشر الفيديو', content: '• يوتيوب: للفيديوهات الطويلة.\n• تيك توك: للفيديوهات القصيرة.', icon: Icons.upload_file),
        ],
      ),
    );
  }
}

class SecretsScreen extends StatelessWidget {
  const SecretsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final secrets = {
      'سرعة تغيير السلاح': 'في إعدادات التحكم، قم بتفعيل خيار "Quick Weapon Switch".',
      'إلغاء إعادة التلقيم': 'إذا بدأت في إعادة تلقيم السلاح بالخطأ، اضغط على زر تغيير السلاح بسرعة.',
      'القفزة الصامتة': 'عندما تقفز من مكان مرتفع، وقبل أن تلمس الأرض، اضغط على زر استخدام السلاح.',
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

// HELPER WIDGETS
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

Widget _buildDetailCard(String title, String content, IconData icon) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
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

Widget _buildStepCard({required String stepNumber, required String title, required String content, required IconData icon}) {
  return Card(
    margin: const EdgeInsets.only(bottom: 15),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(child: Text(stepNumber), backgroundColor: Colors.red),
              const SizedBox(width: 10),
              Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const Spacer(),
              Icon(icon, size: 30),
            ],
          ),
          const SizedBox(height: 10),
          Text(content, style: TextStyle(color: Colors.grey[400], height: 1.5)),
        ],
      ),
    ),
  );
}

