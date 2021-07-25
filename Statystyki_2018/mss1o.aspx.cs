using System;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;

namespace Statystyki_2018
{
    public partial class mss1o : System.Web.UI.Page
    {
        public static string tenPlik = "mss1o.aspx";
        public Class1 cl = new Class1();
        public mss ms = new mss();
        public common cm = new common();
        public datyDoMSS datyMSS = new datyDoMSS();
        public dataReaders dr = new dataReaders();

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial = Request.QueryString["w"];
            if (idWydzial != null)
            {
                Session["id_dzialu"] = idWydzial;
                //cm.log.Info(tenPlik + ": id wydzialu=" + idWydzial);
            }
            else
            {
                Server.Transfer("default.aspx");
                return;
            }
            if (!IsPostBack)
            {
                //cm.log.Debug("otwarcie formularza: " + tenPlik);
                try
                {
                    // file read with version
                    var fileContents = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt"));
                    this.Title = "Statystyki " + fileContents.ToString().Trim();
                }
                catch
                {
                    Server.Transfer("default.aspx");
                }
                rysuj(ms.PustaTabelaDanychMSS());
            }
            CultureInfo newCulture = (CultureInfo)CultureInfo.CurrentCulture.Clone();
            newCulture.DateTimeFormat = CultureInfo.GetCultureInfo("PL").DateTimeFormat;
            System.Threading.Thread.CurrentThread.CurrentCulture = newCulture;
            System.Threading.Thread.CurrentThread.CurrentUICulture = newCulture;
            if (Session["ustawDate1o"] == null)
            {
                Date1.Date = DateTime.Parse(datyMSS.DataPoczatkowa());
                Date2.Date = DateTime.Parse(datyMSS.DataKoncowa());
                Session["ustawDate1o"] = "X";
            }
            if (Date1.Text.Length == 0) Date1.Date = DateTime.Parse(datyMSS.DataPoczatkowa());
            if (Date2.Text.Length == 0) Date2.Date = DateTime.Parse(datyMSS.DataKoncowa());

            Session["data_1"] = Date1.Date.ToShortDateString();
            Session["data_2"] = Date2.Date.ToShortDateString();
           
        }// end of Page_Load

        protected void rysuj(DataTable tabela2)
        {
            string idWydzialu = "'" + (string)Session["id_dzialu"] + "'";
            //id_dzialu.Text = (string)Session["txt_dzialu"];

            try
            {
                string idTabeli = string.Empty;
                string idWiersza = string.Empty;
                tablePlaceHolder.Dispose();
                TablePlaceHolder2.Dispose();
               
                TablePlaceHolder4.Dispose();
                TablePlaceHolder5.Dispose();

                PlaceHolder1f.Dispose();
                tablePlaceHolder.Controls.Clear();
                TablePlaceHolder2.Controls.Clear();
                
                TablePlaceHolder4.Controls.Clear();

                TablePlaceHolder5.Controls.Clear();

                TablePlaceHolder8.Controls.Clear();
             

                //wypełnianie lebeli
                string path = Server.MapPath("XMLHeaders") + "\\" + "MSS1o.xml";
                Label tblControl = new Label { ID = "kod01" };
                tblControl.Width = 1150;
                Label tblControl2 = new Label { ID = "kod02" };
                tblControl2.Width = 1150;
                Label tblControl3 = new Label { ID = "kod03" };
                tblControl3.Width = 1150;
                Label tblControl4 = new Label { ID = "kod04" };
                tblControl4.Width = 1150;
                Label tblControl5 = new Label { ID = "kod05" };
                tblControl5.Width = 1150;
                Label tblControl7 = new Label { ID = "kod07" };
                tblControl7.Width = 1150;
                Label tblControl8 = new Label { ID = "kod08" };
                tblControl8.Width = 1150;
                Label tblControl9 = new Label { ID = "kod09" };
                tblControl9.Width = 1150;
                StringBuilder tabelaGlowna = new StringBuilder();
                tabelaGlowna.Clear();
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.1.1", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.1.1.a", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.1.2", tabela2, tenPlik));

                tblControl.Text = tabelaGlowna.ToString();
                tablePlaceHolder.Controls.Clear();
                tablePlaceHolder.Controls.Add(tblControl);
                tabelaGlowna.Clear();
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.1.f", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.1.g", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.1.h", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.1.j", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.1.k", tabela2, tenPlik));
                tblControl9.Text = tabelaGlowna.ToString();
                PlaceHolder1f.Controls.Add(tblControl9);

                tabelaGlowna.Clear();
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.1.z.z", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.1.z.z.z", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.1.3", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.2.1", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.2.2", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.3.a", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.3.b", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.3.c", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.3", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.4.1", tabela2, tenPlik));
                //  tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.4.2", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "2.1.1", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "2.1.1.1", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "2.1.1.a", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "2.1.1.a.1", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "2.1.2", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "2.1.2.1", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "2.2", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "2.2.a", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "2.2.1", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "2.2.1.a", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "2.3", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "2.3.1", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "3", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "4.1.a", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "4.1.b", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "4.2", tabela2, tenPlik));
                tblControl2.Text = tabelaGlowna.ToString();

                TablePlaceHolder2.Controls.Add(tblControl2);
               

                tabelaGlowna.Clear();
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "8.3", tabela2, tenPlik));
                tblControl4.Text = tabelaGlowna.ToString();
                TablePlaceHolder4.Controls.Add(tblControl4);
                tabelaGlowna.Clear();
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.1.o.1", tabela2, tenPlik));
                tabelaGlowna.AppendLine(ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "1.1.o.2", tabela2, tenPlik));
                tblControl5.Text = tabelaGlowna.ToString();
                TablePlaceHolder5.Controls.Add(tblControl5);

                TablePlaceHolder8.Controls.Clear();
                TablePlaceHolder8.Controls.Add(new Label { Text = ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "7.1.a", tabela2, tenPlik) });

                TablePlaceHolder8.Controls.Add(new Label { Text = ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "7.2", tabela2, tenPlik) });
                TablePlaceHolder10.Controls.Clear();
                TablePlaceHolder10.Controls.Add(new Label { Text = ms.odczytXML(path, int.Parse((string)Session["id_dzialu"]), "10", tabela2, tenPlik) });

                tablePlaceHolder.Dispose();
                TablePlaceHolder2.Dispose();
               
                TablePlaceHolder4.Dispose();
                TablePlaceHolder5.Dispose();
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " " + ex.Message);
            }
        }

        protected void odswiez()
        {
            string idWydzialu = "'" + (string)Session["id_dzialu"] + "'";       
            DataTable tabela2 = ms.generuj_dane_do_tabeli_mss2(int.Parse((string)Session["id_dzialu"]), Date1.Date, Date2.Date, 40);
            rysuj(tabela2);
          
        }

        protected void LinkButton54_Click(object sender, EventArgs e)
        {
            odswiez();
        }

        private string wyciagnijWartosc(DataTable ddT, string selectString)
        {
            string result = "0";

            if (ddT == null)
            {
                return result;
            }
            try
            {
                DataRow[] foundRows;
                foundRows = ddT.Select(selectString);
                if (foundRows.Count() != 0)
                {
                    DataRow dr = foundRows[0];
                    result = dr[4].ToString();
                }
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " - wyciagnij wartosc -  " + ex.Message);
            }
            return result;
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
                    DataTable tabela2 = ms.generuj_dane_do_tabeli_mss2(int.Parse((string)Session["id_dzialu"]), Date1.Date, Date2.Date, 40);
                    //    DataTable tabela2 = cl.generuj_dane_do_tabeli_mss2(int.Parse((string)Session["id_dzialu"]), Date1.Date, Date2.Date, 100, tenPlik); //dane
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
                    //  output.AppendLine("Id formularza;Okres;Sąd;Wydział ;Dział;Wiersz;Kolumna;Liczba");

                    output = ms.raportTXT(listaTabelek, tabela2, idRaportu.Text.Trim(), idSad.Text);

                    Response.Clear();
                    Response.Buffer = true;
                    Response.ContentType = "application/text";
                    Response.AddHeader("Content-Disposition", "attachment;filename=" + idRaportu.Text.Trim() + ".csv");
                    Response.Output.Write(output);
                    //  Response.WriteFile(idRaportu + ".csv");
                    Response.Flush();
                    Response.End();
                }
            }
            catch (Exception ex)
            {
                cm.log.Error(tenPlik + " generowanie pliku .csv " + ex.Message);
            }
        }

        protected void pisz(string Template, int iloscWierszy, int iloscKolumn, DataTable dane, string idTabeli, string idWydzialu)
        {
            for (int wiersz = 1; wiersz <= iloscWierszy; wiersz++)
            {
                for (int kolumna = 1; kolumna <= iloscKolumn; kolumna++)
                {
                    string controlName = Template + "w" + wiersz.ToString("D2") + "_c" + kolumna.ToString("D2");
                    var cos = this.Master.FindControl("ContentPlaceHolder1");
                    Label tb = (Label)this.Master.FindControl("ContentPlaceHolder1").FindControl(controlName);
                    if (tb != null)
                    {
                        //string wartosc= dr.wyciagnijWartosc(dane, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza ='" + wiersz + "' and idkolumny='" + kolumna + "'", tenPlik);
                        tb.Text = dr.wyciagnijWartosc(dane, "idWydzial=" + idWydzialu + " and idTabeli=" + idTabeli + " and idWiersza ='" + wiersz + "' and idkolumny='" + kolumna + "'", tenPlik);
                    }
                }
            }
        }// end of pisz
    }
}