/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function validateEmail(email) {
    var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    var errorMessages = new Array();
    if (email == null || email == "")
        errorMessages.push('El email no puede estar vacío');
    else if (email.length > 64)
        errorMessages.push('El email no puede tener más de 64 caracteres');
    else if (!emailPattern.test(email))
        errorMessages.push('El email introducido no es correcto');
    return errorMessages;
}