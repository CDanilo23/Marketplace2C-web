///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package co.com.uniminuto.view;
//
//import co.com.uniminuto.dto.UsuarioDTO;
//import java.io.Serializable;
//import javax.ejb.EJB;
//import javax.enterprise.context.SessionScoped;
//import javax.faces.application.FacesMessage;
//import javax.faces.bean.ManagedBean;
//import javax.faces.context.FacesContext;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//import co.com.uniminuto.impl.IDatosUsuarioLocal;
//
///**
// *
// * @author cristian.ordonez
// */
//@SessionScoped
//@ManagedBean(name = "ValidadorIngresoController")
//public class ValidadorIngresoController implements Serializable {
//
//    private String usuario;
//    private String contrasenia;
//    private String usuarioEnSesion;
//
//    @EJB(mappedName = "DatosUsuarioServiceBean", lookup = "java:app/Marketplace2C-ejb-1.0-SNAPSHOT/DatosUsuarioService!co.com.uniminuto.ejb.IDatosUsuarioLocal")
//    IDatosUsuarioLocal datosUsuarioEjb;
//
//    public ValidadorIngresoController() {
//    }
//
//    public String validarUsuario() {
//        
//        UsuarioDTO usuarioDto = null;
//        try {
//             usuarioDto = datosUsuarioEjb.obtenerUsuario(this.usuario, this.contrasenia);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        FacesMessage msg = null;
//        String res = null;
//        boolean loggedIn = false;
//
//        if (usuarioDto != null) {
//            HttpServletRequest request = (HttpServletRequest) FacesContext.getCurrentInstance().getExternalContext().getRequest();
//            HttpSession session = request.getSession(true);
//            session.setAttribute("usuario", usuarioDto);
//
//            this.setUsuario(usuarioDto.getUsuNombre());
//
//            loggedIn = true;
//            res = "index";
//
//        }
////        else {
////            loggedIn = false;
////            JsfUtil.addErrorMessage(MessageUtil.getValueLogin("LoginErrorPass"));
////            return null;
////        }
//        return res;
//    }
//
//    public String getUsuario() {
//        return usuario;
//    }
//
//    public void setUsuario(String usuario) {
//        this.usuario = usuario;
//    }
//
//    public String getContrasenia() {
//        return contrasenia;
//    }
//
//    public void setContrasenia(String contrasenia) {
//        this.contrasenia = contrasenia;
//    }
//
//    public String getUsuarioEnSesion() {
//        return usuarioEnSesion;
//    }
//
//    public void setUsuarioEnSesion(String usuarioEnSesion) {
//        this.usuarioEnSesion = usuarioEnSesion;
//    }
//
//}
