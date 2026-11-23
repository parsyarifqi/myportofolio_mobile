### Tugas 7 ###

### Pertanyaan Reflektif
1. Widget tree adalah struktur tree yang terbentuk dari semua widget di aplikasi flutter. Aplikasi flutter hampir semua terdiri dari widget-widget yang membentuk hubungan parent-child dimana widget parent membungkus widget child. Widget parent menetapkan batasan/aturan dan properti yang membungkus widget child dan widget child mematuhi batasan/aturan serta mewarisi properti yang ditetapkan widget parent dengan batasan/aturannya sendiri.

2. -MyApp : root widget aplikasi
-MaterialApp : menyediakan tema, judul, dan home   
-MyHomePage : Halaman utama yang bersifat stateless
-Scaffold : menyediakan struktur visual dasar halaman
-AppBar : menampilkan bar bagian atas halamn aplikasi
-Padding : Body halaman utama dengan padding di sekelilingnya
-SingleChildScrollView : membuat konten-konten bisa di scroll (scrollable)
-Column : Menyusun elemen-elemen seperti infocard dan tombol menu portofolio dalam bentuk kolom 
-Row : Menampilkan 3 infocard yang berisi informasi NPM, Nama, dan kelas dalam bentuk baris
-Center : memuat pesan sambutan dan kisi tombol menu portofolio pada bagian tengah.
-SizedBox : memberikan jarak antar elemen dengan ukuran yang ditentukan
-Container : menyesuaikan ukuran kartu
-Text : menampilkan teks
-Icon : Menampilkan ikon
-Card : kartu bergaya material
-Material : Membuat permukaan material berwarna dan bersudut membulat.
-InkWell : mendeteksi sentuhan dan memberikan efek ripple
-SnackBar : menampilkan pesan singkat dibawah layar ketika menekan tombol
-InfoCard :  kartu yang berisi informasi nama,npm, dan kelas
-ItemCard : kartu yang berisi tombol menu portofolio

3. MaterialApp adalah widget yang digunakan sebagai root/akar yang membungkus seluruh widget pada aplikasi flutter. MaterialApp digunakan sebagai akar/root karena MaterialApp menyediakan aturan gaya Material Design. Tanpa MaterialApp, widget dasar seperti teks atau tombol tidak akan memiliki atuaran gaya MaterialDesign yang benar.

4. Stateless widget adalah widget yang bersifat immutable yang artinya tampilan widget bersifat tetap selama data yang diterima tidak berbuah. Pada contoh myportofolio, tampilan InfoCard bersifat tetap selama kita tidak merubah data Nama, NPM, dan kelas saat aplikasi berjalan. Stateful widget adalah widget yang dapat berubah. perubahan data disimpan sebagai objek state. Pada saat aplikasi berjalan, tampilan widget dapat berubah berdasarkan data dari konstruktor dan variabel state. State diperbarui melalui fungsi setState() agar flutter menjalankan build() lagi. Stateless widget baiknya digunakan saat ingin menampilkan data yang bersifat statis seperti data Nama,NPM, dan kelas yang bersifat tetap dan tidak berubah-ubah sedangkan stateful widget baiknya digunakan sat ingin menampilkan data dinamis yang berubah-ubah state seperti informasi jumlah pengunjung, counter jumlah star, dan lain sebagainya.

5. BuildContext adalah object yang menunjukkan posisi widget dalan widget tree. Melalui BuildContext, widget dapat mengakses informasi/konteks dari widget parentnya. Dalam method build, BuildContext digunakan sebagai argumen dalam method Build. Gunanya sebagai penunjuk agar konteks seperti properti atau data dari widget parent dapat diakses dan digunakan dalam method build sendiri.

6. Hot reload dalam flutter adalah fitur dalam flutter yang memuat perubahan pada kode aplikasi langsung kedalam aplikasi yang sedang berjalan sehingga kita dapat langsung melihat hasil perubahan pada kode tanpa harus mereset state aplikasi yang sedang berjalan. perbedaannya dengan hot refresh adalah hot refresh mengkompilasi lalu menjalankan ulang kode sehingga mereset state aplikasi yang sedang berjalan. 


### AI Disclosure
Dengan ini saya menyatakan bahwa pengerjaan Tugas Individu 7 ini saya kerjakan dengan menggunakan bantuan AI. Strategi penggunaan AI saya adalah dengan meminta AI untuk membagi tahapan pengerjaan tugas menjadi beberapa step yang terstruktur agar progress pengerjaan tugas dapat di track dengan jelas. Saya meminta AI untuk mebuat saya turut ikut mengerjakan dan tidak hanya copy paste tanpa pikir panjang. Pada setiap langkahnya AI memberikan saya pertanyaan terkait pemahaman saya terhadap kode agar saya lebih dapat memahami alur kode yang saya buat. Selain itu saya juga menggunakan AI untuk melakukan debugging dan mendeteksi bug/kesalahan dalam kode saya.
link percakapan AI yang saya gunakan dalam pengerjaan tugas individu 7: https://claude.ai/share/eab35d1e-ff47-4749-9e6f-da05601983d7

### Instruksi Setup Mingguan
-Membuat branch baru sesuai dengan tugas/tutorial yang diberikan
-Menegerjakan tugas/tutorial secara bertahap dalam langkah-langkah yang terstruktur
-Melakukan commit setiap langkah atau setiap perbaikan bug/kesalahan yang dilakukan
-Melakukan merge ke branch main agar tetap sinkron

### Progress Mingguan
15 November: Menambahkan atribut warna ke class ItemHomepage dan menambahkan argumen warna ke list Items.
15 November: menggunakan warna background dari atribut warna item pada ItemCard instead of warna sekunder dari sekma tema aplikasi
15 November: Menambahkan beberapa action card menu portofolio serta mengatasi masalah overflow konten dengan membuat homepage scrollable
15 November: Memperbaiki typo tulisan myportofolio pada header
15 November: Menempatkan tombol logout pada urutan terakhir.
16 November: Menjawab pertanyaan reflektif, membuat AI Disclosure, Membuat instruksi setup mingguan, serta menambahkan progress mingguan.
16 November: Mengedit jawaban pertanyaan reflektif nomor 4.


### Tugas 8 ###

### Pertanyaan Reflektif 
1. Navigator.push(): Menambahkan halaman baru kedalam stack, halaman yang sedang aktif akan ditimpa dengan halaman baru. Ketika pengguna menekan tombol back, tampilan akan kembali ke halaman sebelumnya yang ditimpa


Navigator.pushReplacement(): Menggantikan sepenuhnya halaman di stack paling atas dengan halaman baru. Ketika pengguna menekean tombol back, tampilan akan kembali ke halaman sebelum halaman yang digantikan.


Navigator.pop(): Menutup halaman saat ini dan kembali ke halaman sebelumnya di navigation stack.


Metode yang digunakan untuk membuka formulir dari kartu aksi adalah Navigator.push().


Opsi home di drawer menggunakan Navigator.pushReplacement(context, MaterialPageRoute(build (context) => MyHomePage(),),) ketika opsi home dipilih maka halaman pada stack yang saat ini sedang dibuka (misalkan tampilan formulir tambah proyek) akan digantikan dengan tampilan Home dengan memanggil route MyHomePage() dan tampilan akan berpindah ke home page.


2. Scaffold berfungsi sebagai kerangka utama yang mengatur struktur seperti AppBar dan Drawer. AppBar berfungsi menampilkan bagian atas halaman seperti judul dan tombol navigasi. AppBar memastikan tampilan header yang konsisten antar halaman. Drawer menyediakan menu navigasi untuk berpindah antar halaman. Gabungan dari ketiga elemen tersebut menjaga konsistensi struktur dan navigasi antar halaman berbeda.

Contoh penggunaan warna tema portofolio di lebih dari satu halaman adalah penggunaan warna indigo pada bagian AppBar yang digunakan pada homepage, tambah proyek, dan tambah pengalaman melalui Theme.of(context).colorScheme.primary

3. Tata letak formulir menggunakan Form, SingleChildScrollView, Column, Row, Padding, dan SizedBox dipilih agar seluruh kolom input dan tombol save tersusun terstruktur serta tetap dapat dijangkau pada layar sempit maupun saat keyboard muncul. 

Widget pengatur jarak seperti Padding.

SizedBox memberi ruang di sekitar widget dan jarak antar komponen agar elemen tidak saling berhimpit.  

SingleChildScrollView memungkinkan konten di scroll secara vertikal ketika tinggi konten melebihi ruang layar yang tersedia atau saat keyboard digital menutupi sebagian layar.

4. GlobalKey<FormState> berperan untuk mengakses dan mengontrol state dari widget Form seperti menjalankan proses validasi

validator berperan untuk memeriksa apakah input yang dimasukkan pengguna memenuhi aturan/syarat tertentu. Jika input tidak valid maka valdiator akan menampilkan pesan kesalahan.

validate() berperan untuk menjalankan seluruh validator pada Form. validate() akan menghasilkan true jika semua input valid dan false jika terdapat input yang invalid.

Contoh nilai yang ditolak oleh validasi adalah ketika input yang diberikan hanya karakter spasi. Memiliih jenis input atau papan ketik saja tidak cukup karena tidak menjamin input yang diberikan oleh pengguna valid. Pengguna bisa saja memasukkan hanya karakter spasi untuk nama atau deskripsi atau input yang terlalu panjang pada nama. Oleh karena itu peran validator diperlukan.

### AI Disclosure
Dengan ini saya menyatakan bahwa pengerjaan Tugas Individu 8 ini saya kerjakan dengan menggunakan bantuan AI. Strategi penggunaan AI saya adalah dengan meminta AI untuk membagi tahapan pengerjaan tugas menjadi beberapa step yang terstruktur agar progress pengerjaan tugas dapat di track dengan jelas. Saya meminta AI untuk mebuat saya turut ikut mengerjakan dan tidak hanya copy paste tanpa pikir panjang. Pada setiap langkahnya AI memberikan saya pertanyaan terkait pemahaman saya terhadap kode agar saya lebih dapat memahami alur kode yang saya buat. Selain itu saya juga menggunakan AI untuk melakukan debugging dan mendeteksi bug/kesalahan dalam kode saya.
link percakapan AI yang saya gunakan dalam pengerjaan tugas individu 8:

### Instruksi Setup Mingguan:
-Membuat branch baru sesuai dengan tugas/tutorial yang diberikan
-Menegerjakan tugas/tutorial secara bertahap dalam langkah-langkah yang terstruktur
-Melakukan commit setiap langkah atau setiap perbaikan bug/kesalahan yang dilakukan
-Melakukan merge ke branch main agar tetap sinkron

### Progress Mingguan
