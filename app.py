from flask import Flask
import datetime

app = Flask(__name__)

@app.route('/')
def hello():
    return """
    <!DOCTYPE html>
    <html>
    <head>
        <title>Teste CasaOS</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                text-align: center;
                margin-top: 50px;
                background-color: #f0f0f0;
            }
            .container {
                background-color: white;
                padding: 20px;
                border-radius: 10px;
                display: inline-block;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }
            .success {
                color: green;
                font-size: 24px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>🚀 Teste CasaOS</h1>
            <p class="success">✅ Container Docker funcionando!</p>
            <p>Se você está vendo esta página, seu aplicativo está rodando corretamente no CasaOS.</p>
            <p><small>Data/hora: {}</small></p>
        </div>
    </body>
    </html>
    """.format(datetime.now().strftime('%Y-%m-%d %H:%M:%S'))

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=9001)