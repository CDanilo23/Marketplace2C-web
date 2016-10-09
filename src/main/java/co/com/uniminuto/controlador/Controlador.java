/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.uniminuto.controlador;

import co.com.uniminuto.ejb.ArchivoFacadeLocal;
import co.com.uniminuto.ejb.HotelFacadeLocal;
import co.com.uniminuto.ejb.ParqueFacadeLocal;
import co.com.uniminuto.ejb.PlanFacadeLocal;
import co.com.uniminuto.ejb.UsuarioFacadeLocal;
import co.com.uniminuto.entities.Archivo;
import co.com.uniminuto.entities.Hotel;
import co.com.uniminuto.entities.Parque;
import co.com.uniminuto.entities.Plan;
import co.com.uniminuto.entities.Rol;
import co.com.uniminuto.entities.Ubicacion;
import co.com.uniminuto.entities.Usuario;
import co.com.uniminuto.util.ControladorEnvioCorreo;
import co.com.uniminuto.util.ConvertidorBlob;
import co.com.uniminuto.util.EstadoEnum;
import co.com.uniminuto.util.GeneradorMD5;
import co.com.uniminuto.util.RolEnum;
import co.com.uniminuto.util.TipoDocumentoEnum;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigInteger;
import java.security.GeneralSecurityException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author cristian
 */
@MultipartConfig(maxFileSize = 16177215)
public class Controlador extends HttpServlet {

    @EJB
    protected HotelFacadeLocal hotelFacadeLocal;

    @EJB
    protected UsuarioFacadeLocal usuarioFacadeLocal;

    @EJB
    protected ParqueFacadeLocal parqueFacadeLocal;

    @EJB
    protected ArchivoFacadeLocal archivoFacadeLocal;

    @EJB
    protected PlanFacadeLocal planFacadeLocal;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Controlador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //Para controlar peticiones del tipo POST
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Controlador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    //Un metodo que recibe todas las peticiones a si sea GET y POST

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        //La accion se va a guardar en un caja de texto oculto que nos dira que accion
        //debemos hacer
//        response.sendRedirect("configuracion/indexConfig.jsp");
        String accion = request.getParameter("accion");
        Integer idCliente = (Integer) request.getSession().getAttribute("idCliente");
        String envioCorreo = (String) request.getSession().getAttribute("envioCorreo");
        //variables para eliminar plan
        Integer idPlan = (Integer) request.getSession().getAttribute("idPlan");
        String eliminarPlan = (String) request.getSession().getAttribute("eliminarPlan");
        //variables para eliminar proveedor
        Integer idProveedor = (Integer) request.getSession().getAttribute("idProveedor");
        if (idPlan != null && eliminarPlan != null) {
            this.eliminarPlan(idPlan, request, response);
        }
        if (idProveedor != null) {
            this.eliminarProveedor(idProveedor, request, response);
        }
        if (envioCorreo != null && envioCorreo.equals("envioCorreo")) {
            this.registroParcialCliente(idCliente, request, response);
        }
        if (accion.equals("registro")) {
            this.registroCliente(request, response);
        }
        if (accion.equals("login")) {
            this.login(request, response);
        }
        if (accion.equals("CrearParque")) {
            this.crearParque(request, response);
        }
        if (accion.equals("ModificarParque")) {
            this.modificarParque(request, response);
        }
        if (accion.equals("CrearHotel")) {
            this.crearHotel(request, response);
        }
        if (accion.equals("ModificarHotel")) {
            this.modificarHotel(request, response);
        }
        if (accion.equals("CrearProveedor")) {
            this.crearProveedor(request, response);
        }
        if (accion.equals("ModificarProveedor")) {
            this.modificarProveedor(request, response);
        }

//        else if (accion.equals("CrearPaquete")) {
//            this.crearPaquete(request, response);
//        }
        if (accion.endsWith("CrearPlan")) {
            this.crearPlan(request, response);
        }
        if (accion.equals("ModificarPlan")) {
            this.modificarPlan(request, response);
        }
    }

    public void login(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<Usuario> listUser = usuarioFacadeLocal.findUserByIdAndPass(request.getParameter("user"), request.getParameter("password"));
        if (listUser != null && !listUser.isEmpty()) {
            response.sendRedirect("configuracion/indexConfig.jsp");
        } else {
            request.getSession().setAttribute("ex", new Exception("El usuario no existe en el sistema"));
            response.sendRedirect("login.jsp");
        }
    }

    public void modificarParque(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().removeAttribute("parque");
        Parque parque = new Parque();
        parque.setIdParque(Integer.valueOf(request.getParameter("idParque")));
        parque.setParque(request.getParameter("nombreParque"));
        Ubicacion ubicacion = new Ubicacion();
        ubicacion.setCiudad(request.getParameter("ciudadParque"));
        ubicacion.setPais(request.getParameter("paisParque"));
//        parque.setImg(request.getParameter("img"));
        parqueFacadeLocal.edit(parque);
        response.sendRedirect("configuracion/parque/ConfiguracionParques.jsp");
    }
//    

    public void crearParque(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Parque parque = new Parque();
        parque.setParque(request.getParameter("nombreParque"));
        Ubicacion ubicacion = new Ubicacion();
        ubicacion.setIdUbicacion(Integer.valueOf(request.getParameter("idUbicacion")));
        parque.setIdUbicacion(ubicacion);
//        parque.setImg(request.getParameter("imagenParque"));
        parqueFacadeLocal.create(parque);
        response.sendRedirect("configuracion/parque/ConfiguracionParques.jsp");
    }

    public void crearHotel(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception {
        Hotel hotel = new Hotel();
        hotel.setNombre(request.getParameter("nombreHotel"));
        hotel.setNivel(Integer.valueOf(request.getParameter("nivelHotel")));
        hotel.setDireccion(request.getParameter("direccion"));
        hotel.setIdUbicacion(new Ubicacion(Integer.valueOf(request.getParameter("idUbicacion"))));
        hotelFacadeLocal.create(hotel);
        response.sendRedirect("configuracion/hotel/ConfiguracionHoteles.jsp");
    }

    public void modificarHotel(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception {
        Hotel hotel = hotelFacadeLocal.find(((Hotel) request.getAttribute("hotel")).getIdHotel());
        request.getSession().removeAttribute("hotel");
        hotel.setNombre(request.getParameter("nombre"));
        hotel.setNivel(Integer.valueOf(request.getParameter("nivel")));
        hotel.setDireccion(request.getParameter("direccion"));
        hotelFacadeLocal.edit(hotel);
        response.sendRedirect("configuracion/hotel/ConfiguracionHoteles.jsp");
    }

    public void modificarPlan(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Plan plan = planFacadeLocal.find(Integer.valueOf(request.getParameter("idPlan")));
        request.getSession().removeAttribute("plan");
        plan.setNombrePlan(request.getParameter("nombre"));
        plan.setCosto(Integer.valueOf(request.getParameter("costo")));
        plan.setDescripcion(request.getParameter("descripcion"));
        plan.setDias(Integer.valueOf(request.getParameter("dias")));
        plan.setNoches(Integer.valueOf(request.getParameter("noches")));
        Parque parque = new Parque();
        parque.setIdParque(Integer.valueOf(request.getParameter("idParque")));
        plan.setIdParque(parque);
        Hotel hotel = new Hotel();
        hotel.setIdHotel(Integer.valueOf(request.getParameter("idHotel")));
        plan.setIdHotel(hotel);
        planFacadeLocal.merge(plan);
        response.sendRedirect("configuracion/plan/configuracionPlanes.jsp");
    }

    public void crearPlan(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        Plan plan = new Plan();
        plan.setNombrePlan(request.getParameter("nombre"));
        plan.setCosto(Integer.valueOf(request.getParameter("costo")));
        plan.setDescripcion(request.getParameter("descripcion"));
        plan.setDias(Integer.valueOf(request.getParameter("dias")));
        plan.setNoches(Integer.valueOf(request.getParameter("noches")));
        Parque parque = new Parque();
        parque.setIdParque(Integer.valueOf(request.getParameter("idParque")));
        plan.setIdParque(parque);
        Hotel hotel = new Hotel();
        hotel.setIdHotel(Integer.valueOf(request.getParameter("idHotel")));
        plan.setIdHotel(hotel);
        plan = planFacadeLocal.merge(plan);
        InputStream inputStream = null;
        Part filePart = request.getPart("photo");
        if (filePart != null) {
            inputStream = filePart.getInputStream();
        }
        Archivo archivo = null;
        if (inputStream != null) {
            archivo = new Archivo();
            archivo.setNombre(filePart.getSubmittedFileName());
            archivo.setImg(ConvertidorBlob.convertirInputStreamAByte(inputStream));
            archivo.setIdPlan(plan);
        }
        archivoFacadeLocal.create(archivo);

        response.sendRedirect("configuracion/plan/configuracionPlanes.jsp");
    }

    public void eliminarPlan(Integer id, HttpServletRequest request, HttpServletResponse response) throws IOException {
        Plan plan = planFacadeLocal.find(id);
        planFacadeLocal.remove(plan);
        request.getSession().removeAttribute("idPlan");
        request.getSession().removeAttribute("eliminarPlan");
        response.sendRedirect("configuracion/plan/configuracionPlanes.jsp");
    }

    public void crearProveedor(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Usuario usuProve = new Usuario();
        usuProve.setUsuario(request.getParameter("usuario"));
        usuProve.setEmpresa(request.getParameter("empresa"));
        usuProve.setNombre(request.getParameter("nombreProveedor"));
        usuProve.setContrasena(request.getParameter("password"));
        usuProve.setTipoDocumento(Integer.valueOf(request.getParameter("tipoDocumento")));
        usuProve.setNumeroDocumento(Integer.valueOf(request.getParameter("numDocumento")));
        usuProve.setDireccion(request.getParameter("direccion"));
        usuProve.setTelefono(request.getParameter("telefono"));
        usuProve.setCorreo(request.getParameter("correo"));
        usuProve.setRol(new Rol(RolEnum.PROVEEDOR.getValor()));
        usuProve.setEstado(EstadoEnum.ACTIVO.getValor());
        usuarioFacadeLocal.create(usuProve);
        response.sendRedirect("configuracion/proveedor/configuracionProveedores.jsp");
    }

    public void modificarProveedor(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Usuario usuaProvee = usuarioFacadeLocal.find(((Usuario) request.getSession().getAttribute("proveedor")).getIdUsuario());
        request.getSession().removeAttribute("proveedor");
        usuaProvee.setUsuario(request.getParameter("usuario"));
        usuaProvee.setEmpresa(request.getParameter("empresa"));
        usuaProvee.setNombre(request.getParameter("nombre"));
        usuaProvee.setTipoDocumento(Integer.valueOf(request.getParameter("tipoDocumento")));
        usuaProvee.setNumeroDocumento(Integer.valueOf(request.getParameter("numDocumento")));
        usuaProvee.setDireccion(request.getParameter("direccion"));
        usuaProvee.setTelefono(request.getParameter("telefono"));
        usuaProvee.setCorreo(request.getParameter("correo"));
        usuarioFacadeLocal.edit(usuaProvee);
        response.sendRedirect("configuracion/proveedor/configuracionProveedores.jsp");
    }

    private void eliminarProveedor(Integer idProveedor, HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.removeAttribute("idProveedor");
        Usuario usuario = usuarioFacadeLocal.find(idProveedor);
        usuarioFacadeLocal.remove(usuario);

        response.sendRedirect("configuracion/proveedor/configuracionProveedores.jsp");
    }

//    private void crearPaquete(HttpServletRequest request, HttpServletResponse response) {
//        Plan plan =new  Plan();
//        Parque parque = new Parque();
//        Proveedor proveedor = new Proveedor();
//        Hotel hotel = new Hotel();
//        hotel.setIdHotel(Integer.valueOf(request.getParameter("Hotel")));
//        parque.setIdParque(Integer.valueOf(request.getParameter("Parque")));
//        proveedor.setIdProveedor(Integer.valueOf(request.getParameter("Proveedor")));
//        PlanDAO planDAO = new PlanDAO();
//                plan.setNombrePlan(request.getParameter("NombrePaquete"));
//                plan.setDescripcion(request.getParameter("Descripcion"));
//                plan.setHotel(hotel); 
//                plan.setParque(parque);
//                plan.setProveedor(proveedor);
//                plan.setCosto(Integer.valueOf(request.getParameter("Costo")));
//                plan.setNoches(Integer.valueOf(request.getParameter("Noche")));
//                plan.setDias(Integer.valueOf(request.getParameter("Noche"))+1);
//                plan.setDescuento(Integer.valueOf(request.getParameter("Descuento")));
//                
    //planDAO.agregar();
//    }
    public void aceptarCliente(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception {
        Usuario usuario = usuarioFacadeLocal.find(request.getSession().getAttribute("idCliente"));
        request.getSession().removeAttribute("idCliente");
        usuario.setEstado(EstadoEnum.ACTIVO.getValor());
        usuarioFacadeLocal.edit(usuario);
        ControladorEnvioCorreo.envioCorreo(usuario);
        response.sendRedirect("configuracion/cliente/configuracionClientes.jsp");
    }

    private void registroCliente(HttpServletRequest request, HttpServletResponse response) {
        String usu = request.getParameter("usuario");
        String nom = request.getParameter("nombre");
        String ced = request.getParameter("cedula");
        String correo = request.getParameter("correo");
        if (usuarioFacadeLocal.findUserByUserAndName(usu, nom).isEmpty()) {
            Usuario user = new Usuario();
            user.setNombre(nom);
            user.setUsuario(usu);
            user.setNumeroDocumento(Integer.valueOf(ced));
            user.setContrasena(GeneradorMD5.getRandomPass());
            user.setCorreo(correo);
            user.setTipoDocumento(TipoDocumentoEnum.CEDULA.getValor());
            Rol rol = new Rol(RolEnum.CLIENTE.getValor());
            user.setRol(rol);
            user.setEstado(EstadoEnum.INACTIVO.getValor());
            usuarioFacadeLocal.create(user);
            try {
                request.getSession().setAttribute("ex", new Exception("El usuario fue registrado exitosamente. En unos momentos llegara a su correo las credenciales de ingreso.", new Throwable("Info")));
                response.sendRedirect("registro/register.jsp");
            } catch (IOException ex) {
                Logger.getLogger(Controlador.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            request.getSession().setAttribute("ex", new Exception("El usuario ya existe en el sistema."));
            try {
                response.sendRedirect("registro/register.jsp");
            } catch (IOException ex) {
                Logger.getLogger(Controlador.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    private void registroParcialCliente(Integer idCliente, HttpServletRequest request, HttpServletResponse response) throws IOException, GeneralSecurityException {
        Usuario usuario = usuarioFacadeLocal.find(idCliente);
        ControladorEnvioCorreo.envioCorreo(usuario);
        usuario.setEstado(EstadoEnum.ACTIVO.getValor());
        usuarioFacadeLocal.edit(usuario);
        request.getSession().removeAttribute("idCliente");
        request.getSession().removeAttribute("envioCorreo");
        response.sendRedirect("configuracion/cliente/configuracionClientes.jsp");
    }
}
