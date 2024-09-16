from flask import Flask, jsonify, request
import mysql.connector
from pymongo import MongoClient

app = Flask(__name__)

# MySQL Bağlantısı
mysql_conn = mysql.connector.connect(
    host="localhost",  # MySQL sunucusu
    user="root",  # MySQL kullanıcı adı
    password="Ulasbaran963",  # MySQL şifresi
    database="support_db"  # MySQL veritabanı
)

# MongoDB Bağlantısı
mongo_client = MongoClient("mongodb://localhost:27017/")  # MongoDB sunucu bağlantısı
mongo_db = mongo_client["support_team"]  # MongoDB veritabanı seçimi

@app.route('/tickets/sql', methods=['GET'])
def get_tickets_sql():
    cursor = mysql_conn.cursor(dictionary=True)  # MySQL sorgu için imleç oluşturma
    cursor.execute("SELECT * FROM Tickets WHERE status = 'Open'")  # Açık durumdaki talepleri çekme
    tickets = cursor.fetchall()  # Sorgu sonucunu çekme
    return jsonify(tickets)  # Sonuçları JSON formatında döndürme

@app.route('/tickets/nosql', methods=['GET'])
def get_tickets_nosql():
    tickets = mongo_db.tickets.find({"status": "Open"})  # MongoDB'den açık talepleri çekme
    return jsonify([ticket for ticket in tickets])  # JSON formatında döndürme

if __name__ == '__main__':
    app.run(debug=True)  # Uygulamayı çalıştırma
