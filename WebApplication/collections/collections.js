// Les deux collections suivantes ont un seul et unique document,
// dont la seule fonction est de permettre le dialogue entre :
// - le serveur, seul à meme de recevoir et interpréter le signal arduino
// - le client, qui doit afficher l'une ou l'autre page du programme en fonction du signal capté

// Compteur de 'lançage de déchet', et par extension du nombre de jeux
// Attributs :
// - count, int : s'incrémente à chaque lançage.
// Collection observée dans le template 'game', permet de finir le jeu
Trees = new (Mongo.Collection)('trees');

// Gestion du routage 'physique (passage d'une page à l'autre en pressant un capteur arduino)
// Attributs :
// - currentRoad, String : valeur variant à chaque pressage de bouton, en fonction du template courant
// Collection observée dans les template 'home' et 'explanation'
Roads = new (Mongo.Collection)('roads');


// ==================================================================

// Stock les villes à découvrir dans l'application.
Cities = new (Mongo.Collection)('cities');