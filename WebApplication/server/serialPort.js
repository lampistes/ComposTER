// Gestion de la lecture du port serial
//=============================================================================
// Fichier à commenter si on souhaite lancer le programme sans que rien
// ne soit connecté au port.

var Fiber = Npm.require('fibers');

// Adresse du port à adapter
var serialPort = new SerialPort.SerialPort("/dev/ttyACM0", {
        baudrate: 9600,
        parser: SerialPort.parsers.readline('\r\n')
    });
  serialPort.on('open', function() {
      console.log('Port open');
  });
  serialPort.on('data', function(data) {
    console.log(data);
    switch(data) {
      case "1":
        console.log("click btn");
        changeRoute();
        break;
      case "2":
        console.log("launch garbage");
        upTree();
        break;
      default:
        console.log("default");
      upTree();
    }

  });

// Incrémentation du compteur "Arbre" : nombre de fois ou un déchet a été lancé
function upTree() {
  Fiber(function() {
    Trees.update({}, {$inc: {count: +1}});
    console.log("up");
  }).run();
}

// Routage de l'application lorsqu'on presse le bouton physique
// - passage de 'home' à 'explanation',
// - puis passage de 'explanation' à 'game'
function changeRoute() {
  Fiber(function() {
    var currentRoad = Roads.findOne().currentRoad
    console.log(currentRoad);
    switch(currentRoad) {
      case "home":
        console.log("go explanation");
        Roads.update({}, {currentRoad: "explanation"});
        break;
      case "explanation":
        console.log("go game");
        Roads.update({}, {currentRoad: "game"});
        break;
      case "game":
        console.log("go home");
        Roads.update({}, {currentRoad: "home"});
        break;
      default:
        console.log("def raod");

    }

  }).run();
}