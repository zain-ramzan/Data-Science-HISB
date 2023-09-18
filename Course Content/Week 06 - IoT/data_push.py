import random
import paho.mqtt.client as mqtt
import time
import json

broker_address= '192.168.59.197'
client=mqtt.Client('publisher')
client.connect(broker_address)


while True:
	msg='temperature {}'.format(random.randint(30,40))
	msg_json=json.dumps(msg)
	time.sleep(1)
	client.publish('sensor/temprature',msg_json)
	print(msg_json)
