#!/usr/bin/env python3
import paho.mqtt.client as mqtt

def on_connect(client, userdata, flags, rc):
    # This will be called once the client connects
    print(f"Connected with result code {rc}")
    # Subscribe here!
    client.subscribe("sensor/temprature")

def on_message(client, userdata, msg):
    print(f"Message received [{msg.topic}]: {msg.payload}")

client = mqtt.Client("subscriber") # client ID "mqtt-test"
client.on_connect = on_connect
client.on_message = on_message
#client.username_pw_set("myusername", "aeNg8aibai0oiloo7xiad1iaju1uch")
client.connect('192.168.59.197', 1883)
client.loop_forever()  # Start networking daemon
