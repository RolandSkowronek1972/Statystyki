using DevExpress.Web;
using DevExpress.XtraPrinting;
using System;
using System.IO;
using System.Net.Mime;
using System.Web;

namespace Statystyki_2018
{
    public partial class kontrolkaDruk : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public wyszukiwarka w1 = new wyszukiwarka();
        public common cm = new common();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                using (MemoryStream ms = new MemoryStream())
                {
                    PrintableComponentLink pcl = new PrintableComponentLink(new PrintingSystem());

                    ASPxGridViewExporter export = (ASPxGridViewExporter)Session["exporter"];
                    export.Styles.Header.Wrap = DevExpress.Utils.DefaultBoolean.True;
                    export.MaxColumnWidth = 180;
                    pcl.Component = export;
                    pcl.Margins.Left = pcl.Margins.Right = 10;

                    pcl.Landscape = true;
                    pcl.CreateDocument(false);
                    pcl.PrintingSystem.Document.AutoFitToPagesWidth = 0;
                    
                    pcl.ExportToPdf(ms);
                    WriteResponse(this.Response, ms.ToArray(), System.Net.Mime.DispositionTypeNames.Inline.ToString());
                }
            }
            catch (Exception ex)
            {
                cm.log.Error("Kontrolka : generowanie pdf :" + ex.Message);
            }
        }

        protected  void WriteResponse(HttpResponse response, byte[] filearray, string type)
        {
            response.ClearContent();
            response.Buffer = true;
            response.Cache.SetCacheability(HttpCacheability.Private);
            response.ContentType = "application/pdf";
            ContentDisposition contentDisposition = new ContentDisposition();
            contentDisposition.FileName = "Kontrolka.pdf";
            contentDisposition.DispositionType = type;
            response.AddHeader("Content-Disposition", contentDisposition.ToString());
            response.BinaryWrite(filearray);
            HttpContext.Current.ApplicationInstance.CompleteRequest();
            try
            {
                response.End();
            }
            catch (System.Threading.ThreadAbortException ex)

            {
                cm.log.Error("Kontrolka : generowanie pdf :WriteResponse :" + ex.Message);
            }
        }
    }
}