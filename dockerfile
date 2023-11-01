FROM debian:11

# ติดตั้งโปรแกรมที่จำเป็น
RUN apt-get update && apt-get install -y nut-client

# กำหนดการเชื่อมต่อ USB (สมมุติว่า /dev/usb/hiddev0 เป็นอุปกรณ์ USB ที่เชื่อมต่อกับเครื่อง UPS)
RUN usermod -aG plugdev user

# แบ็คอัพการกำหนดค่าของ NUT (Network UPS Tools)
ADD nut.conf /etc/nut/nut.conf
ADD ups.conf /etc/nut/ups.conf
ADD upsd.users /etc/nut/upsd.users
ADD upsd.conf /etc/nut/upsd.conf
ADD nut.conf /etc/nut/nut.conf

# เริ่มการทำงานของ NUT
CMD ["upsc", "myups@localhost"]
