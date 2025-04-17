FROM nextcloud:apache

# เพิ่ม PHP library พื้นฐาน
RUN apt-get update && apt-get install -y \
  libmagickcore-6.q16-6-extra \
  && rm -rf /var/lib/apt/lists/*
  