FROM python:3.9-slim

# 安装必要的依赖
RUN apt-get update && apt-get install -y \
    build-essential \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# 创建工作目录
WORKDIR /app

# 复制项目文件(假设files文件夹在项目根目录)
COPY files/ /app/files/
COPY requirements.txt /app/

# 安装Python依赖
RUN pip install --no-cache-dir -r requirements.txt

# 设置工作目录
WORKDIR /app/files

# 设置默认命令(运行所有脚本)
CMD ["sh", "-c", "python script1.py > output1.txt && python script2.py > output2.txt && python script3.py > output3.txt"]
