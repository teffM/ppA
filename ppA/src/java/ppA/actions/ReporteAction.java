package ppA.actions;


import static com.opensymphony.xwork2.Action.SUCCESS;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.text.SimpleDateFormat;
import java.sql.Date;
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
import ppA.entity.Clientes;
import ppA.entity.Estados;

/**
 *
 * @author Java
 */
public class ReporteAction extends BaseAction {

   
private List<Estados> listEstados;
private String estado;
private String idCliente;
private Date fecha_inicio;
private Date fecha_fin;
 private List<Clientes> listClientes;

    public String getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(String idCliente) {
        this.idCliente = idCliente;
    }


    public List<Clientes> getListClientes() {
        return listClientes;
    }

    public void setListClientes(List<Clientes> listClientes) {
        this.listClientes = listClientes;
    }


    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }


    public List<Estados> getListEstados() {
        return listEstados;
    }

    public void setListEstados(List<Estados> listEstados) {
        this.listEstados = listEstados;
    }

    public Date getFecha_inicio() {
        return fecha_inicio;
    }

    public void setFecha_inicio(Date fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public Date getFecha_fin() {
        return fecha_fin;
    }

    public void setFecha_fin(Date fecha_fin) {
        this.fecha_fin = fecha_fin;
    }


  
  @Override
    public String execute() throws Exception {
	return list();
    }

    private String list() {
	try {
	     setListEstados(getList(Estados.class));
	     setListClientes(getList(Clientes.class));
             
	} catch (Exception e) {
	    return e(e);
	} finally {
	 
	}
	return SUCCESS;
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
    public String mostrarReporte_estado(){

    String estados=getEstado();
        Connection conexion;
        try {
           
            String connectionUrl = "jdbc:sqlserver://sql5025.myasp.net;databaseName=DB_A106F2_teffff;user=DB_A106F2_teffff_admin;password=pampa123;";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conexion = DriverManager.getConnection(connectionUrl);

        String sb=ServletActionContext.getServletContext().getRealPath("");
      
      JasperReport reporte = (JasperReport)  JRLoader.loadObjectFromFile(getServletContext().getRealPath("/r/reportes/Reporte_estado.jasper"));

      //Cargamos parametros del reporte (si tiene).
        Map parameters = new HashMap();
        parameters.put("estado", estados);

        JasperPrint jasperPrint = JasperFillManager.fillReport(reporte, parameters, conexion);
        
        JasperExportManager.exportReportToPdfFile(jasperPrint,sb+ "/reporte2PDF_2.pdf");

        return "display";
    
        } catch (Exception e) {
            System.out.println("Mensaje de Error:" + e.getMessage());
            e.printStackTrace();
            return "";
        }
    }
    public String mostrarReporte_fecha(){

    
    Date inicio=getFecha_inicio();
    Date fin=getFecha_fin();
  
        
        Connection conexion;
        try {
           
            String connectionUrl = "jdbc:sqlserver://sql5025.myasp.net;databaseName=DB_A106F2_teffff;user=DB_A106F2_teffff_admin;password=pampa123;";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conexion = DriverManager.getConnection(connectionUrl);

        String sb=ServletActionContext.getServletContext().getRealPath("");
      
      JasperReport reporte = (JasperReport)  JRLoader.loadObjectFromFile(getServletContext().getRealPath("/r/reportes/Reporte_fechas.jasper"));

      //Cargamos parametros del reporte (si tiene).
        Map parameters = new HashMap();
        parameters.put("fecha_inicio", inicio);
        parameters.put("fecha_fin", fin);

        JasperPrint jasperPrint = JasperFillManager.fillReport(reporte, parameters, conexion);
        
        JasperExportManager.exportReportToPdfFile(jasperPrint,sb+ "/reporte2PDF_2.pdf");

        return "display";
    
        } catch (Exception e) {
            System.out.println("Mensaje de Error:" + e.getMessage());
            e.printStackTrace();
            return "";
        }
    }
    public String mostrarReporte_cliente(){

    
    String cliente=getIdCliente();
   
  
        
        Connection conexion;
        try {
           
            String connectionUrl = "jdbc:sqlserver://sql5025.myasp.net;databaseName=DB_A106F2_teffff;user=DB_A106F2_teffff_admin;password=pampa123;";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conexion = DriverManager.getConnection(connectionUrl);

        String sb=ServletActionContext.getServletContext().getRealPath("");
      
      JasperReport reporte = (JasperReport)  JRLoader.loadObjectFromFile(getServletContext().getRealPath("/r/reportes/Reporte_cliente.jasper"));

      //Cargamos parametros del reporte (si tiene).
        Map parameters = new HashMap();
        parameters.put("idCliente", cliente);
       

        JasperPrint jasperPrint = JasperFillManager.fillReport(reporte, parameters, conexion);
        
        JasperExportManager.exportReportToPdfFile(jasperPrint,sb+ "/reporte2PDF_2.pdf");

        return "display";
    
        } catch (Exception e) {
            System.out.println("Mensaje de Error:" + e.getMessage());
            e.printStackTrace();
            return "";
        }
    }
    
}
