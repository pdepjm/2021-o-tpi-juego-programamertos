import wollok.game.*

object soundManager {
    const activeSongs = []

    method playSound(sound, shouldLoop) {
        const soundToBePlayed = sound.get()
        soundToBePlayed.play()
    }

    method playSong(sound, shouldStopOthers) {

        //Stop other songs
        if (shouldStopOthers) {
            self.stopAllSongs()
        }
        
        //Play song
        const soundToBePlayed = sound.get()
        soundToBePlayed.shouldLoop(true)
        soundToBePlayed.play()
        activeSongs.add(soundToBePlayed)
    }

    method stopSong(sound) {
        sound.stop()
        activeSongs.remove(sound)
    }

    method stopAllSongs() {
        activeSongs.forEach({song => 
                song.stop()
            })
        activeSongs.clear()
    }
}

class SoundEffect {
    const property path

    method get() {
        const ret = game.sound(path)
        ret.initialize()
        return ret
    }
}