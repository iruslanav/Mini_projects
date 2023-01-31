<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Generador de laberintos</title>
    <style>
      /* Estilos CSS aquí */
      .labyrinth {
        display: grid;
        grid-template-columns: repeat(10, 1fr);
        grid-template-rows: repeat(10, 1fr);
        width: 500px;
        height: 500px;
        margin: 0 auto;
      }
      .cell {
        background-color: rgb(249, 7, 7);
        border: 1px solid #333;
      }
      .white {
        background-color: white;
      }
    </style>
  </head>
  <body>
    <h1>Generador de laberintos</h1>
    <button id="generateBtn">Generar laberinto</button>
    <div class="labyrinth">
      <!-- Celdas del laberinto aquí -->
    </div>
    <script>
      // Tu código JavaScript aquí
      var labyrinthEl = document.querySelector(".labyrinth");
      var generateBtnEl = document.querySelector("#generateBtn");
      generateBtnEl.addEventListener("click", function() {
    // Generar un nuevo laberinto aquí
    labyrinthEl.innerHTML = ""; // Limpiar el laberinto anterior
    for (var row = 0; row < 10; row++) {
      for (var col = 0; col < 10; col++) {
        var cellEl = document.createElement("div");
        cellEl.classList.add("cell");
        cellEl.addEventListener("click", function() {
          if (this.style.backgroundColor === "rgb(249, 7, 7)") {
            this.style.backgroundColor = "white";
          } else if (this.style.backgroundColor === "white") {
            this.style.backgroundColor = "green";
          } else {
            this.style.backgroundColor = "rgb(249, 7, 7)";
          }
        });
        labyrinthEl.appendChild(cellEl);
      }
    }
  });
</script>
</body>
</html>
