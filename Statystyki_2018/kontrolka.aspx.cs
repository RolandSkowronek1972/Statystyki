using DevExpress.Web;
using DevExpress.XtraPrinting;
using System;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Web.UI;

namespace Statystyki_2018
{
    public partial class kontrolka : System.Web.UI.Page
    {
        public Class1 cl = new Class1();
        public wyszukiwarka w1 = new wyszukiwarka();
        public common cm = new common();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && !IsCallback)
            {
                string kw = string.Empty;
                string cs = string.Empty;
                int szerokoscKolumny = 0;
                int rozmiarCzcionki = 0;
                int szerokosctabeli = 0;
                string value = Request.QueryString["id"];
                string errorMessage = Request.QueryString["info"];
                try
                {
                    ASPxGridView1.SettingsPager.PageSize = int.Parse(cm.odczytajWartosc("kontrolka_wiersze"));
                }
                catch
                {
                    ASPxGridView1.SettingsPager.PageSize = 500;
                }

                if (value != null)
                {
                    // wgrac kwerende
                    DataTable parameters = cm.makeParameterTable();
                    parameters.Rows.Add("@ident", value);
                    kw = cm.getQuerryValue("SELECT wartosc FROM            konfig  WHERE        (ident = @ident)", cm.con_str, parameters);
                    cs = cm.getQuerryValue("SELECT ConnectionString FROM            konfig  WHERE        (ident = @ident)", cm.con_str, parameters);
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
                    catch (Exception)
                    { }
                    try
                    {
                        szerokosctabeli = int.Parse(cm.getQuerryValue("SELECT szerokosctabeli FROM            konfig  WHERE        (ident = @ident)", cm.con_str, parameters));
                    }
                    catch (Exception)
                    { }

                    Session["rozmiarCzcionki"] = rozmiarCzcionki;
                    Session["szerokoscKolumny"] = szerokoscKolumny;
                    Session["szerokosctabeli"] = szerokosctabeli;

                    Session["cs"] = cs;
                    Session["kw"] = kw;
                }
                else
                {
                    Server.Transfer("default.aspx");
                }
                try
                {
                    string land = System.Globalization.CultureInfo.CurrentCulture.Name;
                    var fileContents = System.IO.File.ReadAllText(Server.MapPath(@"~//version.txt"));
                    this.Title = "Kontrolka " + fileContents.ToString().Trim();
                    string txt = (string)Session["user_id"];//userIdNum
                    if (string.IsNullOrEmpty((txt)))
                    {
                        Server.Transfer("default.aspx");
                    }
                }
                catch (Exception ex)
                {
                    cm.log.Error("kontrolka Bład: " + ex.Message);
                }
                CultureInfo newCulture = (CultureInfo)CultureInfo.CurrentCulture.Clone();
                newCulture.DateTimeFormat = CultureInfo.GetCultureInfo("PL").DateTimeFormat;
                System.Threading.Thread.CurrentThread.CurrentCulture = newCulture;
                System.Threading.Thread.CurrentThread.CurrentUICulture = newCulture;
                if (string.IsNullOrEmpty(data1.Text.Trim()))
                {
                    data1.Date = DateTime.Parse(DateTime.Parse(DateTime.Now.Year.ToString() + "-01-01").ToShortDateString());
                }
                if (string.IsNullOrEmpty(data2.Text.Trim()))
                {
                    data2.Date = DateTime.Now;
                }

                cm.log.Info("Kontrolka uruchomienie przeliczania formularza ");
                makeGrid(cs, kw);
            }
            else
            {
                ASPxGridView1.DataBind();
            }
        }

        protected void makeGrid(string connectionString, string kwerenda)
        {
            // odczytaj dane
            try
            {
                SqlDataSource1.ConnectionString = connectionString;
            }
            catch (Exception)
            { }
            DataTable parameters = cm.makeParameterTable();
            parameters.Rows.Add("@data_1", cl.KonwertujDate(data1.Date));
            parameters.Rows.Add("@data_2", cl.KonwertujDate(data2.Date));
            DataTable dT = cm.getDataTable(kwerenda, connectionString, parameters, "kontrolka");

            Session["data1"] = cl.KonwertujDate(data1.Date);
            Session["data2"] = cl.KonwertujDate(data2.Date);
            ASPxGridView1.DataBind();
        }

        protected void szukaj(object sender, EventArgs e)
        {
            try
            {
                string connectionString = (string)Session["cs"];
                string kwerenda = (string)Session["kw"];

                makeGrid(connectionString, kwerenda);
            }
            catch
            { }
        }

        protected void Druk(object sender, EventArgs e)
        {
            Session["exporter"] = ASPxGridViewExporter1;
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "print2", "JavaScript:window.open('kontrolkaDruk.aspx')", true);
        }

        protected void GridDataBinding(object sender, EventArgs e)
        {
            string kwerenda = (string)Session["kw"];
            string connectionString = (string)Session["cs"];

            DataTable parameters = cm.makeParameterTable();
            parameters.Rows.Add("@data_1", cl.KonwertujDate(data1.Date));
            parameters.Rows.Add("@data_2", cl.KonwertujDate(data2.Date));
            DataTable dT = cm.getDataTable(kwerenda, connectionString, parameters, "wyszukiwarka");

            Session["data1"] = data1.Text.Trim();
            Session["data2"] = data2.Text.Trim();

            ASPxGridView1.Columns.Clear();
            ASPxGridView1.DataSource = null;
            ASPxGridView1.DataSource = dT;

            foreach (DataColumn dCol in dT.Columns)
            {
                string name = dCol.ColumnName;
                Type typ = dCol.DataType;
                Type typRef = typeof(DateTime);
                GridViewDataColumn id = new GridViewDataColumn();
                id.FieldName = name;
                ASPxGridView1.Columns.Add(id);
                if (typ == typRef)
                {
                    ASPxGridView1.DataColumns[name].SettingsHeaderFilter.Mode = GridHeaderFilterMode.DateRangePicker;
                    ASPxGridView1.DataColumns[name].Settings.AllowHeaderFilter = DevExpress.Utils.DefaultBoolean.True;
                }
            }

            if (ASPxGridView1.Columns.Count > 0)
            {
                ASPxGridView1.KeyFieldName = ASPxGridView1.Columns[0].Name;
            }
        }

        protected void ASPxGridViewExporter1_RenderBrick(object sender, ASPxGridViewExportRenderingEventArgs e)
        {
            StringFormat sFormat = new StringFormat(StringFormatFlags.NoWrap);
            BrickStringFormat brickSFormat = new BrickStringFormat(sFormat);
            e.XlsxFormatString = sFormat.ToString();
        }

        protected void Excell(object sender, EventArgs e)
        {
            Session["exporter"] = ASPxGridViewExporter1;
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "print2", "JavaScript:window.open('kontrolkaExcell.aspx')", true);
        }
    }
}