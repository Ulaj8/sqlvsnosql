// Premium üyeliğe sahip kullanıcıları getir
db.users.find({ "subscription_type": "Premium" });

// İzleme süresi 600 dakikadan fazla olan kullanıcıları getir
db.users.find({ "watch_time": { "$gt": 600 } });

// Gibi dizisini izleyen kullanıcıları bul
db.users.find({ "watch_history.show_name": "Gibi" });

// Komedi türünü favori olarak belirten kullanıcıları getir
db.users.find({ "favorite_genres": "Komedi" });
