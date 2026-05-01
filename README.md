# Tutorial 8 - Game Polishing & Balancing

## Pass 2 Opinion
Menurut saya, updated movement system dengan percepatan/perlambatan dan partikel lari membuat game terasa jauh lebih responsif dan informatif. Pemain sekarang bisa lebih mudah membaca state karakter (sedang benar-benar sprint atau tidak), jadi kontrol terasa lebih satisfying dibanding versi sebelumnya yang terasa datar.

## Latihan 3 Balancing
Saya melakukan balancing pada `EnemySpawner` di Level 1 dengan mengubah `spawn_interval` dari `0.5` menjadi `1.4` detik. Nilai ini dipilih agar rintangan tidak terlalu brutal seperti sebelumnya, tetapi tetap menuntut timing lompatan yang konsisten sehingga level tidak terasa terlalu mudah.
