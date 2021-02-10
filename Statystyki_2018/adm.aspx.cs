using System;
using System.Collections;
using System.Data;

namespace Statystyki_2018
{
    public partial class adm : System.Web.UI.Page
    {
        private common cm = new common();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ASPxGridView1_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
          
            IDictionaryEnumerator enumerator = e.NewValues.GetEnumerator();
            enumerator.Reset();
        }

        protected void zapisDanych(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            try
            {
                var miesieczne = e.NewValues["rodzaj"];
                var mss = e.NewValues["mss"];
                var kontrolki = e.NewValues["kontrolka"];
                var kof = e.NewValues["kof"];
                var wyszukiwarka = e.NewValues["wyszukiwarka"];
                var pracownik = e.NewValues["pracownik"];
            }
            catch (Exception ex)
            {
                var error = ex.Message;
                string blad = error.ToString();
            }
        }

        protected void startEdycji(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            Session["identyfikatorUzytkownika"] = e.EditingKeyValue.ToString();
            cm.log.Info("Administracja id uzytkownika =" + e.EditingKeyValue.ToString());
        }

        protected void startWprowadzaniaUzytkownika(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
           
            string user = cm.getQuerryValue("INSERT INTO     uzytkownik ( imie, nazwisko, login, password, login_domenowy, admin) VALUES ('','',(select max(ident)+1 from uzytkownik),'','',0); select @@IDENTITY", cm.con_str, null, "adm");
            cm.log.Info("ADM stworzono użytkownika o ident= " + user);
            Session["identyfikatorUzytkownika"] = user;
        }

        protected void wprowadzanieDoBazyDanychnowegoUsera(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            string user = string.Empty;
            string imie = string.Empty;
            string nazwisko = string.Empty;
            string login = string.Empty;
            string loginDomenowy = string.Empty;
            int admin = 0;
            try
            {
                user = (string)Session["identyfikatorUzytkownika"];
                cm.log.Info("Administracja - dodawany użytkownik " + user);
            }
            catch (Exception ex)
            {
                cm.log.Error("Administracja - dodawanie usera " + ex.Message);
            }

            try
            {
                imie = e.NewValues[0].ToString();
                cm.log.Info("Administracja - dodawany użytkownik imie " + imie);
            }
            catch (Exception ex)
            {
                cm.log.Error("Administracja - dodawanie usera imie" + ex.Message);
            }
            try
            {
                nazwisko = e.NewValues[1].ToString();
                cm.log.Info("Administracja - dodawany użytkownik nazwisko " + nazwisko);
            }
            catch (Exception ex)
            {
                cm.log.Error("Administracja - dodawanie usera nazwisko" + ex.Message);
            }
            try
            {
                login = e.NewValues[2].ToString();
                cm.log.Info("Administracja - dodawany użytkownik imie " + login);
            }
            catch (Exception ex)
            {
                cm.log.Error("Administracja - dodawanie usera login" + ex.Message);
            }
            try
            {
                loginDomenowy = e.NewValues[3].ToString();
                cm.log.Info("Administracja - dodawany użytkownik loginDomenowy " + loginDomenowy);
            }
            catch (Exception ex)
            {
                cm.log.Error("Administracja - dodawanie usera loginDomenowy" + ex.Message);
            }
            try
            {
                admin = (int)e.NewValues[4];
                cm.log.Info("Administracja - dodawany użytkownik admin " + admin);
            }
            catch (Exception ex)
            {
                cm.log.Error("Administracja - dodawanie usera admin" + ex.Message);
            }

            DataTable parametry = cm.makeParameterTable();
            parametry.Rows.Add("@ident", user);
            parametry.Rows.Add("@imie", imie);
            parametry.Rows.Add("@nazwisko", nazwisko);
            parametry.Rows.Add("@login", login);
            parametry.Rows.Add("@loginDomenowy", loginDomenowy);
            parametry.Rows.Add("@admin", admin);
            cm.runQuerry("update uzytkownik set imie=@imie, nazwisko=@nazwisko, login=@login, login_domenowy=@loginDomenowy , admin=@admin where ident=@ident", cm.con_str, parametry, "administracja - wprowadzanie uzytkownika");
            grid1.DataBind();
        }

        protected void grid1_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            string identyfikatorUzytkownika = string.Empty;
            try
            {
                identyfikatorUzytkownika = e.Values["ident"].ToString();
                cm.log.Info("Administracja - usuwanie uprawnien z uzytkownikiem ident" + identyfikatorUzytkownika);
            }
            catch (Exception ex)
            {
                cm.log.Error("Administracja - usuwanie uprawnien z uzytkownikiem " + ex.Message);
            }
            DataTable parametry = cm.makeParameterTable();
            parametry.Rows.Add("@ident", identyfikatorUzytkownika);
            cm.runQuerry("DELETE FROM uprawnienia WHERE(id_uzytkownika = @ident)", cm.con_str, parametry, "administracja - wprowadzanie uzytkownika");
            grid1.DataBind();
        }

        protected void poEdycji(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            grid1.DataBind();
            string[] klucz = new string[1];
            klucz[0] = "ident";
            string uzytkownik = (string)Session["identyfikatorUzytkownika"];
            for (int i = 0; i < grid1.VisibleRowCount; i++)
            {
                if (grid1.GetRowValues(i, klucz).ToString() == uzytkownik)
                {
                    grid1.Selection.SelectRow(i);
                }
            }
        }
    }
}