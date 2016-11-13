package ppA.actions;


import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.view.JasperViewer;
import org.apache.struts2.ServletActionContext;
import static org.apache.struts2.ServletActionContext.getServletContext;
import ppA.entity.Abonos;
import ppA.entity.Clientes;
import ppA.entity.Reservaciones;
import ppA.entity.Usuarios;

/**
 *
 * @author Java
 */
public class ReporteAction extends BaseAction {

    private Abonos a;
    private List<Abonos> listAbonos;
    private List<Reservaciones> listReservaciones;
    private List<Clientes> listClientes;

    @Override
    public String execute() throws Exception {
	return list();
    }

    private String list() {
	try {
	    setListAbonos(getList(Abonos.class));
	    setListReservaciones(getList(Reservaciones.class));
	    setListClientes(getList(Clientes.class));
	} catch (Exception e) {
	    return e(e);
	} finally {
	    setA(new Abonos());
	}
	return SUCCESS;
    }

    public String guardar() throws Exception {
	try {
	    getA().setUsuarios(new Usuarios());
	    getA().getUsuarios().setId(Integer.parseInt(getSession().get("userId").toString()));
	    save(getA());
	    setMsg(getText("msg.guardadoExito"));
	} catch (Exception e) {
	    return e(e);
	}
	return list();
    }

    public String eliminar() throws Exception {
	try {
	    delete(Abonos.class);
	    setMsg(getText("msg.eliminadoExito"));
	} catch (Exception e) {
	    return e(e);
	}
	return list();
    }

    /**
     * @return the listClientes
     */
    public List<Clientes> getListClientes() {
	return listClientes;
    }

    /**
     * @param listClientes the listClientes to set
     */
    public void setListClientes(List<Clientes> listClientes) {
	this.listClientes = listClientes;
    }

    /**
     * @return the a
     */
    public Abonos getA() {
	return a;
    }

    /**
     * @param a the a to set
     */
    public void setA(Abonos a) {
	this.a = a;
    }

    /**
     * @return the listAbonos
     */
    public List<Abonos> getListAbonos() {
	return listAbonos;
    }

    /**
     * @param listAbonos the listAbonos to set
     */
    public void setListAbonos(List<Abonos> listAbonos) {
	this.listAbonos = listAbonos;
    }

    /**
     * @return the listReservaciones
     */
    public List<Reservaciones> getListReservaciones() {
	return listReservaciones;
    }

    /**
     * @param listReservaciones the listReservaciones to set
     */
    public void setListReservaciones(List<Reservaciones> listReservaciones) {
	this.listReservaciones = listReservaciones;
    }
    
    public String mostrarReporte(){


        Connection conexion;
        try {
           
            String connectionUrl = "jdbc:sqlserver://sql5025.myasp.net;databaseName=DB_A106F2_teffff;user=DB_A106F2_teffff_admin;password=pampa123;";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conexion = DriverManager.getConnection(connectionUrl);

        String sb=ServletActionContext.getServletContext().getRealPath("");
      
      JasperReport reporte = (JasperReport)  JRLoader.loadObjectFromFile(getServletContext().getRealPath("/r/reportes/ReporteWeb.jasper"));

        JasperPrint jasperPrint = JasperFillManager.fillReport(reporte, null, conexion);
        
        JasperExportManager.exportReportToPdfFile(jasperPrint,sb+ "/reporte2PDF_2.pdf");

        return "display";
    
        } catch (Exception e) {
            System.out.println("Mensaje de Error:" + e.getMessage());
            e.printStackTrace();
            return "";
        }
    }
    
}
