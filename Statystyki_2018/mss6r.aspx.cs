/*
Last Update:
    - version 1.211011

*/

using System;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text;

namespace Statystyki_2018
{
    public partial class mss6r : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public mss ms = new mss();
        public common cm = new common();
        public datyDoMSS datyMSS = new datyDoMSS();
        public static string tenPlik = "mss6r.aspx";

        protected void Page_Load(object sender, EventArgs e)
        {
            cm.log.Info("otwarcie formularza: " + tenPlik);
             string idWydzial = Request.QueryString["w"]; Session["czesc"] = cm.nazwaFormularza(tenPlik, idWydzial) ;
            if (idWydzial != null)
            {
                Session["id_dzialu"] = idWydzial;
                cm.log.Info(tenPlik + ": id wydzialu=" + idWydzial);
            }
            else
            {
                Server.Transfer("default.aspx");
                return;
            }
            CultureInfo newCulture = (CultureInfo)CultureInfo.CurrentCulture.Clone();
            newCulture.DateTimeFormat = CultureInfo.GetCultureInfo("PL").DateTimeFormat;
            System.Threading.Thread.CurrentThread.CurrentCulture = newCulture;
            System.Threading.Thread.CurrentThread.CurrentUICulture = newCulture;
            if (Session["ustawDate6r"] == null)
            {
                Date1.Date = DateTime.Parse(datyMSS.DataPoczatkowa());
                Date2.Date = DateTime.Parse(datyMSS.DataKoncowa());
                Session["ustawDate6r"] = "X";
            }
            Session["data_1"] = datyMSS.DataPoczatkowa();
            Session["data_2"] = datyMSS.DataKoncowa();
            if (!IsPostBack)
            {
                try
                {
                    string ccc = (string)Session["user_id"];
                    // file read with version
                    var fileContents = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt"));
                    this.Title = "Statystyki " + fileContents.ToString().Trim();
                }
                catch
                {
                    Server.Transfer("default.aspx");
                }
            }
            if (Date1.Text.Length == 0) Date1.Date = DateTime.Parse(datyMSS.DataPoczatkowa());
            if (Date2.Text.Length == 0) Date2.Date = DateTime.Parse(datyMSS.DataKoncowa());

            rysuj();
            makeLabels();
        }// end of Page_Load

        protected void rysuj()
        {
            string yyx = (string)Session["id_dzialu"];
            int idWydzialuNumerycznie = int.Parse((string)Session["id_dzialu"]);
            string txt = string.Empty;

            try
            {
                string idTabeli = string.Empty;
                string idWiersza = string.Empty;
                string idWydzial = (string)Session["id_dzialu"];
                DataTable tabela2 = ms.PustaTabelaDanychMSS();
                //wypełnianie lebeli
                string path = Server.MapPath("XMLHeaders") + "\\" + "MSS6r.xml";
                string[] numeryTabel00 = new string[] { "1.1" };
                string[] numeryTabel00_w = new string[] { "1.1.c", "1.1.d", "1.1.e", "1.1.1", "1.1.1.a" };
                string[] numeryTabel01 = new string[] { "1.1.g", "1.1.2", "1.2", "1.3", "1.3.a" };
                string[] numeryTabel02 = new string[] {  "2.1", "2.2", "2.3.a", "2.3.b", "2.3.c", "2.4", "2.5", "2.5.a", "3.1", "3.2", "3.3", "3.4", "4", "4a" };
                string[] numeryTabel03 = new string[] { "5", "6" };
                string[] numeryTabel04 = new string[] { "7.1" , "7.2"};
                string[] numeryTabel05 = new string[] { };
                string[] numeryTabel06 = new string[] { };
                string[] numeryTabel07 = new string[] { };
                string[] numeryTabel08 = new string[] { };
                string[] numeryTabel09 = new string[] { };
                string[] numeryTabel10 = new string[] { };
                string[] numeryTabel11 = new string[] { };
                PlaceHolder1_waski.Controls.Clear();
                tablePlaceHolder0.Controls.Clear();
                tablePlaceHolder01.Controls.Clear();
                tablePlaceHolder02.Controls.Clear();
                tablePlaceHolder03.Controls.Clear();
                tablePlaceHolder04.Controls.Clear();

                tablePlaceHolder06.Controls.Clear();
                tablePlaceHolder07.Controls.Clear();
                tablePlaceHolder08.Controls.Clear();
                tablePlaceHolder09.Controls.Clear();
                tablePlaceHolder10.Controls.Clear();
                tablePlaceHolder11.Controls.Clear();
               
                ms.TworzTabelizListy(numeryTabel00, tablePlaceHolder0, path, tabela2, idWydzialuNumerycznie, tenPlik);
                ms.TworzTabelizListy(numeryTabel00_w, PlaceHolder1_waski, path, tabela2, idWydzialuNumerycznie, tenPlik);
                ms.TworzTabelizListy(numeryTabel01, tablePlaceHolder01, path, tabela2, idWydzialuNumerycznie, tenPlik);
                ms.TworzTabelizListy(numeryTabel02, tablePlaceHolder02, path, tabela2, idWydzialuNumerycznie, tenPlik);
                ms.TworzTabelizListy(numeryTabel03, tablePlaceHolder03, path, tabela2, idWydzialuNumerycznie, tenPlik);
                ms.TworzTabelizListy(numeryTabel04, tablePlaceHolder04, path, tabela2, idWydzialuNumerycznie, tenPlik);
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " bład generowania tabel : " + ex.Message);
            }

            // dopasowanie opisów
            makeLabels();

            try
            {
                Label11.Visible = cl.debug(int.Parse(yyx));
            }
            catch
            {
                Label11.Visible = false;
            }
            Label11.Text = txt;
        }

        protected void odswiez()
        {
            string yyx = (string)Session["id_dzialu"];
            int idWydzialuNumerycznie = int.Parse((string)Session["id_dzialu"]);
            string txt = string.Empty;

            try
            {
                string idTabeli = string.Empty;
                string idWiersza = string.Empty;
                string idWydzial = (string)Session["id_dzialu"];
                Session["data_1"] = Date1.Date.ToShortDateString();
                Session["data_2"] = Date2.Date.ToShortDateString();
                DataTable tabela2 = ms.generuj_dane_do_tabeli_mss2(int.Parse((string)Session["id_dzialu"]), Date1.Date, Date2.Date, 21);
                //wypełnianie lebeli
                string path = Server.MapPath("XMLHeaders") + "\\" + "MSS6r.xml";
              

                /*  tablePlaceHolder0.Controls.Clear();
                  tablePlaceHolder01.Controls.Clear();
                  tablePlaceHolder02.Controls.Clear();
                  tablePlaceHolder03.Controls.Clear();
                  tablePlaceHolder04.Controls.Clear();

                  tablePlaceHolder06.Controls.Clear();
                  tablePlaceHolder07.Controls.Clear();
                  tablePlaceHolder08.Controls.Clear();
                  tablePlaceHolder09.Controls.Clear();
                  tablePlaceHolder10.Controls.Clear();
                  tablePlaceHolder11.Controls.Clear();
                  //  tablePlaceHolder12.Controls.Clear();
                  ms.TworzTabelizListy(numeryTabel00, tablePlaceHolder0, path, tabela2, idWydzialuNumerycznie, tenPlik);*/


            
   
                    //wypełnianie lebeli
                
                    string[] numeryTabel00 = new string[] { "1.1" };
                    string[] numeryTabel00_w = new string[] { "1.1.c", "1.1.d", "1.1.e", "1.1.1", "1.1.1.a" };
                    string[] numeryTabel01 = new string[] { "1.1.g", "1.1.2", "1.2", "1.3" };
                    string[] numeryTabel02 = new string[] { "1.3.a", "2.1", "2.2", "2.3.a", "2.3.b", "2.3.c", "2.4", "2.5", "2.5.a", "3.1", "3.2", "3.3", "3.4", "4", "4a" };
                    string[] numeryTabel03 = new string[] { "5", "6" };
                    string[] numeryTabel04 = new string[] { "7.1", "7.2" };
                    string[] numeryTabel05 = new string[] { };
                    string[] numeryTabel06 = new string[] { };
                    string[] numeryTabel07 = new string[] { };
                    string[] numeryTabel08 = new string[] { };
                    string[] numeryTabel09 = new string[] { };
                    string[] numeryTabel10 = new string[] { };
                    string[] numeryTabel11 = new string[] { };
                    PlaceHolder1_waski.Controls.Clear();
                    tablePlaceHolder0.Controls.Clear();
                    tablePlaceHolder01.Controls.Clear();
                    tablePlaceHolder02.Controls.Clear();
                    tablePlaceHolder03.Controls.Clear();
                    tablePlaceHolder04.Controls.Clear();

                    tablePlaceHolder06.Controls.Clear();
                    tablePlaceHolder07.Controls.Clear();
                    tablePlaceHolder08.Controls.Clear();
                    tablePlaceHolder09.Controls.Clear();
                    tablePlaceHolder10.Controls.Clear();
                    tablePlaceHolder11.Controls.Clear();

                    ms.TworzTabelizListy(numeryTabel00, tablePlaceHolder0, path, tabela2, idWydzialuNumerycznie, tenPlik);
                    ms.TworzTabelizListy(numeryTabel00_w, PlaceHolder1_waski, path, tabela2, idWydzialuNumerycznie, tenPlik);
                    ms.TworzTabelizListy(numeryTabel01, tablePlaceHolder01, path, tabela2, idWydzialuNumerycznie, tenPlik);
                    ms.TworzTabelizListy(numeryTabel02, tablePlaceHolder02, path, tabela2, idWydzialuNumerycznie, tenPlik);
                    ms.TworzTabelizListy(numeryTabel03, tablePlaceHolder03, path, tabela2, idWydzialuNumerycznie, tenPlik);
                    ms.TworzTabelizListy(numeryTabel04, tablePlaceHolder04, path, tabela2, idWydzialuNumerycznie, tenPlik);
              

            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " bład generowania tabel : " + ex.Message);
            }

            // dopasowanie opisów
            makeLabels();

            try
            {
                Label11.Visible = cl.debug(int.Parse(yyx));
            }
            catch
            {
                Label11.Visible = false;
            }
            Label11.Text = txt;
        }

        protected void makeLabels()
        {
            try
            {
                string User_id = string.Empty;
                string domain = string.Empty;
                try
                {
                    User_id = (string)Session["user_id"];
                    domain = (string)Session["damain"];
                }
                catch
                { }

                Label28.Text = cl.podajUzytkownika(User_id, domain);
                Label29.Text = DateTime.Now.ToLongDateString();
                try
                {
                    Label30.Text = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt")).ToString().Trim();
                }
                catch
                { }
                string strMonthName = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(Date2.Date.Month);
                int last_day = DateTime.DaysInMonth(Date2.Date.Year, Date2.Date.Month);
            }
            catch
            {
            }
        }

        protected void LinkButton54_Click(object sender, EventArgs e)
        {
            odswiez();
        }

        private string wyciagnijWartosc(DataTable ddT, string selectString)
        {
            string result = "0";
            try
            {
                DataRow[] foundRows;
                foundRows = ddT.Select(selectString);
                DataRow dr = foundRows[0];
                result = dr[4].ToString();
            }
            catch

            { }
            return result;
        }
        protected void TimerTick(object sender, EventArgs e)
        {
            Timer1.Enabled = false;
            imgLoader.Visible = false;
        }

        protected void makeCSVFile(object sender, EventArgs e)
        {
            //tworzenie pliku csv
            try
            {
                string idSadu = idSad.Text.Trim();
                string idWydzialu = (string)Session["id_dzialu"];
                try
                {
                    int idWydzialN = int.Parse(idWydzialu);
                    idWydzialu = idWydzialN.ToString("D2");
                }
                catch (Exception)
                {
                    idWydzialu = string.Empty;
                }
                if (!string.IsNullOrEmpty(idWydzialu))
                {
                    DataTable tabela2 = ms.generuj_dane_do_tabeli_mss2(int.Parse((string)Session["id_dzialu"]), Date1.Date, Date2.Date, 21);

                    var distinctRows = (from DataRow dRow in tabela2.Rows select dRow["idTabeli"]).Distinct(); //lista tabelek
                    DataTable listaTabelek = new DataTable();
                    listaTabelek.Columns.Add("tabela", typeof(string));
                    DataRow rowik = listaTabelek.NewRow();

                    foreach (var tabela in distinctRows)
                    {
                        rowik = listaTabelek.NewRow();
                        rowik[0] = tabela.ToString().Trim();
                        listaTabelek.Rows.Add(rowik);
                    }
                    var output = new StringBuilder();

                    output = ms.raportTXT(listaTabelek, tabela2, idRaportu.Text.Trim(), idSad.Text);

                    Response.Clear();
                    Response.Buffer = true;
                    Response.ContentType = "application/text";
                    Response.AddHeader("Content-Disposition", "attachment;filename=" + idRaportu.Text.Trim() + ".csv");
                    Response.Output.Write(output);

                    Response.Flush();
                    Response.End();
                }
            }
            catch

            {
            }
        }
    }
}