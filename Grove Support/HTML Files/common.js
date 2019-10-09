function changeScreenSize() {
    
    if(navigator.onLine){
        document.getElementById("alert").style.display = "none"
        document.getElementById("loading").style.display = "none"
    } else {
        document.getElementById("alert").style.display = "block"
        document.getElementById("loading").style.display = "none"
    }
    
}
function reload() {
    
    window.location.href='reload.html';
    
    }
