# semester-project
Semester project, PPKE-ITK, Spring 2018

Szlanka Máté

_2017/18/2 félév_


# Endless 3d játék 
#### Scene Kit használatával


  Egy 3D-s végtelenségig játszható játékot tervezek elkészíteni, ami az idő múlásával egyre nehezebb lesz. A splash screen után a főmenüben navigálva találja meg a felhasználó a menüpontokat. Itt a háttérben Game Center login történik, ide mentjük az általa elért eredményeket és tudjuk összehasonlítani a barátaiéval a különző ranglistához.
  
  A főmenüből érhető el a Beállítások, Játék és Statisztikák. A Beállítások abszolút szokásos, a Statisztikák alatt pedig az edidg játékkal töltött idő.
  
  A játék mindegyik kilépésnél megjegyzi a játé aktuális státuszát, ezt lehet folytatni. Az idő előrehaladtával az ablak (oldalirányú) mozgása egyre gyorsabb lesz, ezáltal kényszert adva a játékosnak, hogy gyorsabban lépjen. A fő karakternek az útjába kerülő akadályokat kell kikerülnie, miközben a mozgó ablak “sem hagyhatja le”, tehát nem eshet ki az ablakból.
  
  Ideális lenne a Freemium modellt követni, tehát az applikációba reklámokat elhelyezni, amik in-app-purchase-szel eltávolítható, továbbá minél több nyelvet is ideális lenne támogatni.


- Splash screen (majd animálva eltűnik)
- GameCenter login és üdvözlés
- Főmenü
  - Settings
    - Switch: Sound, haptic
  - Play
    - Újrakezd
    - Folytat
  - Statistics
    - Játszott idő
    - Ranglista
      - Saját
      - Globális/ismerősök között
- Nice to have
  - Több nyelv támogatása
  - Hirdetések beépítése
    - In app purchase-szel ezek eltávolíthatók
