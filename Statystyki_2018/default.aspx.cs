using System;
using System.DirectoryServices.AccountManagement;

namespace Statystyki_2018
{
    public partial class _default : System.Web.UI.Page
    {
        public logowanie Logowanie = new logowanie();
        public log_4_net log = new log_4_net();

        protected void Page_Load(object sender, EventArgs e)
        {
            string value = Request.QueryString["logout"];
            if (value != null)
            {
                if (value == "true")
                {
                    Session["user_id"] = null;
                    Session["id_dzialu"] = null;
                    Session["data_1"] = null;
                    Session["data_2"] = null;
                    Session["userIdNum"] = null;
                    Session["ustawDate15o"] = null;
                    Session.Abandon();
                    Response.Redirect("default.aspx");
                    
                }
            }
            string errorMessage = Request.QueryString["info"];
            if (errorMessage != null)
            {
                ErrorBox.Visible = true;
                ErrorBox.Text = errorMessage;
            }
            else
            {
                ErrorBox.Visible = false;
            }
            if (value == null)
            {
                //URL nie zawierał parametru ‘key’
            }
            else
            {
                Session["user_id"] = null;
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            zaloguj();
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            zaloguj();
        }

        protected void zaloguj()
        {
            log.Info("uruchomienie logowania");

            bool result = true;
            log.Info("rozpoczecie logowania "+ DateTime.Now.ToLongTimeString());
            try
            {
                using (PrincipalContext pc = new PrincipalContext(ContextType.Domain, TextBox3.Text.Trim()))
                {
                    try
                    {
                        log.Info("rozpoczecie logowania domenowego " + DateTime.Now.ToLongTimeString());
                        result = pc.ValidateCredentials(TextBox1.Text.Trim(), TextBox2.Text.Trim());
                        if (result)
                        {
                            log.Info("wynik logowania domenowego " + DateTime.Now.ToLongTimeString());
                            log.Info("Logowanie domenowe się powiodło");
                            Session["damain"] = "1";
                            string id = Logowanie.podajIdUzytkownikaDomenowego(TextBox1.Text);
                            Session["user_id"] = TextBox1.Text.Trim();
                            Session["userIdNum"] = id;
                            Session["identyfikatorUzytkownika"] = id;
                            Session["daneUzytkownika"] = Logowanie.PodajDaneUzytkownika(TextBox1.Text.Trim());
                        }
                        else
                        {
                            log.Info("rozpoczecie logowania z bazy danych " + DateTime.Now.ToLongTimeString());
                            Session["damain"] = "0";
                            //log.Info("Logowanie użytkowników z bazy danych");
                            string id = Logowanie.loguj(TextBox1.Text.Trim(), TextBox2.Text.Trim());
                            log.Info("wynik logowania z bazy danych " + DateTime.Now.ToLongTimeString());
                            int ident = 0;
                            try
                            {
                                ident = int.Parse(id);
                            }
                            catch
                            {
                               
                            }
                            if (ident > 0)
                            {
                                log.Info("uzytkownik zgodny " + DateTime.Now.ToLongTimeString());
                                //log.Info("Logowanie poprawne!!! identyfikator użytkownika: " + TextBox1.Text.Trim() + " identyfikator: " + id);
                                result = true;
                                Session["user_id"] = TextBox1.Text.Trim();
                                Session["userIdNum"] = id;
                                Session["identyfikatorUzytkownika"] = id;
                                Session["daneUzytkownika"] = Logowanie.PodajDaneUzytkownika(TextBox1.Text.Trim());
                            }
                            else
                            {
                                log.Error("Logowanie nie poprawne!!! Użytkownik: " + TextBox1.Text.Trim() + " podał niepoprawne hasło lub nie istanieje na liście użytkowników");
                            }
                        }
                    }
                    catch
                    {
                        log.Info("Logowanie niepoprawne !!! Użytkownik: " + TextBox1.Text.Trim() + " podał niepoprawne hasło lub nie istanieje na liście użytkowników");
                    }
                }
            }

            catch

            {
                log.Info("bład logowania domenowego  " + DateTime.Now.ToLongTimeString());

                //log.Error("Logowanie domenowe się nie powiodło");
                Session["damain"] = "0";
                //log.Info("Logowanie użytkowników z bazy danych");
                log.Info("próba logowania z bazy  " + DateTime.Now.ToLongTimeString());
                string id = Logowanie.loguj(TextBox1.Text.Trim(), TextBox2.Text.Trim());
                if (id != "")
                {
                    log.Info("logowania z bazy poprawne  " + DateTime.Now.ToLongTimeString());
                     result = true;
                    Session["user_id"] = TextBox1.Text.Trim();
                    Session["userIdNum"] = id;
                    Session["identyfikatorUzytkownika"] = id;
                    Session["daneUzytkownika"] = Logowanie.PodajDaneUzytkownika(TextBox1.Text.Trim());
                }
                else
                {
                    result = false;
                }
                // Label3.Text = ex.Message; ;
            }

            if (result)
            {
                Session["manu1"] = null;
                Session["manu2"] = null;
                Session["manu3"] = null;
                Session["manu4"] = null;
                Session["user_id"] = TextBox1.Text.Trim();
                log.Info("uruchomienie  redirector.aspx " + DateTime.Now.ToLongTimeString());
                Server.Transfer("redirector.aspx");
            }
            else
            {
                ASPxPopupControl1.ShowOnPageLoad = true;
                //     Label3.Text = Label3.Text + " Wrong username or password";
            }
        }
    }
}