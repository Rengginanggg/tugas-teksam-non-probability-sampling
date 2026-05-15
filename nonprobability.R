# ============================================================
# TUGAS PROYEK - Analisis Non-Probability Sampling pada Survei Online
# ============================================================

# Install dan load library
install.packages("readxl")
library(readxl)
data <- read_excel("D:/tugas kuliah/Teknik Sampling/Data Teksam.xlsx")

install.packages("dplyr")
library(dplyr)

# ============================================================
# TAHAP 5 - ANALISIS DESKRIPTIF
# ============================================================

# Tabel Frekuensi Jenis Kelamin
frek_jk <- data %>%
  group_by(`Jenis Kelamin`) %>%
  summarise(Frekuensi = n()) %>%
  mutate(Presentase = round(Frekuensi / sum(Frekuensi)*100,1))
print(frek_jk)

# Tabel Frekuensi Program Studi
freq_prodi <- data %>%
  group_by(`Program Studi`) %>%
  summarise(Frekuensi = n()) %>%
  mutate(Presentase = round(Frekuensi / sum(Frekuensi)*100,1))
print(freq_prodi)

# Tabel Frekuensi Semester
freq_sem <- data %>%
  group_by(Semester) %>%
  summarise(Frekuensi = n()) %>%
  mutate(Presentase = round(Frekuensi / sum(Frekuensi)*100,1))
print(freq_sem)

# Grafik
install.packages("ggplot2")
library(ggplot2)

ggplot(frek_jk, aes(x = `Jenis Kelamin`, y = Frekuensi, fill = `Jenis Kelamin`)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = paste0(Frekuensi, " (", Presentase, "%)")), vjust = 0.5) +
  labs(title = "Distribusi Jenis Kelamin") +
  theme_minimal()

ggplot(freq_sem, aes(x = factor(Semester), y = Frekuensi, fill = factor(Semester))) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = paste0(Frekuensi, " (", Presentase, "%)")), vjust = 0.5) +
  labs(title = "Distribusi Semester", x = "Semester") +
  theme_minimal()

ggplot(freq_prodi, aes(x = `Program Studi`, y = Frekuensi, fill = `Program Studi`)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = paste0(Frekuensi, " (", Presentase, "%)")), vjust = 0.5) +
  labs(title = "Distribusi Program Studi") +
  theme_minimal()

# ============================================================
# TAHAP 6 - NAIVE ESTIMATION
# ============================================================
cols <- names(data)[6:15]
naive_est <- sapply(data[, cols], function(x) round(sum(x >= 4) / length(x), 3))
print(naive_est)

# ============================================================
# TAHAP 7 - WEIGHTING SEDERHANA
# ============================================================

# Proporsi populasi dan sampel
prop_pop_A <- 26/53
prop_pop_B <- 27/53
prop_sam_A <- 23/24
prop_sam_B <- 1/24

# Bobot
w_A <- prop_pop_A / prop_sam_A
w_B <- prop_pop_B / prop_sam_B
cat("Bobot Kelas A:", round(w_A, 4), "\n")
cat("Bobot Kelas B:", round(w_B, 4), "\n")

# Weighted Estimation
data$kelas <- c(rep("A", 23), rep("B", 1))
data$bobot <- ifelse(data$kelas == "A", w_A, w_B)
weighted_est <- sapply(data[, cols], function(x) {
  round(sum((x >= 4) * data$bobot) / sum(data$bobot), 3)
})
print(weighted_est)

# ============================================================
# TAHAP 8 - PERBANDINGAN ESTIMASI
# ============================================================
perbandingan <- data.frame(
  Item = paste0("P", 1:10),
  Naive = round(naive_est, 3),
  Weighted = round(weighted_est, 3),
  Selisih = round(weighted_est - naive_est, 3)
)
print(perbandingan)

# ============================================================
# TAHAP 9 - VISUALISASI
# ============================================================
df_plot <- data.frame(
  Item = rep(paste0("P", 1:10), 2),
  Nilai = c(naive_est, weighted_est),
  Metode = rep(c("Naive", "Weighted"), each = 10)
)

ggplot(df_plot, aes(x = Item, y = Nilai, fill = Metode)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Perbandingan Naive vs Weighted Estimation",
       x = "Item", y = "Proporsi") +
  theme_minimal()
