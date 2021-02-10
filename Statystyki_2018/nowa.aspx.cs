using DevExpress.Web;
using DevExpress.XtraPrinting;
using System;
using System.Data;
using System.Drawing;

namespace Statystyki_2018
{
    public partial class nowa : System.Web.UI.Page
    {
        public wyszukiwarka w1 = new wyszukiwarka();
        public common cm = new common();

        protected void Page_Load(object sender, EventArgs e)
        {
            //Bind the grid only once
            if (!IsPostBack)
            {
                // if (Session["valueX"] == null)
                //  {
                Session["valueX"] = Request.QueryString["id"];
                //  }
                DateTime dTime = DateTime.Now.AddMonths(-1);

                string ident = (string)Session["valueX"];
                if (string.IsNullOrEmpty(ident))
                {
                    return;
                }

                DataTable parameters = cm.makeParameterTable();
                parameters.Rows.Add("@ident", ident);

                DateTime dataOd = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-01");
                try
                {
                    dataOd = DateTime.Parse(cm.getQuerryValue("SELECT Data_od FROM konfig  WHERE (ident = @ident)", cm.con_str, parameters));
                }
                catch
                { }

                if (data1.Text.Length == 0)
                {
                    data1.Date = dataOd;
                }

                if (data2.Text.Length == 0)
                {
                    data2.Date = DateTime.Parse(dTime.Year.ToString() + "-" + dTime.Month.ToString("D2") + "-" + DateTime.DaysInMonth(dTime.Year, dTime.Month).ToString("D2"));
                }

                grid.DataBind();
                DataBindX();
            }
        }

        protected void szukaj(object sender, EventArgs e)
        {
            grid.DataBind();
        }

        protected void Druk(object sender, EventArgs e)
        {
            string ident = (string)Session["valueX"];

            ASPxGridViewExporter1.Landscape = true;

            DataTable parameters = cm.makeParameterTable();
            parameters.Rows.Add("@ident", ident);
            string nazwa = string.Empty;

            try
            {
                nazwa = cm.getQuerryValue("SELECT opis FROM konfig  WHERE (ident = @ident)", cm.con_str, parameters);
            }
            catch
            { }
            ASPxGridViewExporter1.ReportHeader = nazwa;
            Session["exporter"] = ASPxGridViewExporter1;
            ASPxGridViewExporter1.LeftMargin = 5;
            ASPxGridViewExporter1.RightMargin = 5;
            ASPxGridViewExporter1.TopMargin = 0;
            ASPxGridViewExporter1.BottomMargin = 0;
            ASPxGridViewExporter1.WritePdfToResponse("kontrolka-" + DateTime.Now.ToShortDateString());
            //   ScriptManager.RegisterStartupScript(Page, Page.GetType(), "print2", "JavaScript:window.open('kontrolkaDruk.aspx')", true);
        }

        protected void dataBinding(object sender, EventArgs e)
        {
            DataBindX();
        }

        private DataTable GetTable(DateTime dataPoczatkowa, DateTime dataKoncowa, string ident, string tenPlik)
        {
            DataTable parameters = cm.makeParameterTable();

            parameters.Rows.Add("@ident", ident);
            string kw = cm.getQuerryValue("SELECT wartosc FROM            konfig  WHERE        (ident = @ident)", cm.con_str, parameters);
            string cs = cm.getQuerryValue("SELECT ConnectionString FROM            konfig  WHERE        (ident = @ident)", cm.con_str, parameters);

            parameters.Rows.Add("@data_1", dataPoczatkowa);
            parameters.Rows.Add("@data_2", dataKoncowa);
            DataTable dT = new DataTable();
            try
            {
                dT = cm.getDataTable(kw, cs, parameters, tenPlik);
                int ilr = dT.Rows.Count;
            }
            catch (Exception)
            {
            }

            return dT;
        }

        protected void Excell(object sender, EventArgs e)
        {
            ASPxGridViewExporter1.WriteXlsxToResponse("kontrolka - " + DateTime.Now.ToShortDateString());
            /*ASPxGridViewExporter1.DataBind();
            Session["exporter"] = ASPxGridViewExporter1;
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "print2", "JavaScript:window.open('kontrolkaExcell.aspx')", true);
      */
        }

        protected void ASPxGridViewExporter1_RenderBrick(object sender, DevExpress.Web.ASPxGridViewExportRenderingEventArgs e)
        {
            StringFormat sFormat = new StringFormat(StringFormatFlags.NoWrap);
            BrickStringFormat brickSFormat = new BrickStringFormat(sFormat);
            e.XlsxFormatString = sFormat.ToString();
        }

        private void DataBindX()
        {
            string ident = (string)Session["valueX"];
            if (string.IsNullOrEmpty(ident))
            {
                return;
            }
            DataTable dane = GetTable(data1.Date, data2.Date, ident, "databind");
            grid.DataSource = dane;
            try
            {
                grid.SettingsPager.PageSize = int.Parse(cm.odczytajWartosc("kontrolka_wiersze"));
            }
            catch
            {
                grid.SettingsPager.PageSize = 500;
            }
            DataTable parameters = cm.makeParameterTable();
            parameters.Rows.Add("@ident", ident);
            int szerokoscKolumny = 0;
            int rozmiarCzcionki = 0;
            int szerokosctabeli = 0;

            try
            {
                szerokoscKolumny = int.Parse(cm.getQuerryValue("SELECT szerokoscKolumny FROM            konfig  WHERE        (ident = @ident)", cm.con_str, parameters));
            }
            catch
            { }
            try
            {
                rozmiarCzcionki = int.Parse(cm.getQuerryValue("SELECT rozmiarczcionki FROM            konfig  WHERE        (ident = @ident)", cm.con_str, parameters));
            }
            catch
            { }
            try
            {
                szerokosctabeli = int.Parse(cm.getQuerryValue("SELECT szerokosctabeli FROM            konfig  WHERE        (ident = @ident)", cm.con_str, parameters));
            }
            catch
            { }
            cm.log.Info("Kontrolka -rozmiar czcionki: " + rozmiarCzcionki.ToString());
            cm.log.Info("Kontrolka -szerokosc Kolumny: " + szerokoscKolumny.ToString());
            cm.log.Info("Kontrolka -szerokosc tabeli: " + szerokosctabeli.ToString());
            Session["rozmiarCzcionki"] = rozmiarCzcionki;
            Session["szerokoscKolumny"] = szerokoscKolumny;
            Session["szerokosctabeli"] = szerokosctabeli;

            for (int i = 0; i < grid.Columns.Count; i++)
            {
                if (rozmiarCzcionki > 0)
                {
                    grid.Columns[i].CellStyle.Font.Size = rozmiarCzcionki;
                }
                if (szerokoscKolumny > 0)
                {
                    grid.Columns[i].Width = szerokoscKolumny;
                    grid.Columns[i].MinWidth = szerokoscKolumny;
                    grid.Style.Add("width", szerokoscKolumny.ToString());
                    grid.Style.Add("min-width", szerokoscKolumny.ToString());
                }
            }

            try
            {
                if (szerokosctabeli > 0)
                {
                    grid.Width = szerokosctabeli;
                }
            }
            catch
            { }

            foreach (GridViewDataColumn dCol in grid.Columns)
            {
                string name = dCol.Name;
                Type typ = dCol.GetType();
                Type typRef = typeof(DateTime);
                GridViewDataColumn id = new GridViewDataColumn();
                id.FieldName = name;
                //  grid.Columns.Add(id);
                cm.log.Info("kontrolka reftype: " + typRef.FullName);
                cm.log.Info("kontrolka type: " + typ.FullName);
                if (typ == typRef)
                {
                    grid.DataColumns[name].SettingsHeaderFilter.Mode = GridHeaderFilterMode.DateRangePicker;
                    grid.DataColumns[name].Settings.AllowHeaderFilter = DevExpress.Utils.DefaultBoolean.True;
                }
            }
            foreach (GridViewDataColumn col in grid.Columns)
            {
                if (col is GridViewDataColumn)
                {
                    ((GridViewDataColumn)col).Settings.AutoFilterCondition = AutoFilterCondition.Contains;
                }
            }
            ASPxGridViewExporter1.DataBind();
        }
    }
}