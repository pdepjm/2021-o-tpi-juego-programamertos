# Roadmap

## Decisiones

- [x] ¿Mapa único, objetos generados aleatoriamente, o varios mapas prearmados?
  
  -Tres mapas de paredes y obstáculos fijos con imágenes randomizadas

- [x] ¿Los jugadores tienen una o varias vidas?
  - [x] Los jugadores tienen una vida
  - Cuando queda un solo jugador en pie, con un cartel/contador de por medio se carga otro mapa infinitamente
- [ ] ¿Qué objetos bonus serán implementados?
  - [ ] Aumentar rango de explosión
  - [ ] Aumentar cantidad de bombas
  - [ ] Aumentar velocida de explosión
  - [ ] Inmunidad por corto lapso de tiempo

## Diseños

- [x] Menúes
  - [x] Menú principal (hecho está en discord)
  - [ ] Pantalla de controles (resizear a 544x544)
  - [ ] Pantalla de créditos (resizear a 544x544)
  - [x] Interfaz de fin de nivel (resizear a 544x544)
  - [ ] Contador victorias por jugador

## Código

- [x] Implementar menúes
  - [ ] Emprolijar código (Ver de usar identificadores en vez de comparar objetos)
- [ ] Implementar función para cambiar el background
- [ ] Implementar carga random de niveles
- [ ] Implementar objetos bonus
  - [ ] Mayor alcance de bomba
  - [ ] Más bombas por jugador
- [x] Terminar mapa actual
- [x] Objetos en posiciones fijas con imágenes randomizadas (Mariela)
- [ ] Implementar nuevos niveles (2 mapas adicionales) (Mariela)


### Tests

- [ ] Desarrollar lista de tests a implementar (Acá)
  - [ ] Un jugador se mueve correctamente
    - [ ] Al presionar W se mueve hacia arriba
    - [ ] Al presionar S se mueve hacia abajo
    - [ ] Al presionar A se mueve hacia izquierda
    - [ ] Al presionar D se mueve hacia Derecha
    - [ ] Al presionar minusKey coloca una bomba
  - [ ] El personaje no puede pasar sobre las paredes
  - [ ] Una bomba explota
  - [ ] Se destruye un obstáculo por la explosión de una bomba
  - [ ] Un jugador muere al ser alcanzado por la explosión de una bomba
  - [ ] ...

### Obstáculos

- [x] Obstáculos destruibles en el mapa
- [ ] Los obstáculos destruídos sueltan objetos bonus (aleatorios)
- [ ] Los personajes pueden agarrar objetos bonus
- [ ] Aplicar efectos de los objetos bonus
- [ ] Los objetos bonus tienen una duración máxima

## Más adelante

- [ ] Música
- [ ] Sonido
