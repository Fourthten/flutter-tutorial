### Aksesibilitas
Desain perangkat yang dapat digunakan oleh penyandang disabilitas. Berikut aplikasi-aplikasi untuk test aksesibilitas android. 
Contoh aplikasi [android-BasicAccessibility](https://github.com/googlearchive/android-BasicAccessibility). 
Konfigurasi `build.gradle` sesuai yang dibutuhkan. Jalankan aplikasi dengan menggunakan android studio dan 
aktifkan talkback pada android untuk memberi tahu isi tampilan aplikasi.

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/03-04/latihan/images/basicaccessibility.png" width="300">

Contoh aplikasi [basic-android-accessibility](https://github.com/googlecodelabs/android-accessibility). 
Buka dengan android studio, pilih BasicAndroidAccessibility-Java/Kotlin (UI sama hanya berbeda bahasa pemrogramannya). 
File sumber berada di `app/java` dan seluruh file layout berada di `app/res/layout`. 

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/03-04/latihan/record/accessibilitylayout.gif" width="300">

Aktifkan Talkback atau pembaca layar, `Setelan>Aksesibilitas>Talkback>switch on`. 
Talkback digunakan oleh pengguna tunanetra, karena fitur ini mendeskripsikan item tampilan dengan suara. 
Tutorial talkback dapat dicoba seperti gambar berikut pada `setelan talkback>tutorial talkback`:

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/03-04/latihan/images/talkback.png" width="300">

Terdapat 5 pelajaran dasar, yaitu Navigasi Dasar, Menggulir, Menu Talkback, Navigasi Teks, Mengedit Teks. 
Menggunakan talkback, klik sekali untuk mendeskripsikan item dan klik dua kali untuk memilih item. 
Untuk menggeser layar/scroll menggunakan dua jari. Coba menggunakan talkback pada aplikasi yang telah dijalankan tadi. 
Tool layout bound, untuk mengetahui lebar item pada aplikasi. Aktifkan dengan `Setelan>Sistem>Opsi developer>Tampilkan batas tata letak>switch on`.

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/03-04/latihan/images/layoutbound.png" width="300">

Menggunakan Accessibility Scanner, fitur ini menyarankan peningkatan aksesibilitas untuk aplikasi Android seperti memperbesar target sentuhan kecil, 
meningkatkan kontras, dan memberikan deskripsi konten. Aktifkan pada `Setelan>Aksesibilitas>Accessibility Scanner>switch on`. 
Misal kita gunakan pada aplikasi aksesibilitas tadi, fitur ini akan memberi sugesti untuk meningkatkan kontras agar lebih terang 
sehingga pengguna dengan penglihatan rendah dapat melihatnya.

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/03-04/latihan/images/accesibilityscanner.png" width="300">

Jika tidak ada masalah atau sugesti pada tampilan maka akan seperti ini:

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/03-04/latihan/images/nosugestion.png" width="300">

Switch access, memungkinkan pengguna Android dengan keterbatasan mobilitas untuk berinteraksi dengan perangkat menggunakan satu atau lebih sakelar.\
Voice access, memungkinkan pengguna Android dengan keterbatasan mobilitas untuk mengontrol perangkat dengan perintah yang diucapkan.\
Download [basic-android-accessibility](https://github.com/googlecodelabs/android-accessibility) dan buka aplikasi GlobalActionBarService di android studio. 
Konfigurasi `build.gradle`
```
buildscript {
    repositories {
        jcenter()
        google()
    }
    dependencies {
        classpath 'com.android.tools.build:gradle:3.5.3'
    }
}
allprojects {
    repositories {
        jcenter()
        google()
    }
}
```
Konfigurasi `app\build.gradle`
```
android {
    compileSdkVersion 28
    buildToolsVersion "28.0.3"
    defaultConfig {
        applicationId "com.example.android.globalactionbarservice"
        minSdkVersion 21
        targetSdkVersion 28
        ....
    }
    buildTypes {
        ....
    }
}
dependencies {
    implementation fileTree(dir: 'libs', include: ['*.jar'])
    androidTestImplementation('com.android.support.test.espresso:espresso-core:3.0.2', {
        exclude group: 'com.android.support', module: 'support-annotations'
    })
    implementation 'com.android.support:appcompat-v7:28.0.0'
    testImplementation 'junit:junit:4.12'
}
```
Konfigurasi gradle-wrapper.properties
```
https\://services.gradle.org/distributions/gradle-5.4.1-all.zip
```
Konfigurasi AndroidManifest.xml, tambahkan permission, intent dan metadata aksesibilitas
```
<application
    android:icon="@mipmap/ic_launcher"
    android:label="@string/app_name">
    <service
        android:name="GlobalActionBarService"
        android:permission="android.permission.BIND_ACCESSIBILITY_SERVICE"
        android:label="@string/app_name">
        <intent-filter>
            <action android:name="android.accessibilityservice.AccessibilityService" />
            <action android:name="GlobalActionBarService" />
        </intent-filter>
        <meta-data
            android:name="android.accessibilityservice"
            android:resource="@xml/global_action_bar_service" />
    </service>
</application>
```
file global_action_bar_service.xml
```
<accessibility-service xmlns:android="http://schemas.android.com/apk/res/android"
   android:accessibilityFeedbackType="feedbackGeneric"
   android:accessibilityFlags="flagDefault"
   android:canPerformGestures="true"
   android:canRetrieveWindowContent="true" />
```
Tipe feedback menggunakan feedbackGeneric (standar yang bagus). 
flag accessibility menggunakan standar. 
`android:canPerformGestures` untuk swipe. 
`android:canRetrieveWindowContent` untuk mengambil konten jendela. 
Jalankan aplikasi `Run>Edit Configurations`, ubah opsi Launch dari Default Activity ke Nothing. 
Sehingga sebagai service tidak memerlukan activity pada AndroidManifest untuk membuat main dan launcher aplikasi. 
Buka `Setelan>Aksesibilitas>Global Action Bar Service>switch on`

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/03-04/latihan/images/serviceglobalaction.png" width="300">

File [action_bar.xml](https://github.com/Fourthten/praxis-academy/blob/master/novice/03-04/latihan/action_bar.xml) digunakan untuk membuat tombol. Tambahkan kode berikut pada GlobalActionBarService,
```
FrameLayout mLayout;

@Override
protected void onServiceConnected() {
    // Create an overlay and display the action bar
    WindowManager wm = (WindowManager) getSystemService(WINDOW_SERVICE);
    mLayout = new FrameLayout(this);
    WindowManager.LayoutParams lp = new WindowManager.LayoutParams();
    lp.type = WindowManager.LayoutParams.TYPE_ACCESSIBILITY_OVERLAY;
    lp.format = PixelFormat.TRANSLUCENT;
    lp.flags |= WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE;
    lp.width = WindowManager.LayoutParams.WRAP_CONTENT;
    lp.height = WindowManager.LayoutParams.WRAP_CONTENT;
    lp.gravity = Gravity.TOP;
    LayoutInflater inflater = LayoutInflater.from(this);
    inflater.inflate(R.layout.action_bar, mLayout);
    wm.addView(mLayout, lp);
}
```
`onServiceConnected()` berjalan saat service terhubung. `WindowManager.LayoutParams.TYPE_ACCESSIBILITY_OVERLAY` 
sebagai izin layout untuk berada di atas layar.

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/03-04/latihan/images/button.png" width="300">

Konfigurasi tombol power,
```
private void configurePowerButton() {
   Button powerButton = (Button) mLayout.findViewById(R.id.power);
   powerButton.setOnClickListener(new View.OnClickListener() {
       @Override
       public void onClick(View view) {
           performGlobalAction(GLOBAL_ACTION_POWER_DIALOG);
       }
   });
}
```
configurePowerButton menggunakan method performGlobalAction yang memicu onClickListener untuk menampilkan dialog power android. 
Tombol back, home, recent termasuk global actions.

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/03-04/latihan/images/power.png" width="100">

Konfigurasi tombol volume,
```
private void configureVolumeButton() {
   Button volumeUpButton = (Button) mLayout.findViewById(R.id.volume_up);
   volumeUpButton.setOnClickListener(new View.OnClickListener() {
       @Override
       public void onClick(View view) {
           AudioManager audioManager = (AudioManager) getSystemService(AUDIO_SERVICE);
           audioManager.adjustStreamVolume(AudioManager.STREAM_MUSIC,
                   AudioManager.ADJUST_RAISE, AudioManager.FLAG_SHOW_UI);
       }
   });
}
```
configureVolumeButton memicu onClickListener untuk meningkatkan volume android menggunakan 
AudioManager untuk menyesuaikan aliran volumenya.

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/03-04/latihan/images/volume.png" width="70">

Konfigurasi tombol scroll, Metode pertama menemukan scrollable node
```
private AccessibilityNodeInfo findScrollableNode(AccessibilityNodeInfo root) {
   Deque<AccessibilityNodeInfo> deque = new ArrayDeque<>();
   deque.add(root);
   while (!deque.isEmpty()) {
       AccessibilityNodeInfo node = deque.removeFirst();
       if (node.getActionList().contains(AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_FORWARD)) {
           return node;
       }
       for (int i = 0; i < node.getChildCount(); i++) {
           deque.addLast(node.getChild(i));
       }
   }
   return null;
}
```
metode kedua melakukan scroll atas nama pengguna
```
private void configureScrollButton() {
   Button scrollButton = (Button) mLayout.findViewById(R.id.scroll);
   scrollButton.setOnClickListener(new View.OnClickListener() {
       @Override
       public void onClick(View view) {
           AccessibilityNodeInfo scrollable = findScrollableNode(getRootInActiveWindow());
           if (scrollable != null) {
               scrollable.performAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_FORWARD.getId());
           }
       }
   });
}
```
configureScrollButton memicu onClickListener untuk melakukan scroll ke bawah dengan menggunakan 
findScrollableNode yang mencari scrollable node atau tampilan yang dapat di scroll.

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/03-04/latihan/record/scroll.gif" width="300">

Konfigurasi tombol swipe,
```
private void configureSwipeButton() {
   Button swipeButton = (Button) mLayout.findViewById(R.id.swipe);
   swipeButton.setOnClickListener(new View.OnClickListener() {
       @Override
       public void onClick(View view) {
           Path swipePath = new Path();
           swipePath.moveTo(1000, 1000);
           swipePath.lineTo(100, 1000);
           GestureDescription.Builder gestureBuilder = new GestureDescription.Builder();
           gestureBuilder.addStroke(new GestureDescription.StrokeDescription(swipePath, 0, 500));
           dispatchGesture(gestureBuilder.build(), null, null);
       }
   });
}
```
configureSwipeButton menggunakan GestureDescription untuk menentukan jalur gerakan yang akan dilakukan lalu swipe ke kanan. 

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/03-04/latihan/record/swipe.gif" width="300">

Kode sumber [GlobalActionBarService.java](https://github.com/Fourthten/praxis-academy/blob/master/novice/03-04/latihan/GlobalActionBarService.java)

Sumber:\
[Codelabs Accessibility](https://codelabs.developers.google.com/codelabs/basic-android-accessibility/#0)\
[Codelabs Accessibility Service](https://codelabs.developers.google.com/codelabs/developing-android-a11y-service/#0)