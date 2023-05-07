#include <LoRa.h>
#include <SoftwareSerial.h>

SoftwareSerial softSerial(10, 11); // RX, TX
const int M0 = 7;
const int M1 = 8;
const long frequency = 433E6; // Frequency in Hz (433 MHz)
const int syncWord = 0x34; // Sync word

void setup() {
  Serial.begin(9600);
  pinMode(M0, OUTPUT);
  pinMode(M1, OUTPUT);
  digitalWrite(M0, LOW);
  digitalWrite(M1, LOW);

  while (!Serial);

  Serial.println("LoRa receiver");

  if (!LoRa.begin(frequency)) {
    Serial.println("Starting LoRa failed!");
    while (1);
  }
  LoRa.setSyncWord(syncWord);
}

void loop() {
  int packetSize = LoRa.parsePacket();
  if (packetSize) {
    Serial.print("Received packet: ");
    while (LoRa.available()) {
      Serial.print((char)LoRa.read());
    }
    Serial.println();
  }
}
