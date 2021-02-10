using System;
using System.Data;

namespace Statystyki_2018
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        private common cm = new common();
        public Header naglowek = new Header();

        protected void Page_Load(object sender, EventArgs e)
        {
            cm.log.Info("start tworzenia Ste1   " + DateTime.Now.ToLongTimeString());
            if (!IsPostBack)
            {
                String IdentyfikatorUzytkownika = string.Empty;
                try
                {
                    //cm.log.Info("Site1.Master: Przypisanie identyfikatora uzytkownika");
                    IdentyfikatorUzytkownika = (string)Session["identyfikatorUzytkownika"];

                    int userDigitalId = 0;
                    try
                    {
                        userDigitalId = int.Parse(IdentyfikatorUzytkownika);
                    }
                    catch
                    {
                        cm.log.Error("Site1.Master:Brak przeniesienia z logowania identyfikatora numerycznego Użytkownika! ");
                    }
                    //cm.log.Info("Site1.Master: Identyfikatora uzytkownika: " + IdentyfikatorUzytkownika);
                }
                catch
                {
                    cm.log.Error("Site1.Master: Nie przypisanoe identyfikatora użytkownika");
                }

                //SPRAWDZENIE CZY POPRZEDNI I OBECNY UZYTKOWNIK SA TAKIE SAME
                try
                {
                    if (!string.IsNullOrEmpty(IdentyfikatorUzytkownika.Trim()))
                    {
                        string poprzedniUzytkownik = (string)Session["poprzedniUzytkownik"];
                        if ((string.Equals(poprzedniUzytkownik, IdentyfikatorUzytkownika)) && (Session["manu1"] != null))
                        {
                            cm.log.Info("start tworzenia menu   " + DateTime.Now.ToLongTimeString());
                            wypelnijMenu();
                            cm.log.Info("koniec tworzenia manu   " + DateTime.Now.ToLongTimeString());
                        }
                        else
                        {
                            //nowy user
                            cm.log.Info("start tworzenia menu  daneDoManuMiesieczne  " + DateTime.Now.ToLongTimeString());
                            Session["manu1"] = naglowek.daneDoManuMiesieczne(IdentyfikatorUzytkownika);
                            cm.log.Info("start tworzenia menu  daneDoManuKontrolek " + DateTime.Now.ToLongTimeString());
                            Session["manu2"] = naglowek.daneDoManuKontrolek(IdentyfikatorUzytkownika);
                            cm.log.Info("start tworzenia menu  daneDoManuMSS " + DateTime.Now.ToLongTimeString());
                            Session["manu3"] = naglowek.daneDoManuMSS(IdentyfikatorUzytkownika);
                            cm.log.Info("start tworzenia menu daneDoManuInne  " + DateTime.Now.ToLongTimeString());
                            Session["manu4"] = naglowek.daneDoManuInne(IdentyfikatorUzytkownika);

                            cm.log.Info("start tworzenia menu wyloguj  " + DateTime.Now.ToLongTimeString());
                            Session["manu5"] = naglowek.wyloguj();
                            wypelnijMenu();
                            cm.log.Info("koniec tworzenia manu   " + DateTime.Now.ToLongTimeString());
                        }
                    }
                }
                catch (Exception ex)
                {
                    cm.log.Error(ex.Message);
                }

                Label1.Text = (string)Session["daneUzytkownika"];
                Session["poprzedniUzytkownik"] = IdentyfikatorUzytkownika;
            }
        }

        private void wypelnijMenu()
        {
            ASPxPopupMenu1.Items.Clear();
            ASPxPopupMenu1.RootItem.Items.Add((DevExpress.Web.MenuItem)Session["manu1"]);
            ASPxPopupMenu1.RootItem.Items.Add((DevExpress.Web.MenuItem)Session["manu2"]);
            ASPxPopupMenu1.RootItem.Items.Add((DevExpress.Web.MenuItem)Session["manu3"]);
            ASPxPopupMenu1.RootItem.Items.Add((DevExpress.Web.MenuItem)Session["manu4"]);
            try
            {
                string identyfikatorUzytkownika = (string)Session["identyfikatorUzytkownika"];

                try
                {
                    string admin = string.Empty;
                    DataTable parametry = cm.makeParameterTable();
                    parametry.Rows.Add("@identyfikatorUzytkownika", identyfikatorUzytkownika);
                    //log.Info("Header: Sprawdz czy użytkownik " + identyfikatorUzytkownika + " ma parawa administratora" );
                    admin = "0";
                    admin = cm.getQuerryValue("select admin from uzytkownik where ident =@identyfikatorUzytkownika", cm.con_str, parametry, "SiteMAster");
                    //log.Info("Header: Użytkownik ma prawa administracyjne");
                    if (admin != "0")
                    {
                        ASPxPopupMenu1.RootItem.Items.Add(naglowek.daneDoManuAdmin());
                    }
                }
                catch
                { }

                ASPxPopupMenu1.RootItem.Items.Add((DevExpress.Web.MenuItem)Session["manu5"]);
            }
            catch (Exception)
            {
            }
        }

        protected void ASPxPopupMenu1_ItemClick(object source, DevExpress.Web.MenuItemEventArgs e)
        {
            string txt = e.Item.Name;
            Session["id_dzialu"] = txt;
        }
    }
}