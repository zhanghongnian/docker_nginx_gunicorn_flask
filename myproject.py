# -*- coding:utf-8 -*-

from flask import Flask
import time

app = Flask(__name__)

@app.route('/')
def index():
    time.sleep(0.01) # 模拟程序阻塞
    return 'hello world!'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
    