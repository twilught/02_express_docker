# ใช้ Node.js 20 LTS (alpine เบาและเร็ว)
FROM node:20-alpine

# กำหนด working directory
WORKDIR /app

# คัดลอกไฟล์ package.json และ package-lock.json มาก่อน
COPY package*.json ./

# ติดตั้ง dependencies (เฉพาะ production ถ้าอยากเล็กลงใช้ --omit=dev)
RUN npm install --omit=dev

# คัดลอก source code ทั้งหมด
COPY . .

# เปิดพอร์ต 5000 (ตามที่ Express ใช้)
EXPOSE 3000

# คำสั่งรัน container
CMD ["npm", "start"]
