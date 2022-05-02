import ddf.minim.*;
Minim minim;
AudioPlayer song;
String[] songNames;
String nowPlaying;
int index;
float barLength, barHeight, songPos, wave1H, wave2H;
boolean started;
ArrayList<String> songsPlayed = new ArrayList();

void setup(){
  surface.setLocation(0, 0);
  size(800, 600);
  minim = new Minim(this);
  songNames = loadStrings("c:/users/Goo/Music/songData.txt");
  nowPlaying = " ";
  textAlign(CENTER, CENTER);
  started = false;
  barLength = width/1.5;
  barHeight = height/15;
  wave1H = height/1.5;
  wave2H = height/1.2;
}

void draw(){
  background(0);
  fill(255);
  textSize(width/23);
  text("Click in window to load a random song", width/2, height/8);
  text("NOW PLAYING: \n" + nowPlaying, width/2, height/3);
  if(song != null && started && !song.isPlaying()){
    loadSong();
  }
  if(songNames.length == songsPlayed.size() && !song.isPlaying()){
      printArray(songsPlayed);
      started = false;
      songsPlayed.clear();
      frameCount = -1;
    }
    if(started){
      songBar();
      waveForm();
    }
}

void mouseReleased(){
  started = true;
  loadSong();
}
