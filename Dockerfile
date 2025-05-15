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
CMD ["sh", "-c", "python StepOne.py > output1.txt && python StepTwo.py > output2.txt && python StepThree.py > output3.txt"]
