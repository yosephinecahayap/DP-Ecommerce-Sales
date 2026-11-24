# E-Commerce Sales Dashboard

Proyek analisis data transaksi e-commerce untuk memahami tren penjualan, mengevaluasi performa produk dan wilayah, serta menganalisis perilaku pelanggan menggunakan PostgreSQL dan Power BI.

## 1. Gambaran Umum Proyek

Proyek ini berfokus pada analisis data transaksi e-commerce menggunakan dataset simulasi (dummy) untuk memperoleh gambaran mengenai performa penjualan dan karakteristik pelanggan.

Bisnis e-commerce perlu memantau kinerja penjualan secara terstruktur untuk mengetahui kategori produk, wilayah, dan metode pembayaran yang memberikan kontribusi terbesar terhadap pendapatan. Selain itu, analisis perilaku pelanggan dan pengalaman berbelanja diperlukan untuk mendukung strategi peningkatan penjualan dan kepuasan pelanggan.

Melalui proyek ini, dilakukan pemeriksaan kualitas data dan analisis menggunakan PostgreSQL. Hasil analisis kemudian divisualisasikan dalam dashboard interaktif menggunakan Power BI untuk menyajikan KPI, tren penjualan, performa produk, dan insight bisnis.

## 2. Tujuan Proyek

- Memeriksa kualitas dan konsistensi data transaksi.
- Menganalisis tren penjualan berdasarkan periode waktu.
- Mengidentifikasi kategori produk dan wilayah dengan pendapatan tertinggi.
- Menganalisis kontribusi metode pembayaran terhadap pendapatan.
- Memahami perilaku pelanggan satu kali dan pelanggan berulang.
- Mengevaluasi hubungan antara kuantitas, harga, diskon, waktu pengiriman, dan rating pelanggan.
- Menyajikan hasil analisis melalui dashboard interaktif.

## 3. Dataset

Dataset yang digunakan merupakan dataset simulasi (dummy) transaksi e-commerce dengan total **5.000 baris dan 12 kolom**.

Dataset mencakup informasi berikut:

- **Informasi Transaksi:** ID pesanan dan tanggal transaksi.
- **Informasi Pelanggan:** ID pelanggan.
- **Informasi Produk:** Kategori produk.
- **Informasi Wilayah:** Wilayah transaksi.
- **Informasi Penjualan:** Kuantitas, harga satuan, diskon, dan pendapatan.
- **Informasi Pembayaran:** Metode pembayaran.
- **Pengalaman Pelanggan:** Waktu pengiriman dan rating pelanggan.

## 4. Tools dan Teknologi

| Tools | Penggunaan |
|---|---|
| PostgreSQL | Pengelolaan data dan analisis menggunakan SQL |
| pgAdmin | Antarmuka untuk mengelola database dan menjalankan query SQL |
| Power BI | Pembuatan dashboard dan visualisasi data |

## 5. Tahapan Analisis

### 5.1 Data Loading dan Data Exploration

Memuat dataset ke dalam PostgreSQL dan memeriksa struktur data, jumlah baris, tipe data, serta karakteristik awal setiap kolom.

### 5.2 Data Quality Assessment

Melakukan pemeriksaan kualitas data untuk memastikan konsistensi dan validitas informasi transaksi melalui:

- Pemeriksaan missing values.
- Pemeriksaan data duplikat berdasarkan ID pesanan.
- Pemeriksaan nilai yang tidak valid, seperti kuantitas, harga, diskon, waktu pengiriman, dan rating.
- Validasi perhitungan revenue berdasarkan kuantitas, harga satuan, dan diskon.

### 5.3 Sales Performance Analysis

Menganalisis performa penjualan berdasarkan beberapa dimensi:

- Tren pendapatan bulanan.
- Pendapatan berdasarkan kategori produk.
- Pendapatan berdasarkan wilayah.
- Pendapatan berdasarkan metode pembayaran.
- Perbandingan jumlah transaksi dan rata-rata nilai transaksi.

### 5.4 Customer Behaviour Analysis

Menganalisis karakteristik dan perilaku pelanggan melalui:

- Jumlah pelanggan unik.
- Perbandingan pelanggan satu kali dan pelanggan berulang.
- Rata-rata jumlah pesanan per pelanggan.
- Identifikasi 10 pelanggan dengan pendapatan tertinggi.

### 5.5 Transaction and Customer Satisfaction Analysis

Mengevaluasi hubungan antara karakteristik transaksi dan pengalaman pelanggan, meliputi:

- Hubungan kuantitas dan pendapatan.
- Hubungan harga satuan dan pendapatan.
- Hubungan diskon dan pendapatan.
- Hubungan waktu pengiriman dan rating pelanggan.

### 5.6 Dashboard Development

Membangun dashboard interaktif menggunakan Power BI untuk menampilkan KPI utama, tren pendapatan, performa kategori, distribusi wilayah, metode pembayaran, serta karakteristik pelanggan.

## 6. Hasil Analisis

Hasil analisis menunjukkan performa penjualan dan karakteristik pelanggan berdasarkan 5.000 pesanan dan 989 pelanggan.

### Key Performance Indicators (KPI)

| Indikator | Hasil |
|---|---:|
| Total Revenue | 5,11 juta |
| Total Orders | 5.000 |
| Total Quantity | 20.000 |
| Average Order Value | 1,02 ribu |
| Total Customers | 989 |

### Insight Utama

1. **Kontribusi Kategori Produk:** Electronics menghasilkan pendapatan tertinggi sebesar 1,83 juta, diikuti Clothing sebesar 1,53 juta. Kedua kategori tersebut menyumbang sekitar 66% dari total pendapatan.

2. **Pelanggan Berulang:** Sebanyak 950 dari 989 pelanggan atau sekitar 96% merupakan pelanggan berulang. Rata-rata pelanggan melakukan sekitar 5 pesanan.

3. **Tren Pendapatan Bulanan:** Pendapatan bulanan relatif stabil pada kisaran 399 ribu hingga 480 ribu, dengan puncak penjualan pada bulan Mei dan Agustus. Pendapatan kemudian melandai pada periode September hingga Desember.

4. **Distribusi Pendapatan Wilayah:** Pendapatan antarwilayah relatif merata. Wilayah West mencatat pendapatan tertinggi sebesar 1,35 juta, sedangkan East menjadi wilayah dengan pendapatan terendah sebesar 1,24 juta.

5. **Metode Pembayaran:** Card menjadi metode pembayaran dengan kontribusi pendapatan terbesar, yaitu sekitar 2,4 juta, diikuti COD sebesar 1,8 juta.

6. **Kepuasan Pelanggan:** Rata-rata rating pelanggan berada di sekitar 3,0 dari skala 5 pada seluruh kategori. Hal ini menunjukkan masih terdapat peluang untuk meningkatkan kualitas produk dan layanan.

## 7. Rekomendasi Bisnis

Berdasarkan hasil analisis, berikut beberapa rekomendasi yang dapat dipertimbangkan:

| Area | Rekomendasi Strategi |
|---|---|
| Electronics dan Clothing | Memprioritaskan ketersediaan stok dan aktivitas promosi pada kategori dengan kontribusi pendapatan terbesar. |
| Home dan Beauty | Mengembangkan penjualan melalui bundling dan cross-selling untuk meningkatkan kontribusi kedua kategori. |
| Tren Penjualan | Memanfaatkan puncak penjualan pada bulan Mei dan Agustus melalui kampanye promosi khusus. |
| Penjualan Akhir Tahun | Menjalankan promo akhir tahun untuk membantu menjaga pendapatan pada periode September hingga Desember. |
| Akuisisi Pelanggan | Memperluas jangkauan pasar untuk mendapatkan pelanggan baru karena mayoritas pelanggan saat ini sudah melakukan pembelian berulang. |
| Nilai Pesanan | Meningkatkan nilai pesanan melalui rekomendasi produk dan penawaran tambahan yang relevan. |
| Kepuasan Pelanggan | Mengevaluasi kualitas produk dan layanan untuk meningkatkan rating serta pengalaman berbelanja. |

## 8. Dashboard Power BI

Hasil analisis disajikan dalam dashboard interaktif menggunakan Power BI dengan filter tahun dan beberapa indikator utama.

Dashboard menampilkan:

- KPI Total Revenue, Total Orders, Total Quantity, Average Order Value, dan Total Customers.
- Tren pendapatan bulanan.
- Perbandingan pendapatan berdasarkan kategori produk.
- Distribusi pendapatan berdasarkan wilayah.
- Kontribusi metode pembayaran.
- Analisis pelanggan satu kali dan pelanggan berulang.
- Perbandingan rating pelanggan berdasarkan kategori produk.

### Dashboard Preview

<!-- Tambahkan screenshot dashboard di sini -->

<!-- Contoh: ![E-Commerce Sales Dashboard](images/dashboard-overview.png) -->

**File Dashboard:** `Ecommerce Sales Dashboard.pbix`

## 9. Struktur Repository

| File | Deskripsi |
|---|---|
| `queryecommercesales.sql` | Query SQL untuk pembuatan tabel, pemeriksaan kualitas data, dan analisis transaksi e-commerce. |
| `ecommerce_sales_analytics_5000.csv` | Dataset transaksi e-commerce yang digunakan dalam proyek. |
| `Ecommerce Sales Dashboard.pbix` | File dashboard interaktif Power BI. |

## 10. Cara Menjalankan Proyek

1. Clone repository:

   ```bash
   git clone https://github.com/yosephinecahayap/DP-Ecommerce-Sales.git
   ```

2. Buka PostgreSQL melalui pgAdmin dan buat database baru untuk proyek ini.

3. Import file `ecommerce_sales_analytics_5000.csv` ke dalam database menggunakan fitur Import/Export pada pgAdmin. Sesuaikan nama tabel dan tipe data kolom dengan struktur pada query SQL.

4. Buka file `queryecommercesales.sql` menggunakan Query Tool di pgAdmin.

5. Jalankan query SQL secara berurutan untuk membuat tabel, memeriksa kualitas data, dan melakukan analisis transaksi.

6. Buka file `Ecommerce Sales Dashboard.pbix` menggunakan Power BI Desktop untuk melihat dashboard interaktif.

## 11. Informasi Proyek

- **Nama Proyek:** E-Commerce Sales Dashboard
- **Jenis Proyek:** Data Analysis Project
- **Domain:** E-Commerce
- **Dataset:** E-Commerce Sales Analytics (5,000 Records)
- **Fokus:** Sales Performance & Customer Behaviour Analysis
- **Metode:** Data Quality Assessment, SQL Analysis, dan Business Insight Analysis
- **Tools:** PostgreSQL, pgAdmin, dan Power BI
