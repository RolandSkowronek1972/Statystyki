using DevExpress.Web;
using Statystyki_2018;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace stat2018
{
    public partial class mp2 : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public common cm = new common();

        private const string tenPlik = "mp2.aspx";

        protected void Page_Load(object sender, EventArgs e)
        {
            string idWydzial = Request.QueryString["w"]; 
            Session["czesc"] = cm.nazwaFormularza(tenPlik, idWydzial);
            try
            {
                if (idWydzial == null)
                {
                    Server.Transfer("default.aspx");
                    return;
                }
                String IdentyfikatorUzytkownika = string.Empty;
                IdentyfikatorUzytkownika = (string)Session["identyfikatorUzytkownika"];
                DataTable parametry = cm.makeParameterTable();
                parametry.Rows.Add("@identyfikatorUzytkownika", IdentyfikatorUzytkownika);
                int idWydzialInt = 0;
                try
                {
                    idWydzialInt = int.Parse(idWydzial);
                }
                catch (Exception)
                {

                    return;
                }
                DateTime dTime = DateTime.Now.AddMonths(-1); ;

                if (Date1.Text.Length == 0) Date1.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-01");
                if (Date2.Text.Length == 0) Date2.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-" + DateTime.DaysInMonth(dTime.Year, dTime.Month).ToString("D2"));
                Session["id_dzialu"] = idWydzial;
                Session["data_1"] = Date1.Date.ToShortDateString();
                Session["data_2"] = Date2.Date.ToShortDateString();

                Session["czesc"] = cm.nazwaFormularza(tenPlik, idWydzial);

                if (!IsPostBack)
                {


                    string cs = cl.podajConnectionString(idWydzialInt);
                    odswiez(cl.podajConnectionString(idWydzialInt), Date1.Date.ToShortDateString(), Date2.Date.ToShortDateString(), idWydzialInt);
                 

                }


            }
            catch
            { 
            
            }

        }

        private void odswiez(string cs, string DateBegin, string DateEnd, int idWydzialInt)
        {
            ASPxGridView1.DataSource = null;
            ASPxGridView1.DataSourceID = null;
            ASPxGridView1.AutoGenerateColumns = true;
            ASPxGridView1.Columns.Clear();
            DataTable dataTable1 = tabela(idWydzialInt, 1, DateBegin, DateEnd, cs);
            string dColumn = string.Empty;

            ASPxGridView1.DataSource = dataTable1;
            ASPxGridView1.DataBind();

            ASPxGridView2.DataSource = null;
            ASPxGridView2.DataSourceID = null;
            ASPxGridView2.AutoGenerateColumns = true;
            ASPxGridView2.Columns.Clear();
            ASPxGridView2.DataSource = tabela(idWydzialInt, 2, DateBegin, DateEnd, cs);
            ASPxGridView2.DataBind();


            ASPxGridView3.DataSource = null;
            ASPxGridView3.DataSourceID = null;
            ASPxGridView3.AutoGenerateColumns = true;
            ASPxGridView3.Columns.Clear();
            ASPxGridView3.DataSource = tabela(idWydzialInt, 3, DateBegin, DateEnd, cs);
            ASPxGridView3.DataBind();

            ASPxGridView4.DataSource = null;
            ASPxGridView4.DataSourceID = null;
            ASPxGridView4.AutoGenerateColumns = true;
            ASPxGridView4.Columns.Clear();
            ASPxGridView4.DataSource = tabela(idWydzialInt, 4, DateBegin, DateEnd, cs);
            ASPxGridView4.DataBind();

            ASPxGridView5.DataSource = null;
            ASPxGridView5.DataSourceID = null;
            ASPxGridView5.AutoGenerateColumns = true;
            ASPxGridView5.Columns.Clear();
            ASPxGridView5.DataSource = tabela(idWydzialInt, 5, DateBegin, DateEnd, cs);
            ASPxGridView5.DataBind();

            ASPxGridView6.DataSource = null;
            ASPxGridView6.DataSourceID = null;
            ASPxGridView6.AutoGenerateColumns = true;
            ASPxGridView6.Columns.Clear();
            ASPxGridView6.DataSource = tabela(idWydzialInt, 6, DateBegin, DateEnd, cs);
            ASPxGridView6.DataBind();

            OpisTabeli01.Text = OpisTabeli(1, idWydzialInt);
            OpisTabeli02.Text = OpisTabeli(2, idWydzialInt);
            OpisTabeli03.Text = OpisTabeli(3, idWydzialInt);
            OpisTabeli04.Text = OpisTabeli(4, idWydzialInt);
            OpisTabeli05.Text = OpisTabeli(5, idWydzialInt);
            OpisTabeli06.Text = OpisTabeli(6, idWydzialInt);
        }

        private string OpisTabeli(int idTabeli, int  idWydzialu)
        {
            DataTable parametry = cm.makeParameterTable();
            parametry.Rows.Add("@ident", idWydzialu);



            parametry.Rows.Add("@id_tabeli", idTabeli);
            
            var opis = cm.getQuerryValue("SELECT  distinct    opis FROM         kwerendy where  id_wydzial =@ident and id_tabeli = @id_tabeli and id_wiersza=0 and id_kolumny=0", cm.con_str, parametry);

            return opis;

        }

        protected DataTable tabela(int idDzialu,int IdTabeli, string data_1, string data_2, string ConnectionString)
        {
            
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli 1");
            }
  
            DataTable parametry = cm.makeParameterTable();
            parametry.Rows.Add("@ident", idDzialu);
          
            parametry.Rows.Add("@id_tabeli", IdTabeli);
            var kw= cm.getQuerryValue("SELECT  distinct  kwerenda   FROM kwerendy where  id_wydzial =@ident and id_tabeli = @id_tabeli and id_wiersza=0 and id_kolumny=0", cm.con_str, parametry);
            if (String.IsNullOrEmpty( kw.ToString().Trim()))
            {
                return null;
            }           
            DataTable parametryDoTabeli = cm.makeParameterTable();
            parametryDoTabeli.Rows.Add("@data_1", data_1);
            parametryDoTabeli.Rows.Add("@data_2", data_2);
            DataTable dane = cm.getDataTable(kw, ConnectionString, parametryDoTabeli, tenPlik);
           
           return dane;
        }


        protected void LinkButton54_Click(object sender, EventArgs e)
        {
            string idWydzial = Request.QueryString["w"];
            int idWydzialInt = 0;
            try
            {
                idWydzialInt = int.Parse(idWydzial);
            }
            catch (Exception)
            {

                return;
            }
            string cs = cl.podajConnectionString(idWydzialInt);
            odswiez(cl.podajConnectionString(idWydzialInt), Date1.Date.ToShortDateString(), Date2.Date.ToShortDateString(), idWydzialInt);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            //Excell
        }
      
    }
}