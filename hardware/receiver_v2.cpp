#include <SPI.h>
#include <LoRa.h>

const int ss = 10;        // LoRa module's slave select pin
const int dio0 = 2;       // LoRa module's DIO0 pin
const long frequency = 915E6; // Set frequency according to your region (e.g., 915E6 for North America)

void setup() {
  Serial.begin(9600);
  while (!Serial);

  Serial.println("LoRa Receiver");

  if (!LoRa.begin(frequency)) {
    Serial.println("Starting LoRa failed!");
    while (1);
  }

  LoRa.setSpreadingFactor(7);
  LoRa.setSignalBandwidth(125E3);
  LoRa.setCodingRate4(5);

  LoRa.receive();
  Serial.println("LoRa Initialized");
}

void loop() {
  int packetSize = LoRa.parsePacket();
  if (packetSize) {
    Serial.print("Received packet '");
    while (LoRa.available()) {
      Serial.print((char)LoRa.read());
    }
    Serial.print("' with RSSI ");
    Serial.println(LoRa.packetRssi());
  }
}
