FROM alpine:latest

# ติดตั้ง rclone
RUN apk add --no-cache curl && \
    curl https://rclone.org/install.sh | sh

# สร้างผู้ใช้ rclone
RUN addgroup -S app && adduser -S app -G app
USER app

# คัดลอกไฟล์ config เข้า container
COPY rclone.conf /home/app/.config/rclone/rclone.conf

EXPOSE 8080

# รัน WebDAV Server
CMD ["rclone", "serve", "webdav", "b2remote:your-bucket", "--addr", ":8080", "--user", "youruser", "--pass", "yourpass"]
