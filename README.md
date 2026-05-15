# Tugas-Teksam-Non-Probability-Sampling
# Analisis Non-Probability Sampling pada Survei Pola Tidur Mahasiswa Statistika Angkatan 2024

## Latar Belakang
Pola tidur yang tidak teratur merupakan salah satu permasalahan umum yang dialami mahasiswa, terutama di tengah padatnya jadwal perkuliahan, tugas, dan aktivitas lainnya. Kondisi kurang tidur berpotensi memengaruhi berbagai aspek akademik, mulai dari konsentrasi di kelas, kemampuan mengingat materi, hingga produktivitas belajar secara keseluruhan.

Penelitian ini berfokus pada mahasiswa Program Studi Statistika angkatan 2024 (Semester 4) yang merupakan populasi homogen dari sisi program studi dan semester. Survei dilakukan menggunakan metode **convenience sampling**, salah satu bentuk non-probability sampling, di mana responden dipilih berdasarkan kemudahan akses — dalam hal ini teman sekelas.

Karena metode ini rentan menghasilkan sampel yang tidak representatif (misalnya, ketidakseimbangan proporsi jenis kelamin antara sampel dan populasi), maka dilakukan koreksi menggunakan **weighting sederhana** untuk menghasilkan estimasi yang lebih akurat terhadap kondisi populasi sebenarnya.

---

## Tujuan

1. Mengumpulkan data mengenai persepsi mahasiswa Statistika angkatan 2024 terhadap dampak kurang tidur pada performa akademik.
2. Menerapkan metode **naive estimation** dan **weighted estimation** pada data hasil non-probability sampling.
3. Membandingkan kedua metode estimasi untuk menunjukkan pentingnya koreksi bobot dalam survei non-probabilitas.
4. Menyajikan hasil analisis secara visual dan interpretatif.

---

## Metode

### Pengumpulan Data
- **Instrumen**: Google Form dengan 10 pernyataan menggunakan skala Likert (1–5) seputar dampak kurang tidur terhadap akademik.
- **Responden**: 24 mahasiswa Program Studi Statistika Angkatan 2024 (Semester 4).
- **Teknik Sampling**: Convenience Sampling (Non-Probability Sampling).

### Variabel
| Variabel | Keterangan |
|---|---|
| Jenis Kelamin | Laki-laki / Perempuan |
| Program Studi | Statistika |
| Semester | 4 |
| P1–P10 | 10 item pernyataan dampak kurang tidur |

### Analisis

**Tahap 5 — Analisis Deskriptif**  
Menghitung frekuensi dan persentase untuk variabel demografis (jenis kelamin, program studi, semester).

**Tahap 6 — Naive Estimation**  
Menghitung proporsi responden yang menjawab "setuju" (skor ≥ 4) secara langsung tanpa koreksi:

$$\hat{P} = \frac{\text{Jumlah Setuju}}{\text{Total Responden}}$$

**Tahap 7 — Weighting Sederhana**  
Membandingkan distribusi sampel dengan distribusi populasi (Kelas A: 26 mahasiswa, Kelas B: 27 mahasiswa) untuk menghitung bobot koreksi:

$$w_i = \frac{\text{Proporsi Populasi}}{\text{Proporsi Sampel}}$$

Sampel terdiri dari 23 mahasiswa Kelas A dan 1 mahasiswa Kelas B, sehingga:
- Bobot Kelas A: `(26/53) / (23/24) ≈ 0.511`
- Bobot Kelas B: `(27/53) / (1/24) ≈ 12.226`

**Tahap 8 — Perbandingan Estimasi**  
Membandingkan hasil naive estimation dan weighted estimation pada setiap item.

---

## Hasil

### Distribusi Responden
- **Total Responden**: 24 orang
- **Jenis Kelamin**: Perempuan 91.7% (22 orang), Laki-laki 8.3% (2 orang)
- **Program Studi**: Statistika 100%
- **Semester**: 4 (100%)

### Naive vs Weighted Estimation

| Item | Pernyataan | Naive | Weighted | Selisih |
|---|---|---|---|---|
| P1 | Merasa mengantuk di kelas akibat kurang tidur | 0.375 | 0.680 | 0.305 |
| P2 | Kesulitan mengerjakan tugas ketika kurang tidur | 0.375 | 0.680 | 0.305 |
| P3 | Merasa lelah saat kuliah ketika tidur tidak cukup | 0.500 | 0.744 | 0.244 |
| P4 | Sulit mengingat materi yang sudah dipelajari | 0.375 | 0.680 | 0.305 |
| P5 | Sulit berkonsentrasi di kelas ketika kurang tidur | 0.417 | 0.701 | 0.284 |
| P6 | Merasa nilai menurun saat pola tidur tidak teratur | 0.375 | 0.680 | 0.305 |
| P7 | Dapat memahami materi dengan baik setelah cukup tidur | 0.333 | 0.659 | 0.326 |
| P8 | Kurang bersemangat menghadiri perkuliahan | 0.208 | 0.595 | 0.387 |
| P9 | Lebih mudah mengerti materi setelah cukup tidur | 0.375 | 0.680 | 0.305 |
| P10 | Produktivitas belajar turun ketika kurang tidur | 0.458 | 0.723 | 0.265 |

Weighted estimation secara konsisten **lebih tinggi** dari naive estimation di seluruh item, dengan selisih berkisar antara **0.244 hingga 0.387**. Hal ini terjadi karena sampel didominasi perempuan (91.7%) dan hampir seluruhnya dari Kelas A, sementara populasi lebih seimbang antara Kelas A dan B. Koreksi bobot memberikan representasi yang lebih proporsional terhadap kelompok yang underrepresented (Kelas B / laki-laki).

---

## Kesimpulan

1. Survei menggunakan convenience sampling menghasilkan sampel yang **tidak representatif** secara gender dan distribusi kelas — mayoritas responden adalah perempuan dari Kelas A.

2. **Naive estimation** cenderung meremehkan proporsi "setuju" karena tidak mempertimbangkan ketimpangan distribusi sampel vs populasi.

3. Setelah dilakukan **weighting sederhana**, estimasi meningkat secara signifikan di semua item (rata-rata selisih ~0.303), menunjukkan bahwa mahasiswa secara populasi diperkirakan lebih banyak yang merasakan dampak kurang tidur pada performa akademik dibandingkan yang terlihat dari sampel mentah.

4. Secara keseluruhan, hasil analisis menunjukkan bahwa **kurang tidur berdampak nyata terhadap performa akademik** mahasiswa Statistika Angkatan 2024, termasuk penurunan konsentrasi, semangat belajar, dan kemampuan mengingat materi.

5. Proyek ini memperlihatkan pentingnya **koreksi bias sampling** dalam survei non-probabilitas agar hasil yang diperoleh lebih mendekati kondisi populasi sesungguhnya.

---

## Tools & Library

- **Bahasa**: R
- **Library**: `readxl`, `dplyr`, `ggplot2`
