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
  - [x] Menú principal
  - [x] Pantalla de controles (resizear a 544x544)
  - [x] Pantalla de créditos (resizear a 544x544)
  - [ ] Interfaz de fin de nivel (resizear a 544x544)
  - [ ] Contador victorias por jugador

## Código

- [x] Implementar menúes
  - [ ] Emprolijar código
- [x] Implementar función para cambiar el background
- [ ] Implementar carga random de niveles
- [x] Terminar mapa actual
- [x] Objetos en posiciones fijas con imágenes randomizadas (Mariela)
- [ ] Implementar nuevos niveles (2 mapas adicionales) (Mariela)

### Tests

- [ ] Desarrollar lista de tests a implementar (Acá)
  - [ ] Un jugador se mueve correctamente
    - [x] Al presionar W se mueve hacia arriba
    - [x] Al presionar S se mueve hacia abajo
    - [x] Al presionar A se mueve hacia izquierda
    - [x] Al presionar D se mueve hacia Derecha
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

## Documento

- [ ] Empezar

## Más adelante

- [ ] Música
- [ ] Sonido
- [ ] Implementar objetos bonus
  - [ ] Mayor alcance de bomba
  - [ ] Más bombas por jugador
