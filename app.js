const hamburger = document.querySelector('.header .nav-bar .nav-list .hamburger');
const mobile_menu = document.querySelector('.header .nav-bar .nav-list ul');
const menu_item = document.querySelectorAll('.header .nav-bar .nav-list ul li a');
const header = document.querySelector('.header.container');

hamburger.addEventListener('click', () => {
	hamburger.classList.toggle('active');
	mobile_menu.classList.toggle('active');
});

document.addEventListener('scroll', () => {
	var scroll_position = window.scrollY;
	if (scroll_position > 250) {
		header.style.backgroundColor = '#29323c';
	} else {
		header.style.backgroundColor = 'transparent';
	}
});

menu_item.forEach((item) => {
	item.addEventListener('click', () => {
		hamburger.classList.toggle('active');
		mobile_menu.classList.toggle('active');
	});
});

// Función para detectar si el usuario está en un dispositivo móvil
function esDispositivoMovil() {
  return /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
}

// Función para manejar el clic en el botón de teléfono
function manejarClicTelefono() {
// Mostrar un mensaje de confirmación y hacer la llamada
window.open("tel:+8120242628", "_self");
}

// Función para manejar el clic en el botón de correo
function manejarClicCorreo() {
// Mostrar un cuadro de diálogo para que el usuario escriba el correo y luego enviarlo
var correoDestino = 'healtwatch@gmail.com';
window.open('mailto:' + correoDestino, '_self');
}

// Función para manejar el clic en el botón de mapa
function manejarClicMapa() {
  // Abrir Google Maps en una nueva pestaña
  window.open("https://www.google.com/maps/place/Av Eloy Cavazos 2001, Tolteca, 67170 Guadalupe, N.L.");
}

// Asignar los manejadores de eventos a los botones correspondientes
document.getElementById("boton-telefono").addEventListener("click", function() {
    manejarClicTelefono();
});

document.getElementById("boton-correo").addEventListener("click", function() {
    manejarClicCorreo();
});

document.getElementById("boton-mapa").addEventListener("click", manejarClicMapa);

