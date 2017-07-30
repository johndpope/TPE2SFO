from flask import Flask
import mraa
app = Flask(__name__)

pin = mraa.Gpio(2)
pin.dir(mraa.DIR_OUT)

@app.route('/true')
def trueHandler():
    pin.write(1)
    return 'Turned led on'

@app.route('/false')
def falseHandler():
    pin.write(0)
    return 'Turned led off'

app.run(host='0.0.0.0', port= 8090)