using DevExpress.Web;
using DevExpress.XtraPrinting;
using System;
using System.IO;
using System.Net.Mime;
using System.Web;

namespace Statystyki_2018
{
    public partial class kontrolkaExcell : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public wyszukiwarka w1 = new wyszukiwarka();
        public common cm = new common();

        protected void Page_Load(object sender, EventArgs e)
        {
            cm.log.Info("Kontrolka Excell start ");
            try
            {
                using (MemoryStream ms = new MemoryStream())
                {
                    PrintableComponentLink pcl = new PrintableComponentLink(new PrintingSystem());

                    ASPxGridViewExporter export = (ASPxGridViewExporter)Session["exporter"];
                    export.Styles.Header.Wrap = DevExpress.Utils.DefaultBoolean.True;

                    export.FileName = "Kontrolka.xlsx";

                    pcl.Component = export;

                    pcl.Margins.Left = pcl.Margins.Right = 50;

                    pcl.Landscape = true;
                    pcl.CreateDocument(true);
                    pcl.PrintingSystem.Document.AutoFitToPagesWidth = 0;
                    cm.log.Info("Kontrolka Excell start exportu");

                    pcl.ExportToXlsx(ms);
                    WriteResponse(this.Response, ms.ToArray(), System.Net.Mime.DispositionTypeNames.Inline.ToString());
                }
            }
            catch (Exception ex)
            {
                cm.log.Error("kontrolka excell : " + ex.Message);
            }
        }

        protected void WriteResponse(HttpResponse response, byte[] filearray, string type)
        {
            response.ClearContent();
            response.Buffer = true;
            response.Cache.SetCacheability(HttpCacheability.Private);
            response.ContentType = "application/Excell";
            ContentDisposition contentDisposition = new ContentDisposition();
            contentDisposition.FileName = "Kontrolka.xlsx";
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
                cm.log.Error("kontrolka excell : WriteResponse :" + ex.Message);
            }
        }
    }
}