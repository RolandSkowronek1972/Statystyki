using DevExpress.Web;
using Statystyki_2018;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
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
                    odswiez(cl.podajConnectionString(idWydzialInt), Date1.Date.ToShortDateString(), Date2.Date.ToShortDateString(), idWydzialInt);
                }
            }
            catch
            { 
            
            }

        }

        private void showHideGrid(ASPxGridView aSPxGridView, DataTable dataTable)
        {

            aSPxGridView.DataSource = null;
            aSPxGridView.DataSourceID = null;
            aSPxGridView.AutoGenerateColumns = true;
            aSPxGridView.Columns.Clear();
            if (dataTable == null)
            {
                aSPxGridView.Visible = false;

            }
            else
            {
                aSPxGridView.DataSource = dataTable;
                aSPxGridView.DataBind();
                aSPxGridView.Visible = true;
            }


        }

        private void odswiez(string cs, string DateBegin, string DateEnd, int idWydzialInt)
        {
            
            showHideGrid(ASPxGridView1, tabela(idWydzialInt, 1, DateBegin, DateEnd, cs));
            showHideGrid(ASPxGridView2, tabela(idWydzialInt, 2, DateBegin, DateEnd, cs));
            showHideGrid(ASPxGridView3, tabela(idWydzialInt, 3, DateBegin, DateEnd, cs));
            showHideGrid(ASPxGridView4, tabela(idWydzialInt, 4, DateBegin, DateEnd, cs));
            showHideGrid(ASPxGridView5, tabela(idWydzialInt, 5, DateBegin, DateEnd, cs));
            showHideGrid(ASPxGridView6, tabela(idWydzialInt, 6, DateBegin, DateEnd, cs));
            showHideGrid(ASPxGridView7, tabela(idWydzialInt, 7, DateBegin, DateEnd, cs));

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

            return cm.getQuerryValue("SELECT  distinct    opis FROM kwerendy where  id_wydzial =@ident and id_tabeli = @id_tabeli and id_wiersza=0 and id_kolumny=0", cm.con_str, parametry);

        }

        protected DataTable tabela(int idDzialu,int IdTabeli, string data_1, string data_2, string ConnectionString)
        {
            
            if (cl.debug(idDzialu))
            {
                cm.log.Info(tenPlik + ": rozpoczęcie tworzenia tabeli "+ IdTabeli.ToString());
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
            return cm.getDataTable(kw, ConnectionString, parametryDoTabeli, tenPlik);
           
           
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